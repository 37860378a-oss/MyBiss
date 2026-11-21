#!/usr/bin/env python3
"""Generate MyBiss WotLK item provenance from the public Wowhead-derived cache."""
from __future__ import annotations
import json
import re
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATABASE = ROOT / "MyBiss" / "Database.lua"
OUTPUT = ROOT / "MyBiss" / "ItemSources.generated.lua"
REPORT = ROOT / "reports" / "item-sources-report.md"
CACHE_URL = "https://raw.githubusercontent.com/Napalmsteak/WoW-Classic-Item-Caches/main/Wrath%20Classic%20Cache.json"


def lua_long_string(value: str) -> str:
    level = 0
    while True:
        eq = "=" * level
        if "]" + eq + "]" not in value:
            return "[" + eq + "[" + value + "]" + eq + "]"
        level += 1


def main() -> None:
    text = DATABASE.read_text(encoding="utf-8")
    tiers: dict[str, set[int]] = {}
    for tier in ("T7", "T8", "T9"):
        match = re.search(
            r'MB_LoadRankedTierData\("' + tier + r'",\s*\[\[(.*?)\]\]\)',
            text,
            flags=re.DOTALL,
        )
        if not match:
            raise RuntimeError(f"No se encontró el bloque {tier} en Database.lua")
        ids: set[int] = set()
        for line in match.group(1).splitlines():
            fields = line.strip().split("|")
            if len(fields) >= 4:
                ids.update(int(x) for x in fields[3].split(",") if x.strip().isdigit())
        tiers[tier] = ids

    all_ids = set().union(*tiers.values())
    manual_text = (ROOT / "MyBiss" / "ItemSources.lua").read_text(encoding="utf-8")
    manual_ids = {
        int(value)
        for value in re.findall(r"MB_Add(?:Item|Vendor)Source\(\s*(\d+)", manual_text)
    }
    request = urllib.request.Request(CACHE_URL, headers={"User-Agent": "MyBiss-ItemSources-Generator/1.0"})
    with urllib.request.urlopen(request, timeout=180) as response:
        cache = json.loads(response.read().decode("utf-8"))

    by_id = {int(item["itemId"]): item for item in cache if item.get("itemId") is not None}
    found = sorted(all_ids & by_id.keys())
    missing = sorted(all_ids - by_id.keys())
    manually_documented = sorted(set(missing) & manual_ids)
    unresolved = sorted(set(missing) - manual_ids)

    out = [
        "--========================================================",
        "-- MY BISS - GENERATED ITEM SOURCES",
        "-- Generado automáticamente. No editar manualmente.",
        "-- Fuente: Napalmsteak/WoW-Classic-Item-Caches, Wrath Classic Cache.",
        "-- Dificultad y tamaño de banda no se inventan: quedan vacíos si no constan.",
        "-- Las fuentes manuales verificadas en ItemSources.lua conservan prioridad.",
        "--========================================================",
        "",
        "MyBissData = MyBissData or {}",
        "MyBissData.ItemSources = MyBissData.ItemSources or {}",
        "",
    ]

    for item_id in found:
        item = by_id[item_id]
        labels = item.get("sourceLabels") or []
        types = item.get("sourceTypes") or []
        phases = item.get("sourcePhases") or []
        bosses = item.get("bossNames") or []

        source_details = []
        for i, label in enumerate(labels):
            typ = types[i] if i < len(types) else "Tipo no indicado"
            phase = phases[i] if i < len(phases) else None
            suffix = f", fase {phase}" if phase not in (None, "") else ""
            source_details.append(f"{label} ({typ}{suffix})")

        instance = " / ".join(dict.fromkeys(labels)) or "Fuente registrada en Wowhead"
        boss = " / ".join(dict.fromkeys(bosses)) or "Ver nota de procedencia"
        type_summary = ", ".join(dict.fromkeys(types)) or "No indicado"
        phase_summary = ", ".join(str(p) for p in dict.fromkeys(phases) if p not in (None, ""))
        note = "Fuente: base Wrath Classic derivada de Wowhead. Tipos: " + type_summary + "."
        if source_details:
            note += " Orígenes: " + "; ".join(source_details) + "."
        if phase_summary:
            note += " Fases: " + phase_summary + "."
        if item.get("itemUrl"):
            note += " Ficha: " + item["itemUrl"]

        out.extend([
            f"-- {item_id}: {item.get('name', 'Nombre no disponible')}",
            "do",
            f"local existing = MyBissData.ItemSources[{item_id}]",
            "local pending = existing == nil",
            'if type(existing) == "string" and string.find(existing, "pendiente", 1, true) then pending = true end',
            'if type(existing) == "table" and existing.note and string.find(existing.note, "pendiente", 1, true) then pending = true end',
            "if pending then",
            f"  MyBissData.ItemSources[{item_id}] = {{",
            f"    instance = {lua_long_string(instance)},",
            f"    boss = {lua_long_string(boss)},",
            f"    origin = {lua_long_string(boss)},",
            f"    sourceType = {lua_long_string(type_summary)},",
            '    difficulty = "", -- No especificada en el cache.',
            '    raidSize = "", -- No especificado en el cache.',
            f"    note = {lua_long_string(note)},",
            "  }",
            "end",
            "end",
            "",
        ])

    OUTPUT.write_text("\n".join(out), encoding="utf-8")

    report = [
        "# Informe de procedencias My Biss",
        "",
        "Fuente: caché Wrath Classic derivada de Wowhead.",
        "",
        "| Tier | IDs únicos | En caché | Fuente manual | Sin localizar |",
        "|---|---:|---:|---:|---:|",
    ]
    for tier, ids in tiers.items():
        cache_count = len(ids & by_id.keys())
        manual_count = len((ids - by_id.keys()) & manual_ids)
        pending_count = len(ids - by_id.keys() - manual_ids)
        report.append(f"| {tier} | {len(ids)} | {cache_count} | {manual_count} | {pending_count} |")
    report += [
        "",
        f"- IDs únicos entre T7/T8/T9: **{len(all_ids)}**",
        f"- IDs encontrados en la caché: **{len(found)}**",
        f"- IDs ausentes de la caché: **{len(missing)}**",
        f"- IDs ausentes de caché con fuente manual documentada: **{len(manually_documented)}**",
        f"- IDs realmente pendientes de localizar: **{len(unresolved)}**",
        "",
        "## IDs pendientes de localizar",
        "",
        ", ".join(map(str, unresolved)) if unresolved else "Ninguno.",
        "",
        "## IDs documentados manualmente fuera de la caché",
        "",
        ", ".join(map(str, manually_documented)) if manually_documented else "Ninguno.",
        "",
        "## Límites de la fuente",
        "",
        "- Se importan los nombres de fuentes, tipos, fases, jefes y enlaces disponibles.",
        "- Dificultad y tamaño de banda quedan vacíos cuando el cache no los especifica.",
        "- Las procedencias manuales existentes tienen prioridad sobre los datos generados.",
        "- Un registro de fuente no demuestra por sí solo cada dificultad o modo de botín.",
        "",
        f"Cache: {CACHE_URL}",
        "",
    ]
    REPORT.parent.mkdir(parents=True, exist_ok=True)
    REPORT.write_text("\n".join(report), encoding="utf-8")
    print(f"IDs únicos: {len(all_ids)}; encontrados: {len(found)}; pendientes: {len(missing)}")


if __name__ == "__main__":
    main()
