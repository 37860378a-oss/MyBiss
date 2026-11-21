--========================================================
-- MY BISS - ITEM SOURCES
-- WotLK 3.3.5a - Interface 30300
-- Procedencia de objetos separada de Database.lua
-- By Charls
--
-- IMPORTANTE:
-- Solo agregar procedencias cuando hayan sido verificadas.
-- No inventar jefe, instancia ni dificultad.
-- Database.lua conserva las fuentes que ya contiene (por ejemplo T10).
--========================================================

MyBissData = MyBissData or {}
MyBissData.ItemSources = MyBissData.ItemSources or {}

-- Registra una procedencia detallada.
-- Ejemplo de formato:
-- MB_AddItemSource( ITEM_ID, "Naxxramas", "Kel'Thuzad", "Heroico", "25 jugadores" )
local function MB_AddItemSource(itemID, instance, boss, difficulty, raidSize, note)
    if not itemID or not instance or not boss then
        return
    end

    MyBissData.ItemSources[itemID] = {
        instance = instance,
        boss = boss,
        difficulty = difficulty or "",
        raidSize = raidSize or "",
        note = note or ""
    }
end

-- Registra objetos obtenidos de vendedores.
local function MB_AddVendorSource(itemID, vendor, currency, note)
    if not itemID or not vendor then
        return
    end

    MyBissData.ItemSources[itemID] = {
        instance = vendor,
        boss = "Vendedor",
        difficulty = "",
        raidSize = "",
        note = note or (currency and ("Compra con " .. currency) or "")
    }
end

--========================================================
-- FUENTES VERIFICADAS
--========================================================
-- Las entradas se irán agregando por fase después de comprobar
-- cada ID contra la base de datos de Wowhead WotLK.
--
-- No se cargan fuentes aproximadas en este archivo.
-- Mientras un objeto no esté verificado, la interfaz mostrará:
-- "Procedencia pendiente de verificar".
--
-- Formato de banda:
-- MB_AddItemSource(12345, "Naxxramas", "Kel'Thuzad",
--                  "Heroico", "25 jugadores")
--
-- Formato de vendedor:
-- MB_AddVendorSource(12345, "Vendedor de emblemas", "Emblemas de valor")


--========================================================
-- T7 - FUENTES COMPROBADAS EN WOWHEAD WOTLK
--========================================================

-- Obsidian Greathelm (ID 44006)
-- Wowhead WotLK: Sartharion, The Obsidian Sanctum.
-- Objeto de nivel 226: botín de banda de 25 jugadores.
MB_AddItemSource(
    44006,
    "El Sagrario Obsidiana",
    "Sartharion",
    "Normal",
    "25 jugadores",
    "Verificado en Wowhead WotLK: objeto nivel 226."
)


-- ID 41387 - Tempered Titansteel Helm
-- Wowhead WotLK: objeto fabricado por Herrería.
-- No es botín de jefe ni de banda.
MyBissData.ItemSources[41387] =
    "Fabricado: Herrería (Yelmo de acero de titanes templado)"


--========================================================
-- T7 / PRE-RAID - FUENTES CONTRASTADAS CON FICHAS WOWHEAD WOTLK
--========================================================

-- ID 40387 - Boundless Ambition
-- Wowhead: botín de Kel'Thuzad. Nivel de objeto 226 (Naxxramas 25).
MB_AddItemSource(
    40387,
    "Naxxramas",
    "Kel'Thuzad",
    "Normal",
    "25 jugadores",
    "Ficha Wowhead WotLK: nivel de objeto 226; botín de Kel'Thuzad."
)

