#!/usr/bin/env python3
"""Build MyBiss WotLK provenance data from the public Wowhead-derived cache.

The script reads T7/T8/T9 item IDs from Database.lua, joins them with the
Wrath Classic cache, and writes ItemSources.generated.lua. It never guesses
boss difficulty or raid size: those fields remain blank unless the source
dataset actually supplies them.
"""
from __future__ import annotations

import json
import re
import urllib.request
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATABASE = ROOT / "MyBiss" / "Database.lua"
OUTPUT = ROOT / "MyBiss" / "ItemSources.generated.lua"
REPORT = ROOT / "reports" / "item-sources-report.md"

CACHE_URL = (
    "https://raw.githubusercontent.com/Napalmsteak/"
    "WoW-Classic-Item-Caches/main/Wrath%20Classic%20Cache.json"
)
USER_AGENT = "MyBiss-ItemSources-Generator/1.0 (GitHub Actions)"


def download_json(url: str):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=120) as response:
        return json.loads(response.read().decode("utf-8"))


def extract_tier_ids(text: str):
    ids_by_tier = {}
    for tier in ("T7", "T8", "T9"):
        pattern = rf'MB_LoadRankedTierData\("{tier}",\s*\[\[(.*?)\]\]\)'
        match = re.search(pattern, text, flags=re.DOTALL)
        if not match:
            raise RuntimeError(f"No se encontró el bloque {tier} en Database.lua")
        ids = set()
        for line in match.group(1).splitlines():
            parts = line.strip().split("|")
            if len(parts) < 4:
                continue
            for raw_id in parts[3].split(","):
                raw_id = raw_id.strip()
                if raw_id.isdigit():
                    ids.add(int(raw_id))
        ids_by_tier[tier] = ids
    return ids_by_tier


def lua_quote(value: str) -> str:
    # Lua long-bracket strings avoid quote escaping and preserve accents.
    # Choose a delimiter level not present in the value.
    level = 0
    while True:
        equals = "=" * level
        closing = "]" + equals + "]"
        if closing not in value:
            return "[" + equals + "[" + value + closing
        level += 1


def make_lua_entry(item_id: int, item: dict) -> str:
    labels = item.get("sourceLabels") or []
    types = item.get("sourceTypes") or []
    phases = item.get("sourcePhases") or []
    bosses = item.get("bossNames") or []

    # Source arrays are parallel. Keep each source's type visible in the note.
    pairs = []
    for index, label in enumerate(labels):
        source_type = types[index] if index < len(types) else "Source"
        phase = phases[index] if index < len(phases) else None
        phase_text = f" (fase {phase})" if phase not in (None, "") else ""
        pairs.append(f"{label} [{source_type}]{phase_text}")

    instance = " / ".join(dict.fromkeys(labels)) or "Fuente registrada en Wowhead"
    boss = " / ".join(dict.fromkeys(bosses)) or "Ver nota de procedencia"
    type_summary = ", ".join(dict.fromkeys(types)) or "Tipo no especificado"
    phase_summary = ", ".join(str(p) for p in dict.fromkeys(phases) if p not in (None, ""))
    note_parts = [
        "Fuente obtenida de la base Wrath Classic derivada de Wowhead",
        "Tipo: " + type_summary,
    ]
    if pairs:
        note_parts.append("Orígenes: " + "; ".join(pairs))
    if phase_summary:
        note_parts.append("Fases de contenido: " + phase_summary)
    item_url = item.get("itemUrl")
    if item_url:
        note_parts.append("Ficha: " + item_url)
    note = ". ".join(note_parts) + "."

    fields = [
        f"    instance = {lua_quote(instance)},",
        f"    boss = {lua_quote(boss)},",
        '    difficulty = "", -- El cache no aporta dificultad individual.',
        '    raidSize = "", -- No se deduce el tamaño de banda por el nombre de la instancia.',
        f"    note = {lua_quote(note)},",
    ]
    return (
        f"-- {item_id}: {item.get('name', 'Nombre no disponible')}\\n"
        f"local existing_{item_id} = MyBissData.ItemSources[{item_id}]\\n"
        f"local pending_{item_id} = existing_{item_id} == nil\\n"
        f"if type(existing_{item_id}) == \\"string\\" and string.find(existing_{item_id}, \\"pendiente\\", 1, true) then pending_{item_id} = true end\\n"
        f"if type(existing_{item_id}) == \\"table\\" and existing_{item_id}.note and string.find(existing_{item_id}.note, \\"pendiente\\", 1, true) then pending_{item_id} = true end\\n"
        f"if pending_{item_id} then\\n"
        f"  MyBissData.ItemSources[{item_id}] = {{\\n"
        + "\\n".join(fields)
        + "\\n  }\\nend\\n"
    )


def main():
    database_text = DATABASE.read_text(encoding="utf-8")
    tiers = extract_tier_ids(database_text)
    all_ids = set().union(*tiers.values())

    items = download_json(CACHE_URL)
    by_id = {
        int(item["itemId"]): item
        for item in items
        if item.get("itemId") is not None
    }

    matched = sorted(all_ids & by_id.keys())
    missing = sorted(all_ids - by_id.keys())

    lines = [
        "--========================================================",
        "-- MY BISS - GENERATED ITEM SOURCES",
        "-- Generado automáticamente. No editar manualmente.",
        "-- Fuente: Napalmsteak/WoW-Classic-Item-Caches, Wrath Classic Cache",
        "-- Los campos de dificultad y tamaño quedan vacíos si la fuente no los declara.",
        "-- Las fuentes verificadas manualmente en ItemSources.lua tienen prioridad.",
        "--========================================================",
        "",
        "MyBissData = MyBissData or {}",
        "MyBissData.ItemSources = MyBissData.ItemSources or {}",
        "",
    ]
    for item_id in matched:
        lines.append(make_lua_entry(item_id, by_id[item_id]))
        lines.append("")

    OUTPUT.write_text("\\n".join(lines), encoding="utf-8")

    REPORT.parent.mkdir(parents=True, exist_ok=True)
    report_lines = [
        "# Informe de procedencias My Biss",
        "",
        "Generado automáticamente desde la caché Wrath Classic derivada de Wowhead.",
        "",
        "| Tier | IDs únicos | Encontrados en caché | Pendientes |",
        "|---|---:|---:|---:|",
    ]
    for tier, ids in tiers.items():
        found = len(ids & by_id.keys())
        report_lines.append(f"| {tier} | {len(ids)} | {found} | {len(ids) - found} |")
    report_lines += [
        "",
        f"- IDs únicos T7/T8/T9: **{len(all_ids)}**",
        f"- IDs con registro en caché: **{len(matched)}**",
        f"- IDs no encontrados: **{len(missing)}**",
        "",
        "## IDs no encontrados",
        "",
        ", ".join(map(str, missing)) if missing else "Ninguno.",
        "",
        "## Límites de los datos",
        "",
        "- Los nombres de instancia/fuente, tipo, fase, jefes y URL se importan del cache.",
        "- Dificultad y tamaño de banda no se inventan; quedan vacíos cuando el cache no los especifica.",
        "- Las fuentes manuales ya verificadas en ItemSources.lua conservan prioridad.",
        "- La presencia de una fuente en el cache no constituye por sí sola una comprobación separada de cada dificultad.",
        "",
        f"Cache consultado: {CACHE_URL}",
    ]
    REPORT.write_text("\\n".join(report_lines) + "\\n", encoding="utf-8")
    print(
        f"IDs únicos: {len(all_ids)}; encontrados: {len(matched)}; "
        f"pendientes: {len(missing)}"
    )


if __name__ == "__main__":
    main()
