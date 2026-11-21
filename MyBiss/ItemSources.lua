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

--========================================================
-- FIN DE ITEM SOURCES
--========================================================