-- ID 39246 - Amulet of Autopsy
-- Wowhead WotLK: dos procedencias confirmadas en la ficha:
-- Heigan el Impuro (Naxxramas 10 normal) y
-- Jedoga Buscasombras (Ahn'kahet: El Antiguo Reino, heroico).
MB_AddItemSource(
    39246,
    "Naxxramas / Ahn'kahet: El Antiguo Reino",
    "Heigan el Impuro / Jedoga Buscasombras",
    "Normal 10 / Heroico",
    "Banda 10 jugadores / Mazmorra 5 jugadores",
    "Wowhead WotLK lista ambos orígenes; no es exclusivo de Naxxramas."
)

-- ID 40679 - Chained Military Gorget
-- Wowhead: vendedor de Dalaran; comentario indica 25 Emblemas de Heroísmo.
MB_AddVendorSource(
    40679,
    "Vendedores de emblemas de Dalaran",
    "25 Emblemas de Heroísmo",
    "Ficha Wowhead WotLK: disponible en Dalaran."
)



--========================================================
-- T7 / PRE-RAID - PROCEDENCIAS RECUPERADAS DE WOWHEAD WOTLK
-- Verificadas por ID; estos objetos provienen de contenido TBC.
-- Dificultad y tamaño solo se indican cuando corresponden.
--========================================================

-- ID 25643 - Harold's Rejuvenating Broach
-- Recompensa de la misión "El deporte sangriento definitivo" en Nagrand.
MB_AddItemSource(
    25643,
    "Nagrand",
    "Recompensa de misión: El deporte sangriento definitivo",
    "",
    "",
    "Wowhead WotLK: recompensa de misión; seleccionar Harold's Rejuvenating Broach."
)

-- ID 28523 - Totem of Healing Rains
-- Maiden of Virtue, Karazhan.
MB_AddItemSource(
    28523,
    "Karazhan",
    "Doncella de Virtud",
    "Normal",
    "10 jugadores",
    "Wowhead WotLK: botín de Maiden of Virtue."
)

-- ID 28823 - Eye of Gruul
MB_AddItemSource(
    28823,
    "Guarida de Gruul",
    "Gruul el Asesino de Dragones",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de Gruul."
)

-- ID 30063 - Libram of Absolute Truth
MB_AddItemSource(
    30063,
    "Caverna Santuario Serpiente",
    "El Rondador de Abajo",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de The Lurker Below."
)

-- ID 32387 - Idol of the Raven Goddess
-- Recompensa de la misión Vanquish the Raven God tras derrotar a Anzu.
MB_AddItemSource(
    32387,
    "Salas Sethekk",
    "Recompensa de misión: Morthis Whisperwing (Anzu)",
    "Heroico",
    "5 jugadores",
    "Wowhead WotLK: recompensa de Vanquish the Raven God; requiere derrotar a Anzu en heroico."
)

-- Reliquias vendidas por G'eras en Ciudad de Shattrath.
-- ID 33502 - Libram of Mending
MB_AddVendorSource(
    33502,
    "G'eras - Ciudad de Shattrath",
    "20 Emblemas de justicia",
    "Wowhead WotLK: vendedor G'eras."
)

-- ID 33507 - Stonebreaker's Totem
MB_AddVendorSource(
    33507,
    "G'eras - Ciudad de Shattrath",
    "20 Emblemas de justicia",
    "Wowhead WotLK: vendedor G'eras."
)

-- ID 33508 - Idol of Budding Life
MB_AddVendorSource(
    33508,
    "G'eras - Ciudad de Shattrath",
    "20 Emblemas de justicia",
    "Wowhead WotLK: vendedor G'eras."
)

-- ID 33509 - Idol of Terror
MB_AddVendorSource(
    33509,
    "G'eras - Ciudad de Shattrath",
    "20 Emblemas de justicia",
    "Wowhead WotLK: vendedor G'eras."
)

-- ID 34210 - Amice of the Convoker
MB_AddItemSource(
    34210,
    "Meseta de La Fuente del Sol",
    "Gran Bruja Alythess (Gemelas Eredar)",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de Grand Warlock Alythess."
)

-- ID 34244 - Duplicitous Guise
MB_AddItemSource(
    34244,
    "Meseta de La Fuente del Sol",
    "Kil'jaeden",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de Kil'jaeden."
)

-- ID 34344 - Handguards of Defiled Worlds
MB_AddItemSource(
    34344,
    "Meseta de La Fuente del Sol",
    "Kil'jaeden",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de Kil'jaeden."
)

-- ID 34348 - Wand of Cleansing Light
MB_AddItemSource(
    34348,
    "Meseta de La Fuente del Sol",
    "Enemigos de trash",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de los enemigos comunes de Sunwell Plateau; no es botín de jefe."
)

-- ID 34427 - Blackened Naaru Sliver
MB_AddItemSource(
    34427,
    "Meseta de La Fuente del Sol",
    "Entropius (M'uru)",
    "Normal",
    "25 jugadores",
    "Wowhead WotLK: botín de Entropius."
)

-- ID 34438 - Skyshatter Bracers
-- Se compra con token de banda; el token asociado se obtiene de Kalecgos.
MB_AddVendorSource(
    34438,
    "Vendedores de armaduras - Isla de Quel'Danas",
    "Token de brazales de La Fuente del Sol",
    "Wowhead WotLK: pieza de conjunto vendida en Isla de Quel'Danas; token asociado a Kalecgos."
)

-- ID 34547 - Onslaught Waistguard
-- La ficha confirma vendedor en Isla de Quel'Danas; no fijamos token/jefe sin cotejo adicional.
MB_AddVendorSource(
    34547,
    "Vendedores de armaduras - Isla de Quel'Danas",
    "Token de cintura de conjunto",
    "Wowhead WotLK: ubicación de vendedor confirmada en Isla de Quel'Danas; token específico pendiente de cotejo."
)

-- ID 34565 - Skyshatter Boots
-- El token asociado cae de Felmyst.
MB_AddVendorSource(
    34565,
    "Vendedores de armaduras - Isla de Quel'Danas",
    "Token de botas de La Fuente del Sol",
    "Wowhead WotLK: pieza de conjunto vendida en Isla de Quel'Danas; token asociado a Felmyst."
)

-- ID 34575 - Slayer's Boots
-- El token asociado cae de Felmyst.
MB_AddVendorSource(
    34575,
    "Vendedores de armaduras - Isla de Quel'Danas",
    "Token de botas de La Fuente del Sol",
    "Wowhead WotLK: pieza de conjunto vendida en Isla de Quel'Danas; token asociado a Felmyst."
)

-- ID 43612 - Spineslicer
-- Contenido de Reinforced Junkbox, obtenida mediante Pick Pocket a humanoides
-- de Rasganorte. La caja requiere ganzuado 350 para abrirse.
MB_AddItemSource(
    43612,
    "Caja fuerte reforzada (Reinforced Junkbox)",
    "Botín de contenedor obtenido mediante Carterismo",
    "",
    "",
    "Wowhead: Spineslicer puede salir de Reinforced Junkbox; estas cajas se obtienen robando a humanoides de Rasganorte y requieren Ganzúa 350 para abrirse."
)



--========================================================
-- ULDUAR - MODOS DIFÍCILES CRUZADOS POR ID CON LA TABLA DE BOTÍN WOWHEAD WOTLK
-- Referencia: https://www.wowhead.com/wotlk/guide/raids/ulduar/loot
-- Cada entrada corresponde a una fila explícita de Hard Mode 10/25.
-- No se extrapola dificultad por nivel de objeto.
--========================================================

-- Leviatán de llamas - Modo difícil 10 jugadores
MB_AddItemSource(45297, "Ulduar", "Leviatán de llamas", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 10.")
MB_AddItemSource(45293, "Ulduar", "Leviatán de llamas", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 10.")
MB_AddItemSource(45300, "Ulduar", "Leviatán de llamas", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 10.")
MB_AddItemSource(45295, "Ulduar", "Leviatán de llamas", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 10.")

-- Leviatán de llamas - Modo difícil 25 jugadores
MB_AddItemSource(45133, "Ulduar", "Leviatán de llamas", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 25.")
MB_AddItemSource(45136, "Ulduar", "Leviatán de llamas", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 25.")
MB_AddItemSource(45132, "Ulduar", "Leviatán de llamas", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 25.")
MB_AddItemSource(45134, "Ulduar", "Leviatán de llamas", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Flame Leviathan Hard Mode 25.")

-- Desarmador XA-002 - Modo difícil 10 jugadores
MB_AddItemSource(45871, "Ulduar", "Desarmador XA-002", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 10.")
MB_AddItemSource(45869, "Ulduar", "Desarmador XA-002", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 10.")
MB_AddItemSource(45867, "Ulduar", "Desarmador XA-002", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 10.")
MB_AddItemSource(45870, "Ulduar", "Desarmador XA-002", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 10.")
MB_AddItemSource(45868, "Ulduar", "Desarmador XA-002", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 10.")

-- Desarmador XA-002 - Modo difícil 25 jugadores
MB_AddItemSource(45443, "Ulduar", "Desarmador XA-002", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 25.")
MB_AddItemSource(45446, "Ulduar", "Desarmador XA-002", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 25.")
MB_AddItemSource(45444, "Ulduar", "Desarmador XA-002", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 25.")
MB_AddItemSource(45442, "Ulduar", "Desarmador XA-002", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 25.")
MB_AddItemSource(45445, "Ulduar", "Desarmador XA-002", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: XT-002 Deconstructor Hard Mode 25.")

-- Asamblea de Hierro - Modo difícil 10 jugadores
MB_AddItemSource(45456, "Ulduar", "Asamblea de Hierro", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 10.")
MB_AddItemSource(45449, "Ulduar", "Asamblea de Hierro", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 10.")
MB_AddItemSource(45448, "Ulduar", "Asamblea de Hierro", "Modo difícil", "10 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 10.")

-- Asamblea de Hierro - Modo difícil 25 jugadores
MB_AddItemSource(45242, "Ulduar", "Rompeacero / Asamblea de Hierro", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 25; drop de Steelbreaker.")
MB_AddItemSource(45243, "Ulduar", "Rompeacero / Asamblea de Hierro", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 25; drop de Steelbreaker.")
MB_AddItemSource(45245, "Ulduar", "Rompeacero / Asamblea de Hierro", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 25.")
MB_AddItemSource(45241, "Ulduar", "Rompeacero / Asamblea de Hierro", "Modo difícil", "25 jugadores", "Wowhead Ulduar Loot: Assembly of Iron Hard Mode 25.")

--========================================================
-- FIN DE ITEM SOURCES
--========================================================
