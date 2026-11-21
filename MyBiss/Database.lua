--========================================================
-- MY BISS - BY CHARLS
-- WotLK 3.3.5a - Interface 30300
-- Base local de perfiles y progresión PvE
--========================================================

MyBissData = MyBissData or {}

MyBissData.Version = "0.3.0"
MyBissData.Client = "WotLK 3.3.5a"
MyBissData.Ruleset = "Blizzlike"

MyBissData.Phases = {
    { key = "PRE_RAID", name = "Pre-Raid" },
    { key = "T7",       name = "Tier 7" },
    { key = "T8",       name = "Tier 8" },
    { key = "T9",       name = "Tier 9" },
    { key = "T10",      name = "Tier 10 / ICC" },
    { key = "RS",       name = "Ruby Sanctum" },
}

MyBissData.Slots = {
    "Cabeza",
    "Cuello",
    "Hombros",
    "Espalda",
    "Pecho",
    "Muñecas",
    "Manos",
    "Cintura",
    "Piernas",
    "Pies",
    "Dedo 1",
    "Dedo 2",
    "Abalorio 1",
    "Abalorio 2",
    "Arma principal",
    "Mano secundaria",
    "A distancia",
}

MyBissData.Classes = {

    {
        token = "WARRIOR",
        name = "Guerrero",
        specs = {
            {
                key = "Armas",
                role = "DPS",
                stats = "Fuerza > Golpe > Pericia > Penetración de armadura > Crítico > Celeridad"
            },
            {
                key = "Furia",
                role = "DPS",
                stats = "Fuerza > Golpe > Pericia > Penetración de armadura > Crítico > Celeridad"
            },
            {
                key = "Proteccion",
                role = "Tanque",
                stats = "Defensa 540 > Aguante > Armadura > Pericia > Golpe > Evasión"
            },
        },
    },

    {
        token = "PALADIN",
        name = "Paladín",
        specs = {
            {
                key = "Sagrado",
                role = "Sanador",
                stats = "Intelecto > Celeridad > Poder con hechizos > Crítico > MP5"
            },
            {
                key = "Proteccion",
                role = "Tanque",
                stats = "Defensa 540 > Aguante > Armadura > Fuerza > Pericia > Golpe"
            },
            {
                key = "Reprension",
                role = "DPS",
                stats = "Golpe 8% > Pericia 26 > Fuerza > Crítico > Celeridad"
            },
        },
    },

    {
        token = "HUNTER",
        name = "Cazador",
        specs = {
            {
                key = "Bestias",
                role = "DPS",
                stats = "Golpe 8% > Agilidad > Poder de ataque > Crítico > Celeridad"
            },
            {
                key = "Punteria",
                role = "DPS",
                stats = "Golpe 8% > Agilidad > Penetración de armadura > Poder de ataque > Crítico"
            },
            {
                key = "Supervivencia",
                role = "DPS",
                stats = "Golpe 8% > Agilidad > Poder de ataque > Crítico > Celeridad"
            },
        },
    },

    {
        token = "ROGUE",
        name = "Pícaro",
        specs = {
            {
                key = "Asesinato",
                role = "DPS",
                stats = "Golpe > Pericia > Agilidad > Poder de ataque > Crítico"
            },
            {
                key = "Combate",
                role = "DPS",
                stats = "Golpe > Pericia > Penetración de armadura > Agilidad > Poder de ataque"
            },
            {
                key = "Sutileza",
                role = "DPS",
                stats = "Golpe > Pericia > Agilidad > Poder de ataque > Crítico"
            },
        },
    },

    {
        token = "PRIEST",
        name = "Sacerdote",
        specs = {
            {
                key = "Disciplina",
                role = "Sanador",
                stats = "Poder con hechizos > Celeridad > Crítico > Intelecto > MP5"
            },
            {
                key = "Sagrado",
                role = "Sanador",
                stats = "Poder con hechizos > Celeridad > Espíritu > Intelecto > Crítico"
            },
            {
                key = "Sombras",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico > Espíritu"
            },
        },
    },

    {
        token = "DEATHKNIGHT",
        name = "Caballero de la Muerte",
        specs = {
            {
                key = "Sangre",
                role = "Tanque",
                stats = "Aguante > Armadura > Fuerza > Pericia > Golpe > Evasión"
            },
            {
                key = "Escarcha",
                role = "DPS",
                stats = "Fuerza > Golpe > Pericia > Penetración de armadura > Crítico"
            },
            {
                key = "Profano",
                role = "DPS",
                stats = "Fuerza > Golpe > Pericia > Penetración de armadura > Crítico"
            },
        },
    },

    {
        token = "SHAMAN",
        name = "Chamán",
        specs = {
            {
                key = "Elemental",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico"
            },
            {
                key = "Mejora",
                role = "DPS",
                stats = "Golpe > Pericia > Poder de ataque > Agilidad > Celeridad"
            },
            {
                key = "Restauracion",
                role = "Sanador",
                stats = "Celeridad > Poder con hechizos > MP5 > Intelecto > Crítico"
            },
        },
    },

    {
        token = "MAGE",
        name = "Mago",
        specs = {
            {
                key = "Arcano",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico > Intelecto"
            },
            {
                key = "Fuego",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Crítico > Celeridad > Espíritu"
            },
            {
                key = "Escarcha",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico"
            },
        },
    },

    {
        token = "WARLOCK",
        name = "Brujo",
        specs = {
            {
                key = "Afliccion",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico > Espíritu"
            },
            {
                key = "Demonologia",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico > Espíritu"
            },
            {
                key = "Destruccion",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Crítico > Celeridad"
            },
        },
    },

    {
        token = "DRUID",
        name = "Druida",
        specs = {
            {
                key = "Equilibrio",
                role = "DPS",
                stats = "Golpe de hechizos > Poder con hechizos > Celeridad > Crítico > Espíritu"
            },
            {
                key = "Feral DPS",
                role = "DPS",
                stats = "Golpe > Pericia > Agilidad > Penetración de armadura > Fuerza"
            },
            {
                key = "Feral Tanque",
                role = "Tanque",
                stats = "Aguante > Armadura > Agilidad > Esquiva > Pericia"
            },
            {
                key = "Restauracion",
                role = "Sanador",
                stats = "Celeridad > Poder con hechizos > Espíritu > Intelecto > MP5"
            },
        },
    },
}

-- Base de objetos. Se completa con itemIDs verificados.
MyBissData.Items = {}

-- Estructura de equipo para cada clase, especialización y fase.
MyBissData.Gear = {}

for _, class in ipairs(MyBissData.Classes) do

    MyBissData.Gear[class.token] = {}

    for _, spec in ipairs(class.specs) do

        MyBissData.Gear[class.token][spec.key] = {}

        for _, phase in ipairs(MyBissData.Phases) do

            MyBissData.Gear[class.token][spec.key][phase.key] = {
                status = "pending_verified_items",
                bestInSlot = {},
                alternatives = {},
            }

        end
    end
end

-- Función para agregar objetos manualmente desde otros archivos.
function MyBissData:AddItem(class, spec, phase, slot, itemID, itemName)

    if not self.Gear[class] then return false end
    if not self.Gear[class][spec] then return false end
    if not self.Gear[class][spec][phase] then return false end

    self.Gear[class][spec][phase].bestInSlot[slot] = {
        itemID = tonumber(itemID),
        name = itemName or ("Item " .. tostring(itemID)),
    }

    self.Gear[class][spec][phase].status = "has_data"

    return true
end

--========================================================
-- MY BISS 0.4.0 - EXTENSIÓN PvE / PvP
-- Objetos, alternativas, gemas y encantamientos
--========================================================

MyBissData.PvPPhases = {
    { key = "PVP_S5", name = "S5 - Deadly Gladiator" },
    { key = "PVP_S6", name = "S6 - Furious Gladiator" },
    { key = "PVP_S7", name = "S7 - Relentless Gladiator" },
    { key = "PVP_S8", name = "S8 - Wrathful Gladiator" },
}

MyBissData.PvPGear = {}

-- Crear base PvP independiente para todos los perfiles.
for _, class in ipairs(MyBissData.Classes) do

    MyBissData.PvPGear[class.token] = {}

    for _, spec in ipairs(class.specs) do

        MyBissData.PvPGear[class.token][spec.key] = {}

        for _, phase in ipairs(MyBissData.PvPPhases) do

            MyBissData.PvPGear[class.token][spec.key][phase.key] = {
                status = "pending_verified_items",
                bestInSlot = {},
                alternatives = {},
                gems = {},
                enchants = {},
            }

        end
    end
end

-- Agrega o reemplaza un objeto recomendado.
function MyBissData:SetBuildItem(
    mode, class, spec, phase, slot, itemID, itemName
)

    local database

    if mode == "PVP" then
        database = self.PvPGear
    else
        database = self.Gear
    end

    if not database[class] then return false end
    if not database[class][spec] then return false end
    if not database[class][spec][phase] then return false end

    local profile = database[class][spec][phase]

    profile.bestInSlot[slot] = {
        itemID = tonumber(itemID),
        name = itemName or ("Item " .. tostring(itemID)),
    }

    profile.status = "has_data"

    return true
end

-- Agrega una alternativa a un espacio.
function MyBissData:AddAlternative(
    mode, class, spec, phase, slot, itemID, itemName, note
)

    local database = mode == "PVP" and self.PvPGear or self.Gear

    if not database[class] then return false end
    if not database[class][spec] then return false end
    if not database[class][spec][phase] then return false end

    local profile = database[class][spec][phase]

    profile.alternatives[slot] = profile.alternatives[slot] or {}

    table.insert(profile.alternatives[slot], {
        itemID = tonumber(itemID),
        name = itemName or ("Item " .. tostring(itemID)),
        note = note or "",
    })

    return true
end

-- Define las gemas recomendadas para un espacio.
function MyBissData:SetGems(
    mode, class, spec, phase, slot, gems
)

    local database = mode == "PVP" and self.PvPGear or self.Gear

    if not database[class] then return false end
    if not database[class][spec] then return false end
    if not database[class][spec][phase] then return false end

    local profile = database[class][spec][phase]
    profile.gems = profile.gems or {}
    profile.gems[slot] = gems

    return true
end

-- Define el encantamiento recomendado para un espacio.
function MyBissData:SetEnchant(
    mode, class, spec, phase, slot, enchant
)

    local database = mode == "PVP" and self.PvPGear or self.Gear

    if not database[class] then return false end
    if not database[class][spec] then return false end
    if not database[class][spec][phase] then return false end

    local profile = database[class][spec][phase]
    profile.enchants = profile.enchants or {}
    profile.enchants[slot] = enchant

    return true
end

-- Consulta de la base según modo.
function MyBissData:GetBuild(mode, class, spec, phase)

    local database = mode == "PVP" and self.PvPGear or self.Gear

    if not database[class] then return nil end
    if not database[class][spec] then return nil end

    return database[class][spec][phase]
end

-- =========================================================
-- MY BISS - BY CHARLS
-- DATABASE 0.4.1
-- WOTLK 3.3.5a BLIZZLIKE
-- BLOQUE 1: WARRIOR + PALADIN
-- FASE: T10 / ICC 25H + RUBY SANCTUM 25H
-- =========================================================

MyBissData.ItemSources = MyBissData.ItemSources or {}

local function MB_AddT10(class, spec, slot, id, name, source)
    MyBissData:SetBuildItem(
        "PVE", class, spec, "T10", slot, id, name
    )

    MyBissData.ItemSources[id] = source
end

local function MB_AddT10Alt(class, spec, slot, id, name, source)
    MyBissData:AddAlternative(
        "PVE", class, spec, "T10",
        slot, id, name, source
    )

    MyBissData.ItemSources[id] = source
end

local function MB_AddT10Relic(class, spec, id, name, source)
    local build = MyBissData:GetBuild("PVE", class, spec, "T10")
    if not build then return end

    build.extraSlots = build.extraSlots or {}
    build.extraSlots["Reliquia"] = {
        itemID = id,
        name = name,
        source = source
    }

    MyBissData.ItemSources[id] = source
end

-- =========================================================
-- WARRIOR - ARMS
-- =========================================================

local C, S = "WARRIOR", "Armas"

MB_AddT10(C,S,"Cabeza",51227,"Sanctified Ymirjar Lord's Helmet","Vendedor T10")
MB_AddT10(C,S,"Cuello",54581,"Penumbra Pendant","Halion 25H")
MB_AddT10(C,S,"Hombros",51229,"Sanctified Ymirjar Lord's Shoulderplates","Vendedor T10")
MB_AddT10(C,S,"Espalda",47545,"Vereesa's Dexterity","TOGC 25 Insanity")
MB_AddT10Alt(C,S,"Espalda",50677,"Winding Sheet","Carapútrea 25H")
MB_AddT10(C,S,"Pecho",51225,"Sanctified Ymirjar Lord's Battleplate","Vendedor T10")
MB_AddT10(C,S,"Muñecas",50670,"Toskk's Maximised Wristguards","Libramorte 25H")
MB_AddT10(C,S,"Manos",50675,"Aldriana's Gloves of Secrecy","Carapútrea 25H")
MB_AddT10(C,S,"Cintura",50620,"Coldwraith Links","Valithria 25H")
MB_AddT10(C,S,"Piernas",51228,"Sanctified Ymirjar Lord's Legplates","Vendedor T10")
MB_AddT10(C,S,"Pies",54578,"Apocalypse's Advance","Halion 25H")
MB_AddT10Alt(C,S,"Pies",50639,"Blood-Soaked Saronite Stompers","Lady Susurramuerte 25H")
MB_AddT10(C,S,"Dedo 1",50657,"Skeleton Lord's Circle","Batalla de las cañoneras 25H")
MB_AddT10(C,S,"Dedo 2",52572,"Ashen Band of Endless Might","Veredicto Cinéreo")
MB_AddT10(C,S,"Abalorio 1",50363,"Deathbringer's Will","Libramorte 25H")
MB_AddT10(C,S,"Abalorio 2",54590,"Sharpened Twilight Scale","Halion 25H")
MB_AddT10(C,S,"Arma principal",49623,"Shadowmourne","Cadena de misiones legendaria")
MB_AddT10Alt(C,S,"Arma principal",50603,"Cryptmaker","Príncipe Valanar 25H")
MB_AddT10(C,S,"A distancia",50733,"Fal'inrush, Defender of Quel'thalas","Rey Exánime 25H")

-- =========================================================
-- WARRIOR - FURY
-- =========================================================

C, S = "WARRIOR", "Furia"

MB_AddT10(C,S,"Cabeza",51227,"Sanctified Ymirjar Lord's Helmet","Vendedor T10")
MB_AddT10(C,S,"Cuello",54581,"Penumbra Pendant","Halion 25H")
MB_AddT10(C,S,"Hombros",51229,"Sanctified Ymirjar Lord's Shoulderplates","Vendedor T10")
MB_AddT10(C,S,"Espalda",47545,"Vereesa's Dexterity","TOGC 25 Insanity")
MB_AddT10Alt(C,S,"Espalda",50677,"Winding Sheet","Carapútrea 25H")
MB_AddT10(C,S,"Pecho",51225,"Sanctified Ymirjar Lord's Battleplate","Vendedor T10")
MB_AddT10(C,S,"Muñecas",50670,"Toskk's Maximised Wristguards","Libramorte 25H")
MB_AddT10(C,S,"Manos",50675,"Aldriana's Gloves of Secrecy","Carapútrea 25H")
MB_AddT10(C,S,"Cintura",50620,"Coldwraith Links","Valithria 25H")
MB_AddT10(C,S,"Piernas",51228,"Sanctified Ymirjar Lord's Legplates","Vendedor T10")
MB_AddT10(C,S,"Pies",54578,"Apocalypse's Advance","Halion 25H")
MB_AddT10Alt(C,S,"Pies",50639,"Blood-Soaked Saronite Stompers","Lady Susurramuerte 25H")
MB_AddT10(C,S,"Dedo 1",50657,"Skeleton Lord's Circle","Batalla de las cañoneras 25H")
MB_AddT10(C,S,"Dedo 2",52572,"Ashen Band of Endless Might","Veredicto Cinéreo")
MB_AddT10(C,S,"Abalorio 1",50363,"Deathbringer's Will","Libramorte 25H")
MB_AddT10(C,S,"Abalorio 2",54590,"Sharpened Twilight Scale","Halion 25H")
MB_AddT10(C,S,"Arma principal",49623,"Shadowmourne","Cadena de misiones legendaria")
MB_AddT10Alt(C,S,"Arma principal",50730,"Glorenzelg, High-Blade of the Silver Hand","Rey Exánime 25H")
MB_AddT10(C,S,"Mano secundaria",50603,"Cryptmaker","Príncipe Valanar 25H")
MB_AddT10Alt(C,S,"Mano secundaria",50730,"Glorenzelg, High-Blade of the Silver Hand","Rey Exánime 25H")
MB_AddT10(C,S,"A distancia",50733,"Fal'inrush, Defender of Quel'thalas","Rey Exánime 25H")

-- =========================================================
-- WARRIOR - PROTECTION
-- =========================================================

C, S = "WARRIOR", "Proteccion"

MB_AddT10(C,S,"Cabeza",50640,"Broken Ram Skull Helm","Lady Susurramuerte 25H")
MB_AddT10(C,S,"Cuello",50682,"Bile-Encrusted Medallion","Carapútrea 25H")
MB_AddT10(C,S,"Hombros",51847,"Spaulders of the Blood Princes","Príncipes de Sangre 10H")
MB_AddT10(C,S,"Espalda",50466,"Sentinel's Winter Cloak","Vendedor")
MB_AddT10(C,S,"Pecho",51220,"Sanctified Ymirjar Lord's Breastplate","Vendedor T10")
MB_AddT10(C,S,"Muñecas",51901,"Gargoyle Spit Bracers","Libramorte 25H")
MB_AddT10(C,S,"Manos",51222,"Sanctified Ymirjar Lord's Handguards","Vendedor T10")
MB_AddT10(C,S,"Cintura",50691,"Belt of Broken Bones","Panzachancro 25H")
MB_AddT10(C,S,"Piernas",50612,"Legguards of Lost Hope","Lord Tuétano 25H")
MB_AddT10(C,S,"Pies",54579,"Treads of Impending Resurrection","Halion 25H")
MB_AddT10(C,S,"Dedo 1",50622,"Devium's Eternally Cold Ring","Valithria 25H")
MB_AddT10(C,S,"Dedo 2",50404,"Ashen Band of Endless Courage","Veredicto Cinéreo")
MB_AddT10(C,S,"Abalorio 1",54591,"Petrified Twilight Scale","Halion 25H")
MB_AddT10(C,S,"Abalorio 2",50364,"Sindragosa's Flawless Fang","Sindragosa 25H")
MB_AddT10Alt(C,S,"Abalorio 1",50356,"Corroded Skeleton Key","Vendedor")
MB_AddT10Alt(C,S,"Abalorio 2",50344,"Unidentifiable Organ","Profesor Putricidio 10H")
MB_AddT10(C,S,"Arma principal",50738,"Mithrios, Bronzebeard's Legacy","Rey Exánime 25H")
MB_AddT10(C,S,"Mano secundaria",50729,"Icecrown Glacial Wall","Reina de Sangre 25H")
MB_AddT10(C,S,"A distancia",51834,"Dreamhunter's Carbine","Valithria 25H")

-- =========================================================
-- PALADIN - RETRIBUTION
-- =========================================================

C, S = "PALADIN", "Reprension"

MB_AddT10(C,S,"Cabeza",51277,"Sanctified Lightsworn Helmet","Vendedor T10")
MB_AddT10(C,S,"Cuello",54581,"Penumbra Pendant","Halion 25H")
MB_AddT10(C,S,"Hombros",51279,"Sanctified Lightsworn Shoulderplates","Vendedor T10")
MB_AddT10(C,S,"Espalda",50653,"Shadowvault Slayer's Cloak","Batalla de las cañoneras 25H")
MB_AddT10(C,S,"Pecho",51275,"Sanctified Lightsworn Battleplate","Vendedor T10")
MB_AddT10(C,S,"Muñecas",54580,"Umbrage Armbands","Halion 25H")
MB_AddT10Alt(C,S,"Muñecas",50659,"Polar Bear Claw Bracers","Batalla de las cañoneras 25H")
MB_AddT10(C,S,"Manos",50690,"Fleshrending Gauntlets","Panzachancro 25H")
MB_AddT10(C,S,"Cintura",50707,"Astrylian's Sutured Cinch","Profesor Putricidio 25H")
MB_AddT10(C,S,"Piernas",51278,"Sanctified Lightsworn Legplates","Vendedor T10")
MB_AddT10(C,S,"Pies",54578,"Apocalypse's Advance","Halion 25H")
MB_AddT10(C,S,"Dedo 1",50402,"Ashen Band of Endless Vengeance","Veredicto Cinéreo")
MB_AddT10(C,S,"Dedo 2",54576,"Signet of Twilight","Halion 25H")
MB_AddT10(C,S,"Abalorio 1",54590,"Sharpened Twilight Scale","Halion 25H")
MB_AddT10(C,S,"Abalorio 2",50706,"Tiny Abomination in a Jar","Profesor Putricidio 25H")
MB_AddT10(C,S,"Arma principal",49623,"Shadowmourne","Cadena de misiones legendaria")
MB_AddT10Alt(C,S,"Arma principal",50730,"Glorenzelg, High-Blade of the Silver Hand","Rey Exánime 25H")
MB_AddT10Alt(C,S,"Arma principal",50735,"Oathbinder, Charge of the Range-General","Rey Exánime 25H")

MB_AddT10Relic(C,S,50455,"Libram of Three Truths","Vendedor")

-- =========================================================
-- PALADIN - HOLY
-- =========================================================

C, S = "PALADIN", "Sagrado"

MB_AddT10(C,S,"Cabeza",51272,"Sanctified Lightsworn Headpiece","Vendedor T10")
MB_AddT10(C,S,"Cuello",50724,"Blood Queen's Crimson Choker","Reina de Sangre 25H")
MB_AddT10(C,S,"Hombros",51273,"Sanctified Lightsworn Spaulders","Vendedor T10")
MB_AddT10(C,S,"Espalda",54583,"Cloak of Burning Dusk","Halion 25H")
MB_AddT10(C,S,"Pecho",50680,"Rot-Resistant Breastplate","Carapútrea 25H")
MB_AddT10(C,S,"Muñecas",54582,"Bracers of Fiery Night","Halion 25H")
MB_AddT10(C,S,"Manos",50650,"Fallen Lord's Handguards","Lady Susurramuerte 25H")
MB_AddT10(C,S,"Cintura",54587,"Split Shape Belt","Halion 25H")
MB_AddT10(C,S,"Piernas",50694,"Plaguebringer's Stained Pants","Panzachancro 25H")
MB_AddT10(C,S,"Pies",54586,"Foreshadow Steps","Halion 25H")
MB_AddT10(C,S,"Dedo 1",50664,"Ring of Rapid Ascent","Batalla de las cañoneras 25H")
MB_AddT10Alt(C,S,"Dedo 1",54585,"Ring of Phased Regeneration","Halion 25H")
MB_AddT10(C,S,"Dedo 2",50400,"Ashen Band of Endless Wisdom","Veredicto Cinéreo")
MB_AddT10(C,S,"Abalorio 1",46051,"Meteorite Crystal","Algalon 25N")
MB_AddT10(C,S,"Abalorio 2",48724,"Talisman of Resurgence","Vendedor emblemas")
MB_AddT10Alt(C,S,"Abalorio 2",47059,"Solace of the Defeated","Lord Jaraxxus 25H")
MB_AddT10(C,S,"Arma principal",46017,"Val'anyr, Hammer of Ancient Kings","Misión legendaria Ulduar")
MB_AddT10Alt(C,S,"Arma principal",50732,"Bloodsurge, Kel'Thuzad's Blade of Agony","Rey Exánime 25H")
MB_AddT10Alt(C,S,"Arma principal",50685,"Trauma","Carapútrea 25H")
MB_AddT10(C,S,"Mano secundaria",50616,"Bulwark of Smouldering Steel","Lord Tuétano 25H")

MB_AddT10Relic(C,S,40705,"Libram of Renewal","Vendedor")

-- =========================================================
-- PALADIN - PROTECTION
-- =========================================================

C, S = "PALADIN", "Proteccion"

MB_AddT10(C,S,"Cabeza",50640,"Broken Ram Skull Helm","Lady Susurramuerte 25H")
MB_AddT10(C,S,"Cuello",50682,"Bile-Encrusted Medallion","Carapútrea 25H")
MB_AddT10(C,S,"Hombros",50660,"Boneguard Commander's Pauldrons","Batalla de las cañoneras 25H")
MB_AddT10(C,S,"Espalda",50466,"Sentinel's Winter Cloak","Vendedor")
MB_AddT10(C,S,"Pecho",51265,"Sanctified Lightsworn Chestguard","Vendedor T10")
MB_AddT10(C,S,"Muñecas",51901,"Gargoyle Spit Bracers","Libramorte 25H")
MB_AddT10(C,S,"Manos",51267,"Sanctified Lightsworn Handguards","Vendedor T10")
MB_AddT10(C,S,"Cintura",50991,"Verdigris Chain Belt","Vendedor")
MB_AddT10(C,S,"Piernas",49904,"Pillars of Might","Fabricación")
MB_AddT10(C,S,"Pies",54579,"Treads of Impending Resurrection","Halion 25H")
MB_AddT10(C,S,"Dedo 1",50622,"Devium's Eternally Cold Ring","Valithria 25H")
MB_AddT10(C,S,"Dedo 2",50404,"Ashen Band of Endless Courage","Veredicto Cinéreo")
MB_AddT10(C,S,"Abalorio 1",54591,"Petrified Twilight Scale","Halion 25H")
MB_AddT10(C,S,"Abalorio 2",50364,"Sindragosa's Flawless Fang","Sindragosa 25H")
MB_AddT10(C,S,"Arma principal",50738,"Mithrios, Bronzebeard's Legacy","Rey Exánime 25H")
MB_AddT10(C,S,"Mano secundaria",50729,"Icecrown Glacial Wall","Reina de Sangre 25H")

MB_AddT10Relic(C,S,50461,"Libram of the Eternal Tower","Vendedor")

-- =========================================================
-- FIN DEL BLOQUE 1
-- =========================================================

-- =========================================================
-- MY BISS - BY CHARLS
-- BLOQUE 2A: HUNTER / ROGUE / PRIEST
-- WOTLK 3.3.5a
-- T10 / ICC 25H / RUBY SANCTUM 25H
-- =========================================================

local function MB_LoadProfile(class, spec, items)
    for _, v in ipairs(items) do
        MyBissData:SetBuildItem(
            "PVE", class, spec, "T10",
            v[1], v[2], v[3]
        )
        MyBissData.ItemSources = MyBissData.ItemSources or {}
        MyBissData.ItemSources[v[2]] = v[4]
    end
end

local function MB_LoadAlternative(class, spec, slot, id, name, source)
    MyBissData:AddAlternative(
        "PVE", class, spec, "T10",
        slot, id, name, source
    )
    MyBissData.ItemSources[id] = source
end

-- =========================================================
-- CAZADOR
-- =========================================================

local hunter = {
    {"Cabeza",51286,"Sanctified Ahn'Kahar Blood Hunter's Headpiece","Vendedor T10"},
    {"Cuello",50633,"Sindragosa's Cruel Claw","Sindragosa 25H"},
    {"Hombros",51288,"Sanctified Ahn'Kahar Blood Hunter's Spaulders","Vendedor T10"},
    {"Espalda",47545,"Vereesa's Dexterity","TOGC 25"},
    {"Pecho",51289,"Sanctified Ahn'Kahar Blood Hunter's Tunic","Vendedor T10"},
    {"Muñecas",50655,"Scourge Hunter's Vambraces","Batalla de las cañoneras 25H"},
    {"Manos",51285,"Sanctified Ahn'Kahar Blood Hunter's Handguards","Vendedor T10"},
    {"Cintura",50688,"Nerub'ar Stalker's Cord","Panzachancro 25H"},
    {"Piernas",50645,"Leggings of Northern Lights","Lady Susurramuerte 25H"},
    {"Pies",54577,"Returning Footfalls","Halion 25H"},
    {"Dedo 1",54576,"Signet of Twilight","Halion 25H"},
    {"Dedo 2",50402,"Ashen Band of Endless Vengeance","Veredicto Cinéreo"},
    {"Abalorio 1",50363,"Deathbringer's Will","Libramorte 25H"},
    {"Abalorio 2",54590,"Sharpened Twilight Scale","Halion 25H"},
    {"Arma principal",50735,"Oathbinder, Charge of the Range-General","Rey Exánime 25H"},
    {"A distancia",50733,"Fal'inrush, Defender of Quel'thalas","Rey Exánime 25H"},
}

MB_LoadProfile("HUNTER","Bestias",hunter)
MB_LoadProfile("HUNTER","Punteria",hunter)
MB_LoadProfile("HUNTER","Supervivencia",hunter)

MB_LoadAlternative("HUNTER","Bestias","Espalda",50653,"Shadowvault Slayer's Cloak","Batalla de las cañoneras 25H")
MB_LoadAlternative("HUNTER","Punteria","Espalda",50653,"Shadowvault Slayer's Cloak","Batalla de las cañoneras 25H")
MB_LoadAlternative("HUNTER","Supervivencia","Espalda",50653,"Shadowvault Slayer's Cloak","Batalla de las cañoneras 25H")

-- =========================================================
-- PÍCARO - COMBATE
-- =========================================================

local rogueCombat = {
    {"Cabeza",51252,"Sanctified Shadowblade Helmet","Vendedor T10"},
    {"Cuello",50633,"Sindragosa's Cruel Claw","Sindragosa 25H"},
    {"Hombros",51254,"Sanctified Shadowblade Pauldrons","Vendedor T10"},
    {"Espalda",47545,"Vereesa's Dexterity","TOGC 25"},
    {"Pecho",51250,"Sanctified Shadowblade Breastplate","Vendedor T10"},
    {"Muñecas",50670,"Toskk's Maximised Wristguards","Libramorte 25H"},
    {"Manos",50675,"Aldriana's Gloves of Secrecy","Carapútrea 25H"},
    {"Cintura",50707,"Astrylian's Sutured Cinch","Profesor Putricidio 25H"},
    {"Piernas",51253,"Sanctified Shadowblade Legplates","Vendedor T10"},
    {"Pies",50607,"Frostbitten Fur Boots","Lord Tuétano 25H"},
    {"Dedo 1",50402,"Ashen Band of Endless Vengeance","Veredicto Cinéreo"},
    {"Dedo 2",50618,"Frostbrood Sapphire Ring","Valithria 25H"},
    {"Abalorio 1",50363,"Deathbringer's Will","Libramorte 25H"},
    {"Abalorio 2",54590,"Sharpened Twilight Scale","Halion 25H"},
    {"Arma principal",50737,"Havoc's Call, Blade of Lordaeron Kings","Rey Exánime 25H"},
    {"Mano secundaria",50654,"Scourgeborne Waraxe","Batalla de las cañoneras 25H"},
    {"A distancia",50733,"Fal'inrush, Defender of Quel'thalas","Rey Exánime 25H"},
}

MB_LoadProfile("ROGUE","Combate",rogueCombat)

MB_LoadAlternative("ROGUE","Combate","Espalda",50470,"Recovered Scarlet Onslaught Cape","Vendedor")

-- =========================================================
-- PÍCARO - ASESINATO
-- =========================================================

local rogueAssassination = {
    {"Cabeza",50713,"Geistlord's Punishment Sack","Príncipes de Sangre 25H"},
    {"Cuello",50633,"Sindragosa's Cruel Claw","Sindragosa 25H"},
    {"Hombros",50646,"Cultist's Bloodsoaked Spaulders","Lady Susurramuerte 25H"},
    {"Espalda",50653,"Shadowvault Slayer's Cloak","Batalla de las cañoneras 25H"},
    {"Pecho",50656,"Ikfirus's Sack of Wonder","Batalla de las cañoneras 25H"},
    {"Muñecas",54580,"Umbrage Armbands","Halion 25H"},
    {"Manos",51251,"Sanctified Shadowblade Gauntlets","Vendedor T10"},
    {"Cintura",47112,"Belt of the Merciless Killer","TOGC 25H"},
    {"Piernas",51253,"Sanctified Shadowblade Legplates","Vendedor T10"},
    {"Pies",50607,"Frostbitten Fur Boots","Lord Tuétano 25H"},
    {"Dedo 1",50402,"Ashen Band of Endless Vengeance","Veredicto Cinéreo"},
    {"Dedo 2",54576,"Signet of Twilight","Halion 25H"},
    {"Abalorio 1",54590,"Sharpened Twilight Scale","Halion 25H"},
    {"Abalorio 2",50706,"Tiny Abomination in a Jar","Profesor Putricidio 25H"},
    {"Arma principal",50736,"Heaven's Fall, Kryss of a Thousand Lies","Rey Exánime 25H"},
    {"Mano secundaria",50621,"Lungbreaker","Valithria 25H"},
    {"A distancia",50733,"Fal'inrush, Defender of Quel'thalas","Rey Exánime 25H"},
}

MB_LoadProfile("ROGUE","Asesinato",rogueAssassination)

MB_LoadAlternative("ROGUE","Asesinato","Cintura",50707,"Astrylian's Sutured Cinch","Profesor Putricidio 25H")

-- =========================================================
-- SACERDOTE - SOMBRAS
-- =========================================================

local priestShadow = {
    {"Cabeza",51255,"Sanctified Crimson Acolyte Cowl","Vendedor T10"},
    {"Cuello",50724,"Blood Queen's Crimson Choker","Reina de Sangre 25H"},
    {"Hombros",51257,"Sanctified Crimson Acolyte Mantle","Vendedor T10"},
    {"Espalda",54583,"Cloak of Burning Dusk","Halion 25H"},
    {"Pecho",51259,"Sanctified Crimson Acolyte Raiments","Vendedor T10"},
    {"Muñecas",54582,"Bracers of Fiery Night","Halion 25H"},
    {"Manos",51256,"Sanctified Crimson Acolyte Handwraps","Vendedor T10"},
    {"Cintura",50613,"Crushing Coldwraith Belt","Lord Tuétano 25H"},
    {"Piernas",50694,"Plaguebringer's Stained Pants","Panzachancro 25H"},
    {"Pies",50699,"Plague Scientist's Boots","Panzachancro 25H"},
    {"Dedo 1",50664,"Ring of Rapid Ascent","Batalla de las cañoneras 25H"},
    {"Dedo 2",50398,"Ashen Band of Endless Destruction","Veredicto Cinéreo"},
    {"Abalorio 1",54588,"Charred Twilight Scale","Halion 25H"},
    {"Abalorio 2",50348,"Dislodged Foreign Object","Carapútrea 25H"},
    {"Arma principal",50734,"Royal Scepter of Terenas II","Rey Exánime 25H"},
    {"Mano secundaria",50719,"Shadow Silk Spindle","Príncipes de Sangre 25H"},
    {"A distancia",50684,"Corpse-Impaling Spike","Carapútrea 25H"},
}

MB_LoadProfile("PRIEST","Sombras",priestShadow)

-- =========================================================
-- SACERDOTE - DISCIPLINA
-- =========================================================

local priestDiscipline = {
    {"Cabeza",51261,"Sanctified Crimson Acolyte Hood","Vendedor T10"},
    {"Cuello",50724,"Blood Queen's Crimson Choker","Reina de Sangre 25H"},
    {"Hombros",51264,"Sanctified Crimson Acolyte Shoulderpads","Vendedor T10"},
    {"Espalda",54583,"Cloak of Burning Dusk","Halion 25H"},
    {"Pecho",51263,"Sanctified Crimson Acolyte Robe","Vendedor T10"},
    {"Muñecas",54582,"Bracers of Fiery Night","Halion 25H"},
    {"Manos",50722,"San'layn Ritualist Gloves","Príncipes de Sangre 25H"},
    {"Cintura",50613,"Crushing Coldwraith Belt","Lord Tuétano 25H"},
    {"Piernas",51262,"Sanctified Crimson Acolyte Leggings","Vendedor T10"},
    {"Pies",50699,"Plague Scientist's Boots","Panzachancro 25H"},
    {"Dedo 1",50644,"Ring of Maddening Whispers","Lady Susurramuerte 25H"},
    {"Dedo 2",50636,"Memory of Malygos","Sindragosa 25H"},
    {"Abalorio 1",50366,"Althor's Abacus","Batalla de las cañoneras 25H"},
    {"Abalorio 2",54589,"Glowing Twilight Scale","Halion 25H"},
    {"Arma principal",50734,"Royal Scepter of Terenas II","Rey Exánime 25H"},
    {"Mano secundaria",50719,"Shadow Silk Spindle","Príncipes de Sangre 25H"},
    {"A distancia",50631,"Nightmare Ender","Valithria 25H"},
}

MB_LoadProfile("PRIEST","Disciplina",priestDiscipline)

-- =========================================================
-- SACERDOTE - SAGRADO
-- =========================================================

local priestHoly = {
    {"Cabeza",51261,"Sanctified Crimson Acolyte Hood","Vendedor T10"},
    {"Cuello",50609,"Bone Sentinel's Amulet","Lord Tuétano 25H"},
    {"Hombros",51264,"Sanctified Crimson Acolyte Shoulderpads","Vendedor T10"},
    {"Espalda",50668,"Greatcloak of the Turned Champion","Libramorte 25H"},
    {"Pecho",50717,"Sanguine Silk Robes","Príncipes de Sangre 25H"},
    {"Muñecas",54582,"Bracers of Fiery Night","Halion 25H"},
    {"Manos",51260,"Sanctified Crimson Acolyte Gloves","Vendedor T10"},
    {"Cintura",50702,"Lingering Illness","Panzachancro 25H"},
    {"Piernas",51262,"Sanctified Crimson Acolyte Leggings","Vendedor T10"},
    {"Pies",50699,"Plague Scientist's Boots","Panzachancro 25H"},
    {"Dedo 1",50400,"Ashen Band of Endless Wisdom","Veredicto Cinéreo"},
    {"Dedo 2",50636,"Memory of Malygos","Sindragosa 25H"},
    {"Abalorio 1",50366,"Althor's Abacus","Batalla de las cañoneras 25H"},
    {"Abalorio 2",54589,"Glowing Twilight Scale","Halion 25H"},
    {"Arma principal",50731,"Archus, Greatstaff of Antonidas","Rey Exánime 25H"},
    {"Mano secundaria",50635,"Sundial of Eternal Dusk","Sindragosa 25H"},
    {"A distancia",50631,"Nightmare Ender","Valithria 25H"},
}

MB_LoadProfile("PRIEST","Sagrado",priestHoly)

-- =========================================================
-- FIN BLOQUE 2A
-- =========================================================

--========================================================
-- MY BISS - SECCION ADICIONAL: PRE-RAID
-- Fuente: listas BiS WotLK 3.3.5a (PR)
-- Agregar al FINAL de Database.lua.
-- Primer objeto = recomendado; siguientes = alternativas.
--========================================================

local MB_PreRaidData = {
    ["DEATHKNIGHT|Sangre"] = {
        "Head|41387,39395,39625,42549,44902,37633",
        "Neck|40679,44660,39246,42646,43282,37689",
        "Shoulder|37814,39267,39627,44312,37635,37115",
        "Back|43565,43988,39225,37728,44188,37197",
        "Chest|39623,39398,37658,44198,43310,34394",
        "Wrist|37620,39467,39195,37682,37891,37040",
        "Hands|39624,39197,37645,44183,37363,37862",
        "Waist|40689,37241,37801,37379,37826,37171",
        "Legs|43500,39626,43994,37292,37193,34381",
        "Feet|44201,39234,44895,41392,37618,44306",
        "Finger|42643,37784,39141,40426,37257,44935",
        "Trinket|37220,36993,44063,42341,39292,44323",
        "Weapon|41257,39344,43409,37852,37401,37260",
        "Off hand|39344,37401,37260,37179,41383,36984",
        "Relic|48545,49467,48540,47677,49332,48529",
    },
    ["DEATHKNIGHT|Escarcha"] = {
        "Head|41386,39403,39619,44902,42552,32373",
        "Neck|42645,39146,44659,39421,42021,40678",
        "Shoulder|34388,39621,39249,39534,43198,43387",
        "Back|37647,39404,39297,38614,42061,43406",
        "Chest|39617,43998,34397,37219,44303,37612",
        "Wrist|41355,39195,37891,37668,43944,37366",
        "Hands|39618,37409,37363,34341,44399,35651",
        "Waist|40688,37088,37826,37407,37171,37243",
        "Legs|37193,43994,37263,34180,44205,37644",
        "Feet|43402,44297,44895,44306,37367,32345",
        "Finger|44935,37642,40474,43993,39401,43251",
        "Trinket|42987,40684,37166,37390,37723,43573",
        "Weapon|41383,39291,43611,44250,37235,37871",
        "Off hand|44250,39291,41383,43611,37235,37871",
        "Relic|48488,49466,45472,47674,47943,49333",
    },
    ["DEATHKNIGHT|Profano"] = {
        "Head|41386,39403,39619,41344,44902,42552",
        "Neck|37397,39421,39146,44659,42645,42021",
        "Shoulder|34388,39621,39249,37627,39534,43198",
        "Back|37647,39404,39297,34241,43566,42061",
        "Chest|39617,39239,43990,34215,43310,36950",
        "Wrist|41355,39195,37668,37891,37853,28795",
        "Hands|39618,34378,37363,37409,37874,44399",
        "Waist|40688,37171,37088,37826,30032,37243",
        "Legs|37193,43994,39620,34180,37263,37675",
        "Feet|44306,39139,43402,44895,37367,44297",
        "Finger|44935,43251,40474,39401,40586,37651",
        "Trinket|42987,37390,37166,40684,39257,44914",
        "Weapon|41383,40491,44311,37401,43611,37235",
        "Off hand|40703,40491,44311,37401,43611,37235",
        "Relic|48488,49466,45472,47943,48483,45107",
    },
    ["DRUID|Equilibrio"] = {
        "Head|37180,39545,43995,44907,42554,41984",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39548,37673,37655,37196,37652",
        "Back|41610,39241,42057,36983,44242,34242",
        "Chest|39547,40526,39396,43401,42102,34399",
        "Wrist|37361,39252,37884,37696,37725,44200",
        "Hands|39544,39192,34344,42113,37172,37825",
        "Waist|40696,37408,37680,37850,44181,37643",
        "Legs|37791,37854,44931,34181,37389,37369",
        "Feet|44202,40519,44930,37730,37218,37629",
        "Finger|40585,43253,39389,42644,44283,37694",
        "Trinket|37873,40682,42395,39229,37660,32483",
        "Weapon|41384,40489,39424,39423,37169,44173",
        "Off hand|40698,39199,37134,44210,37718,37051",
        "Relic|48171,48164,47693,48158,45150,46191",
    },
    ["DRUID|Feral Tanque"] = {
        "Head|37293,39399,44908,39553,42550,43403",
        "Neck|42646,39246,44659,40679,42021,40678",
        "Shoulder|43481,39556,37139,37593,34392,44190",
        "Back|43565,43988,43406,42061,37840,37728",
        "Chest|43590,43990,39554,37165,34211,44303",
        "Wrist|37183,41830,39247,37853,44203,37366",
        "Hands|39557,39299,37409,37846,37678,44397",
        "Waist|43591,37194,41827,40694,43484,37243",
        "Legs|43286,39555,37644,37374,37890,44179",
        "Feet|43592,44893,41828,37841,43312,44297",
        "Finger|37784,43582,43993,42643,37591,37257",
        "Trinket|44253,37220,44063,42341,40767,44323",
        "Weapon|37883,39422,40497,37190,41257,43409",
        "Relic|48204,47689,49471,48211,49473,48214",
    },
    ["DRUID|Feral DPS"] = {
        "Head|37293,39399,39553,42550,34244,34404",
        "Neck|40678,44659,39146,39421,42645,37861",
        "Shoulder|37139,39237,39556,43481,34392,37593",
        "Back|43406,39404,39297,37647,38614,37840",
        "Chest|39554,43990,37219,44303,37165,34397",
        "Wrist|44203,39247,37366,37853,41830,37117",
        "Hands|39557,37409,39299,34370,37846,37678",
        "Waist|40694,43484,37194,39279,37243,37714",
        "Legs|37644,39224,39555,44179,34188,37374",
        "Feet|44297,39196,37666,37841,44893,43312",
        "Finger|40586,42642,40474,43993,39401,37642",
        "Trinket|44253,40684,39257,37166,37723,37390",
        "Weapon|37883,40497,39422,41257,37848,37733",
        "Relic|48204,47689,49471,48211,49328,45523",
    },
    ["DRUID|Restauracion"] = {
        "Head|37149,39240,43995,34339,37684,44906",
        "Neck|37683,39392,44658,39232,42023,33281",
        "Shoulder|34209,37673,37368,37196,37655,44370",
        "Back|37799,41610,39272,37291,42056,43283",
        "Chest|42102,39538,44180,34398,37236,37258",
        "Wrist|37361,39390,37725,34445,44200,37724",
        "Hands|42113,39543,34342,37798,37261,37858",
        "Waist|37643,39190,39308,44302,40697,37842",
        "Legs|37791,39408,39191,43495,34386,37189",
        "Feet|44202,39215,39254,37730,43502,37640",
        "Finger|37694,37192,39250,44283,44934,43408",
        "Trinket|37111,37657,44322,42988,37835,36972",
        "Weapon|37360,40488,39423,41384,37169,37384",
        "Off hand|40699,37718,44210,37051,37889",
        "Relic|48141,47690,46184,45439,49472,45864",
    },
    ["HUNTER|Bestias"] = {
        "Head|37188,39399,44903,42551,34333,43403",
        "Neck|40678,44659,39146,42645,42021,37861",
        "Shoulder|37679,39237,39581,37373,37139,44372",
        "Back|43406,39404,38614,42061,34241,43566",
        "Chest|39579,43998,44295,37165,44303,37144",
        "Wrist|43131,39278,37366,37656,37170,44203",
        "Hands|39582,39194,37409,37639,37886,37043",
        "Waist|40692,37407,37243,34549,37648,37845",
        "Legs|37669,37644,39580,44117,34188,43458",
        "Feet|44297,44898,37666,37167,34570,37870",
        "Finger|40586,42642,40474,43251,43993,37685",
        "Trinket|44253,40684,37166,39257,37723,42990",
        "Weapon|44249,40497,40491,44193,44311,44187",
        "Off hand|40491,39420,40704,44193,44311,44187",
        "Ranged|37191,39419,39296,44504,37692,44245",
    },
    ["HUNTER|Punteria"] = {
        "Head|37188,39399,44903,42551,34333,43403",
        "Neck|40678,44659,39146,42645,42021,37861",
        "Shoulder|37679,39237,39581,37373,37139,44372",
        "Back|43406,39404,38614,42061,34241,43566",
        "Chest|39579,43998,44295,37165,44303,37144",
        "Wrist|43131,39278,37366,37656,37170,44203",
        "Hands|39582,39194,37409,37639,37886,37043",
        "Waist|40692,37407,37243,34549,37648,37845",
        "Legs|37669,37644,39580,44117,34188,43458",
        "Feet|44297,44898,37666,37167,34570,37870",
        "Finger|40586,42642,40474,43251,43993,37685",
        "Trinket|44253,40684,37166,39257,37723,42990",
        "Weapon|44249,40497,40491,44193,44311,44187",
        "Off hand|40491,39420,40704,44193,44311,44187",
        "Ranged|37191,39419,39296,44504,37692,44245",
    },
    ["HUNTER|Supervivencia"] = {
        "Head|37188,39399,39578,44903,42551,34333",
        "Neck|40678,44659,39421,39146,42645,42021",
        "Shoulder|37679,39237,37139,37373,44372,44257",
        "Back|43406,39404,38614,42061,34241,43566",
        "Chest|39579,43998,43990,44295,37165,44303",
        "Wrist|43131,39278,37366,37656,44203,37170",
        "Hands|39582,37409,39194,37639,37886,37043",
        "Waist|40692,37407,37243,34549,37714,37648",
        "Legs|37669,37644,44117,34188,43458,37221",
        "Feet|44297,44898,37666,37167,44024,34570",
        "Finger|40586,42642,40474,45859,43251,43993",
        "Trinket|44253,40684,37166,39257,37723,37390",
        "Weapon|44249,40497,40491,44311,44193,37235",
        "Off hand|40491,39420,44311,40704,44193,37235",
        "Ranged|37191,39419,39296,44504,44245,37692",
    },
    ["MAGE|Arcano"] = {
        "Head|37294,44910,43995,42553,37684,41984",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39494,37673,37655,37196,41550",
        "Back|41610,39241,42057,36983,44242,37291",
        "Chest|39492,40526,39396,42102,43401,37258",
        "Wrist|37361,39252,37725,37884,34447,44200",
        "Hands|39495,42113,37172,37825,34406,43287",
        "Waist|40696,37408,37850,37680,44302,34557",
        "Legs|34181,39493,37854,37189,41553,43375",
        "Feet|44202,44899,37730,34574,36954,37867",
        "Finger|40585,37694,39389,37651,43253,39250",
        "Trinket|37873,40682,39229,42395,37660,36972",
        "Weapon|37360,40489,39424,45085,44173,37721",
        "Off hand|40698,39199,37134,44210,37718,37051",
        "Ranged|37177,39426,38206,34347,36989,37238",
    },
    ["MAGE|Fuego"] = {
        "Head|37294,43995,39491,44910,42553,41984",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39494,37196,37673,37655,37691",
        "Back|41610,39241,42057,36983,44242,37799",
        "Chest|39492,40526,39396,43401,42102,34399",
        "Wrist|37361,39252,37884,44200,34447,37725",
        "Hands|39495,39192,42113,34344,37172,37798",
        "Waist|40696,37408,37850,37680,34557,37242",
        "Legs|37854,39493,34181,37189,37369,37876",
        "Feet|44202,44899,34574,37730,37218,37867",
        "Finger|43253,40585,39389,37651,42644,37694",
        "Trinket|37873,40682,39229,42395,37660,32483",
        "Weapon|45085,40489,39424,44173,37721,37377",
        "Off hand|40698,39199,37134,44210,30872,37718",
        "Ranged|37177,39426,38206,37238,34347,36989",
    },
    ["MAGE|Escarcha"] = {
        "Head|34340,43995,39491,42553,44910,37684",
        "Neck|40680,44658,39472,40427,37595,42647",
        "Shoulder|34210,39494,37673,37196,37655,42842",
        "Back|41610,42057,36983,44242,34242,37291",
        "Chest|39492,40526,39396,42102,43401,34399",
        "Wrist|37361,39252,37884,34447,37725,41907",
        "Hands|39495,42113,34344,37172,43287,37825",
        "Waist|40696,37408,37850,34557,37242,44302",
        "Legs|34181,39493,37854,37369,37189,43375",
        "Feet|44202,34574,44899,37730,37218,37629",
        "Finger|43253,40585,39389,37651,42644,37694",
        "Trinket|37873,40682,42395,39229,37660,36972",
        "Weapon|45085,40489,39424,44173,37721,37360",
        "Off hand|40698,39199,44210,37134,37718,37086",
        "Ranged|37177,39426,37238,38206,34347,36989",
    },
    ["PALADIN|Sagrado"] = {
        "Head|44296,39260,44949,37180,37182,37592",
        "Neck|40681,44657,39232,42647,43285,42023",
        "Shoulder|37655,39631,37673,34390,37875,37376",
        "Back|41609,39425,39415,34242,37291,44167",
        "Chest|39629,39188,44180,37258,42102,37222",
        "Wrist|37788,37884,37240,37590,37361,37696",
        "Hands|39632,42113,37825,37261,37623,34240",
        "Waist|40691,37643,44181,44302,37242,37637",
        "Legs|37362,39630,37791,37695,37854,44305",
        "Feet|44202,40519,43996,43405,43469,37730",
        "Finger|44283,40585,39244,37694,42644,37192",
        "Trinket|44255,37111,28823,37835,40685,42988",
        "Weapon|37169,39423,40488,41384,44199,37681",
        "Off hand|40700,39233,37061,37216,44032,44210",
        "Relic|48582,48577,49476,47965,48564,46180",
    },
    ["PALADIN|Proteccion"] = {
        "Head|41387,42549,39640,37633,44902,37135",
        "Neck|40679,42646,44660,39246,37646,43282",
        "Shoulder|37635,39267,39642,37814,34389,44373",
        "Back|44188,43988,39225,37197,37728,43565",
        "Chest|39638,39398,44198,37658,37735,44407",
        "Wrist|37620,39467,39195,37682,37040,37668",
        "Hands|39639,37645,44183,37862,37363,37671",
        "Waist|40689,37241,39298,37379,37801,37826",
        "Legs|43500,39258,37292,34381,37688,41345",
        "Feet|44201,39234,37618,41392,44895,37082",
        "Finger|42643,37784,40426,39141,37186,44935",
        "Trinket|37220,36993,44063,42341,39292,44323",
        "Weapon|37401,39344,37260,37179,41383,36984",
        "Off hand|43085,40475,42508,40701,37162,37107",
        "Relic|48644,47677,49475,48639,45935,48634",
    },
    ["PALADIN|Reprension"] = {
        "Head|41386,39399,39403,44902,34244,42552",
        "Neck|40678,39146,44659,39421,42021,42645",
        "Shoulder|37139,39637,39249,39237,34388,39534",
        "Back|37647,39404,39297,38614,42061,34241",
        "Chest|39633,43998,43990,37722,37165,43310",
        "Wrist|41355,37891,37366,34431,37853,44203",
        "Hands|39634,37409,37363,34378,37639,44399",
        "Waist|40694,37088,37407,37826,37194,37171",
        "Legs|37193,43994,37263,37644,34180,44117",
        "Feet|44306,44297,44895,37666,43402,37167",
        "Finger|44935,37642,40474,39401,43993,43251",
        "Trinket|42987,37166,40684,37723,44914,42990",
        "Weapon|37852,39417,40497,41257,37653,37733",
        "Relic|48614,45610,45472,47689,49474,47943",
    },
    ["PRIEST|Disciplina"] = {
        "Head|37294,39295,39514,42553,44909,34339",
        "Neck|40681,44657,39232,42647,42023,37683",
        "Shoulder|37196,39310,37673,37655,34202,41550",
        "Back|41609,39425,37291,34242,42056,44167",
        "Chest|39515,42102,44180,37258,37222,34399",
        "Wrist|37361,37725,37884,41555,37613,34435",
        "Hands|39519,42113,39285,37825,37172,43287",
        "Waist|40697,39190,44302,37289,37242,37637",
        "Legs|37854,39408,39517,39309,37622,34386",
        "Feet|44202,37730,36954,44900,37218,37867",
        "Finger|44283,42644,37694,37192,40585,43408",
        "Trinket|42988,40685,37835,42413,44255,44322",
        "Weapon|37169,39423,40488,39424,37360,41384",
        "Off hand|44210,40699,39311,37718,37051,37889",
        "Ranged|37238,39426,39473,37619,34348,37626",
    },
    ["PRIEST|Sagrado"] = {
        "Head|37294,43995,39514,42553,37684,34339",
        "Neck|40681,44657,39392,40486,42647,37683",
        "Shoulder|37655,39310,39518,37673,37196,37691",
        "Back|41609,39425,37630,37799,37291,34242",
        "Chest|42102,44180,39515,37258,37222,34233",
        "Wrist|37361,39390,37884,37725,44200,37613",
        "Hands|42113,39519,39285,37172,37798,37825",
        "Waist|40697,39190,44302,37242,37637,37289",
        "Legs|37854,39408,39517,39309,37622,37189",
        "Feet|44202,39254,37730,37867,37218,37629",
        "Finger|44283,40585,39250,37694,37192,42647",
        "Trinket|44255,37111,42413,40430,44322,28823",
        "Weapon|37360,40488,39423,39424,37169,41384",
        "Off hand|44210,40699,37718,37051,37889",
        "Ranged|37619,39426,39473,37238,34348,37626",
    },
    ["PRIEST|Sombras"] = {
        "Head|34340,43995,39521,44910,42553,41984",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39529,37673,37655,37196,41550",
        "Back|41610,39241,42057,36983,44242,37291",
        "Chest|39523,40526,39396,43401,42102,37258",
        "Wrist|37361,39252,39390,37884,37725,44200",
        "Hands|39530,39192,39192,42113,34344,37172",
        "Waist|40696,37408,37850,37680,44302,37242",
        "Legs|37854,34386,37189,37369,43375,37876",
        "Feet|44202,44899,37730,37218,37867,34563",
        "Finger|40585,43253,39389,44283,37694,37192",
        "Trinket|37873,40682,42395,39229,36972,32483",
        "Weapon|41384,40489,39424,39423,37169,44173",
        "Off hand|40698,39199,37134,44210,37718,37051",
        "Ranged|37177,39426,36989,37238,34347,38206",
    },
    ["ROGUE|Asesinato"] = {
        "Head|37293,39399,39561,42550,34244,32235",
        "Neck|40678,39146,39421,44659,42645,37861",
        "Shoulder|37139,39237,39565,43481,37593,34195",
        "Back|43566,39404,39297,38614,43406,37840",
        "Chest|39558,43990,39386,37219,37165,44303",
        "Wrist|34448,44203,37366,39247,37853,41830",
        "Hands|39560,37409,37846,34370,37678,44397",
        "Waist|40694,37194,43484,39279,34558,37243",
        "Legs|37644,39564,39224,44179,44117,34188",
        "Feet|34575,44297,39196,37666,44024,37841",
        "Finger|37642,40586,40474,39277,43251,37685",
        "Trinket|44253,40684,37166,34427,37390,43573",
        "Weapon|37856,39427,37037,44166,44310,42435",
        "Off hand|37667,39420,39140,40702,44193,37181",
        "Ranged|37191,39296,43612,44504,40716,43284",
    },
    ["ROGUE|Combate"] = {
        "Head|37293,39399,39561,42550,34244,32235",
        "Neck|40678,39146,39421,44659,42645,37861",
        "Shoulder|37139,39237,39565,43481,34195,37593",
        "Back|43566,39404,39297,38614,43406,34241",
        "Chest|39558,43990,39386,37219,37165,44303",
        "Wrist|34448,39247,44203,37366,37853,41830",
        "Hands|39560,37409,34370,37846,36951,37678",
        "Waist|40694,39279,37194,43484,34558,37243",
        "Legs|37644,39564,39224,34188,44117,44179",
        "Feet|34575,44297,39196,37666,43312,44024",
        "Finger|40586,42642,40474,43993,39277,37642",
        "Trinket|44253,40684,37166,34427,37390,43573",
        "Weapon|37693,39416,39291,40429,43611,32837",
        "Off hand|37856,42248,40491,39427,44311,32838",
        "Ranged|37191,39296,43612,44504,43284,40716",
    },
    ["SHAMAN|Elemental"] = {
        "Head|31014,44904,39594,42555,41984,37180",
        "Neck|37595,44658,39472,40427,42024,40680",
        "Shoulder|31023,37673,34390,37875,37655,41550",
        "Back|41610,42057,39241,36983,44242,34242",
        "Chest|39592,40526,39396,43401,42102,34396",
        "Wrist|34437,39252,37788,37884,37361,37725",
        "Hands|39593,34344,42113,37623,43287,34350",
        "Waist|40696,37408,37680,37850,37643,44181",
        "Legs|37791,39595,34186,37854,37695,44931",
        "Feet|34566,40519,44896,44202,43469,37730",
        "Finger|43253,40585,39389,37694,37192,44283",
        "Trinket|37873,40682,42395,37660,39229,32483",
        "Weapon|41384,40489,39423,39424,44173,37169",
        "Off hand|40698,37134,39233,37718,44210,37051",
        "Relic|48323,49468,47693,49331,46209,45150",
    },
    ["SHAMAN|Mejora"] = {
        "Head|37293,39602,39399,39294,44903,42551",
        "Neck|40678,44658,39472,40427,39146,37595",
        "Shoulder|37373,39237,44372,37139,37679,44257",
        "Back|41610,39404,38614,42057,43406,36983",
        "Chest|39597,40526,43998,44295,43401,37165",
        "Wrist|43131,39278,37366,34439,37656,40490",
        "Hands|39601,37409,39194,37639,34344,37886",
        "Waist|40694,37407,37408,37243,37194,37643",
        "Legs|37669,39603,37644,44117,37890,34188",
        "Feet|44297,44898,37666,37167,44024,44202",
        "Finger|43251,40586,39389,40474,43253,37685",
        "Trinket|40684,37390,37873,37166,39257,40682",
        "Weapon|45085,39423,39424,41384,44173,37377",
        "Off hand|40704,39468,37871,43407,34346,44193",
        "Relic|48353,45610,48348,47942,47693,49469",
    },
    ["SHAMAN|Restauracion"] = {
        "Head|34332,39583,42555,37180,44905,37592",
        "Neck|40681,44657,39232,42647,42023,43285",
        "Shoulder|37673,34390,37875,37655,37398,37652",
        "Back|41610,39425,37291,34242,42056,44167",
        "Chest|39588,43461,44180,37258,37236,37222",
        "Wrist|34438,37788,37884,37361,37725,37696",
        "Hands|39591,42113,37623,37261,37825,37858",
        "Waist|40693,37643,44181,44302,37242,37868",
        "Legs|37791,39217,39589,37695,37854,44931",
        "Feet|34565,40519,43996,44202,43469,37730",
        "Finger|40585,37694,39244,44283,37192,42644",
        "Trinket|37111,37657,42988,37835,40685,44322",
        "Weapon|37169,39423,40488,41384,37360,44199",
        "Off hand|40700,39233,39311,37061,44210,37718",
        "Relic|46201,48292,47965,47686,48287,47813",
    },
    ["WARRIOR|Armas"] = {
        "Head|41386,39399,42552,44902,34333,37188",
        "Neck|42645,44659,39421,40678,37861,42021",
        "Shoulder|34392,39249,39608,37139,37373,44195",
        "Back|37647,39404,39297,38614,43406,42061",
        "Chest|39606,43998,37722,44295,37165,44303",
        "Wrist|44203,39278,34441,41355,37891,37366",
        "Hands|39609,37409,39194,37363,37639,37886",
        "Waist|40692,37407,37088,37826,37243,37171",
        "Legs|37263,43994,37193,37644,34188,37669",
        "Feet|44306,44297,34569,37666,43402,44895",
        "Finger|42642,40586,40474,43993,43251,37685",
        "Trinket|42987,40684,37166,39257,37723,42990",
        "Weapon|37852,40497,39417,39221,37653,43409",
        "Ranged|37191,43612,39296,44504,37692,44245",
    },
    ["WARRIOR|Furia"] = {
        "Head|41386,39605,42552,44902,37293,37188",
        "Neck|40678,44659,39421,39146,37861,42645",
        "Shoulder|34388,39249,39608,37139,44195,39534",
        "Back|37647,39404,39297,38614,43406,37840",
        "Chest|39606,43998,37722,37219,37165,36950",
        "Wrist|44203,41355,34441,37891,37366,37170",
        "Hands|39609,37409,37363,37639,37886,34341",
        "Waist|40694,37088,37407,37826,37171,37194",
        "Legs|34180,43994,37263,37193,37644,37669",
        "Feet|44306,44297,34569,37666,44895,37367",
        "Finger|40586,37642,40474,43993,39401,43251",
        "Trinket|42987,40684,39257,37166,37390,37723",
        "Weapon|37852,39417,41257,37653,44249,37733",
        "Off hand|37852,40497,39417,41257,37653,44249",
        "Ranged|37191,39296,39419,43612,44504,44245",
    },
    ["WARRIOR|Proteccion"] = {
        "Head|41387,39610,42549,39395,44902,34401",
        "Neck|40679,39470,44660,37646,42646,37689",
        "Shoulder|34389,39267,44312,39613,37814,37635",
        "Back|37728,43988,37197,39225,43565,44188",
        "Chest|39611,39398,44198,37658,37735,34394",
        "Wrist|37620,39467,37682,40887,37040,34442",
        "Hands|39622,39197,37645,44183,37862,43213",
        "Waist|40689,39298,34547,37379,37241,37801",
        "Legs|43500,39258,39612,37292,37688,34381",
        "Feet|44201,39234,37082,44243,44895,40878",
        "Finger|34213,37784,40426,39141,37186,42643",
        "Trinket|37220,36993,44063,42341,39292,44323",
        "Weapon|37401,40491,39270,39344,37260,37255",
        "Off hand|40701,40475,39276,43085,42508,37162",
        "Ranged|41168,39419,43612,40716,44118,37615",
    },
    ["WARLOCK|Afliccion"] = {
        "Head|37684,43995,39496,44910,42553,34340",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39499,37673,37196,37655,41550",
        "Back|41610,39241,42057,34242,37291,37799",
        "Chest|42102,40526,39396,39497,43401,34399",
        "Wrist|37361,39252,39390,44200,37884,37725",
        "Hands|42113,39192,34344,39500,37172,43287",
        "Waist|40696,37408,39190,37850,44302,44309",
        "Legs|34386,37854,37189,43375,37876,37731",
        "Feet|44202,34564,44899,37730,41879,37867",
        "Finger|43253,37694,39389,39250,40585,37192",
        "Trinket|37873,40682,39229,42395,36972,37660",
        "Weapon|45085,40489,39424,37360,37721,44173",
        "Off hand|40698,39199,44210,37134,37718,37051",
        "Ranged|37177,39426,34348,38206,37619,37238",
    },
    ["WARLOCK|Demonologia"] = {
        "Head|37684,43995,44910,39496,42553,34339",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39499,37673,37196,37655,44370",
        "Back|41610,39241,42057,36983,44242,34242",
        "Chest|39497,40526,39396,42102,43401,34399",
        "Wrist|37361,39252,44200,37725,37884,36945",
        "Hands|42113,39192,34344,37172,39500,37798",
        "Waist|40696,37408,37850,37680,34541,44302",
        "Legs|34386,37189,37854,37876,37731,43375",
        "Feet|44202,44899,34564,37730,41879,37867",
        "Finger|43253,37694,39389,39250,37192,40585",
        "Trinket|37873,40682,42395,39229,37660,32483",
        "Weapon|45085,40489,39424,37721,37360,44173",
        "Off hand|40698,39199,37134,44210,37718,37889",
        "Ranged|34348,39426,37177,38206,37619,36989",
    },
    ["WARLOCK|Destruccion"] = {
        "Head|37684,44910,43995,41984,42553,37294",
        "Neck|40680,44658,39472,40427,37595,42024",
        "Shoulder|34210,39499,37196,37673,37655,44370",
        "Back|41610,39241,42057,36983,44242,37799",
        "Chest|39497,40526,43401,42102,34399,37222",
        "Wrist|37361,39252,44200,36945,37884,34436",
        "Hands|42113,39192,34344,37172,39500,37798",
        "Waist|40696,37408,37850,37680,44196,34541",
        "Legs|34386,37189,37854,37876,37731,37369",
        "Feet|44202,44899,34564,37730,41879,37867",
        "Finger|43253,42644,39389,39250,40585,37694",
        "Trinket|37873,40682,42395,39229,37660,37835",
        "Weapon|45085,40489,39424,37721,44173,37377",
        "Off hand|40698,39199,37134,44210,37718,37889",
        "Ranged|34348,37177,39426,38206,36989,37619",
    },
}

local MB_PreRaidSlotMap = {
    Head = "Cabeza",
    Neck = "Cuello",
    Shoulder = "Hombros",
    Back = "Espalda",
    Chest = "Pecho",
    Wrist = "Muñecas",
    Hands = "Manos",
    Waist = "Cintura",
    Legs = "Piernas",
    Feet = "Pies",
    Weapon = "Arma principal",
    ["Off hand"] = "Mano secundaria",
    Ranged = "A distancia",
}

local function MB_LoadRankedPreRaid(class, spec, rows)
    local profile = MyBissData:GetBuild("PVE", class, spec, "PRE_RAID")
    if not profile then return end

    profile.bestInSlot = profile.bestInSlot or {}
    profile.alternatives = profile.alternatives or {}
    profile.extraSlots = profile.extraSlots or {}

    for _, row in ipairs(rows) do
        local sourceSlot, values = string.match(row, "^([^|]+)|(.+)$")
        local ids = {}

        for value in string.gmatch(values or "", "%d+") do
            local id = tonumber(value)
            if id and id > 0 then
                table.insert(ids, id)
            end
        end

        if sourceSlot == "Finger" or sourceSlot == "Trinket" then
            local firstSlot = sourceSlot == "Finger" and "Dedo 1" or "Abalorio 1"
            local secondSlot = sourceSlot == "Finger" and "Dedo 2" or "Abalorio 2"

            for i = 1, math.min(2, #ids) do
                local targetSlot = i == 1 and firstSlot or secondSlot
                profile.bestInSlot[targetSlot] = {
                    itemID = ids[i],
                    name = "Item " .. ids[i],
                }
            end

            for i = 3, #ids do
                MyBissData:AddAlternative(
                    "PVE", class, spec, "PRE_RAID",
                    firstSlot, ids[i], "Item " .. ids[i],
                    "Prioridad " .. i .. " - lista Pre-Raid"
                )

                MyBissData:AddAlternative(
                    "PVE", class, spec, "PRE_RAID",
                    secondSlot, ids[i], "Item " .. ids[i],
                    "Prioridad " .. i .. " - lista Pre-Raid"
                )
            end

        elseif sourceSlot == "Relic" then
            if ids[1] then
                profile.extraSlots["Reliquia"] = {
                    itemID = ids[1],
                    name = "Item " .. ids[1],
                }

                profile.extraSlots.ReliquiaAlternativas = {}

                for i = 2, #ids do
                    table.insert(
                        profile.extraSlots.ReliquiaAlternativas,
                        { itemID = ids[i], name = "Item " .. ids[i] }
                    )
                end
            end

        else
            local targetSlot = MB_PreRaidSlotMap[sourceSlot]

            if targetSlot and ids[1] then
                profile.bestInSlot[targetSlot] = {
                    itemID = ids[1],
                    name = "Item " .. ids[1],
                }

                for i = 2, #ids do
                    MyBissData:AddAlternative(
                        "PVE", class, spec, "PRE_RAID",
                        targetSlot, ids[i], "Item " .. ids[i],
                        "Prioridad " .. i .. " - lista Pre-Raid"
                    )
                end
            end
        end
    end

    profile.status = "has_data"
end

for key, rows in pairs(MB_PreRaidData) do
    local class, spec = string.match(key, "^([^|]+)|(.+)$")
    MB_LoadRankedPreRaid(class, spec, rows)
end

-- Sutileza no aparece en la fuente original.
-- Se mantiene pendiente para no inventar objetos.

--========================================================
-- MY BISS - CARGADOR DE TIERS T7/T8/T9
-- Preserva cualquier BiS existente y agrega alternativas
--========================================================

MyBissData.ItemSources = MyBissData.ItemSources or {}

local function MB_TierProfile(class, spec, phase)
    return MyBissData.Gear[class]
        and MyBissData.Gear[class][spec]
        and MyBissData.Gear[class][spec][phase]
end

local function MB_TierAddAlternative(profile, class, spec, phase, slot, itemID)
    if not profile or not itemID then return end
    profile.bestInSlot = profile.bestInSlot or {}
    local current = profile.bestInSlot[slot]
    if current and tonumber(current.itemID) == tonumber(itemID) then return end

    profile.alternatives = profile.alternatives or {}
    profile.alternatives[slot] = profile.alternatives[slot] or {}

    for _, alt in ipairs(profile.alternatives[slot]) do
        if tonumber(alt.itemID) == tonumber(itemID) then return end
    end

    MyBissData:AddAlternative(
        "PVE", class, spec, phase, slot, itemID,
        "Item " .. tostring(itemID),
        "Lista BiS original - " .. phase
    )
end

local function MB_TierAddRankedSlot(class, spec, phase, slot, ids)
    if not ids or #ids == 0 then return end
    local profile = MB_TierProfile(class, spec, phase)
    if not profile then return end

    profile.bestInSlot = profile.bestInSlot or {}
    if not profile.bestInSlot[slot] then
        MyBissData:SetBuildItem(
            "PVE", class, spec, phase, slot,
            ids[1], "Item " .. tostring(ids[1])
        )
    else
        MB_TierAddAlternative(profile, class, spec, phase, slot, ids[1])
    end

    for i = 2, #ids do
        MB_TierAddAlternative(profile, class, spec, phase, slot, ids[i])
    end
    profile.status = "has_data"
end

local function MB_LoadRankedTierData(phase, rawData)
    local slotMap = {
        Head = "Cabeza", Neck = "Cuello", Shoulder = "Hombros",
        Back = "Espalda", Chest = "Pecho", Wrist = "Muñecas",
        Hands = "Manos", Waist = "Cintura", Legs = "Piernas",
        Feet = "Pies", Weapon = "Arma principal",
        ["Off hand"] = "Mano secundaria", Ranged = "A distancia"
    }

    for line in string.gmatch(rawData, "[^\n]+") do
        local class, spec, sourceSlot, idList =
            string.match(line, "^([^|]+)|([^|]+)|([^|]+)|(.+)$")

        if class and spec and sourceSlot and idList then
            local ids = {}
            for idText in string.gmatch(idList, "[^,]+") do
                local id = tonumber(idText)
                if id and id > 0 then table.insert(ids, id) end
            end

            local profile = MB_TierProfile(class, spec, phase)

            if profile and #ids > 0 then
                for _, id in ipairs(ids) do
                    MyBissData.ItemSources[id] = MyBissData.ItemSources[id]
                        or ("Lista BiS original - " .. phase .. "; jefe y dificultad pendientes de verificar")
                end

                if sourceSlot == "Finger" or sourceSlot == "Trinket" then
                    local slot1, slot2
                    if sourceSlot == "Finger" then
                        slot1, slot2 = "Dedo 1", "Dedo 2"
                    else
                        slot1, slot2 = "Abalorio 1", "Abalorio 2"
                    end

                    if ids[1] then MB_TierAddRankedSlot(class, spec, phase, slot1, {ids[1]}) end
                    if ids[2] then MB_TierAddRankedSlot(class, spec, phase, slot2, {ids[2]}) end

                    for i = 3, #ids do
                        MB_TierAddAlternative(profile, class, spec, phase, slot1, ids[i])
                        MB_TierAddAlternative(profile, class, spec, phase, slot2, ids[i])
                    end

                elseif sourceSlot == "Relic" then
                    profile.extraSlots = profile.extraSlots or {}
                    profile.extraAlternatives = profile.extraAlternatives or {}

                    if not profile.extraSlots["Reliquia"] then
                        profile.extraSlots["Reliquia"] = {
                            itemID = ids[1], name = "Item " .. tostring(ids[1])
                        }
                    end

                    profile.extraAlternatives["Reliquia"] = profile.extraAlternatives["Reliquia"] or {}
                    for i = 2, #ids do
                        local found = false
                        for _, alt in ipairs(profile.extraAlternatives["Reliquia"]) do
                            if tonumber(alt.itemID) == ids[i] then found = true break end
                        end
                        if not found then
                            table.insert(profile.extraAlternatives["Reliquia"], {
                                itemID = ids[i], name = "Item " .. tostring(ids[i])
                            })
                        end
                    end
                else
                    local slot = slotMap[sourceSlot]
                    if slot then MB_TierAddRankedSlot(class, spec, phase, slot, ids) end
                end
            end
        end
    end
end

--========================================================
-- TIER 7 - 30 ESPECIALIZACIONES
--========================================================

MB_LoadRankedTierData("T7", [[
DEATHKNIGHT|Sangre|Head|40565,40328,44006,39395,39625,41387
DEATHKNIGHT|Sangre|Neck|40387,44665,40069,44660,40679,39246
DEATHKNIGHT|Sangre|Shoulder|40568,39704,39267,39627,44312,40334
DEATHKNIGHT|Sangre|Back|40722,40252,43988,43565,40410,39225
DEATHKNIGHT|Sangre|Chest|40559,44000,40203,40279,39623,40365
DEATHKNIGHT|Sangre|Wrist|40734,40306,39467,37620,39764,39195
DEATHKNIGHT|Sangre|Hands|40563,39726,39624,39197,37645,44183
DEATHKNIGHT|Sangre|Waist|39759,40689,37241,40263,40278,37801
DEATHKNIGHT|Sangre|Legs|40589,40567,40446,39626,43994,43500
DEATHKNIGHT|Sangre|Feet|40297,40743,39234,40742,40206,39717
DEATHKNIGHT|Sangre|Finger|40370,40107,40718,39141,40426,42643
DEATHKNIGHT|Sangre|Trinket|37220,40257,44063,42341,39292,44323
DEATHKNIGHT|Sangre|Weapon|40406,42322,40402,40345,40384,39344
DEATHKNIGHT|Sangre|Off hand|40402,40345,39344,37401,37260,37179
DEATHKNIGHT|Sangre|Relic|40822,40714
DEATHKNIGHT|Escarcha|Head|44006,41386,40554,39403,39619,40543
DEATHKNIGHT|Escarcha|Neck|44664,40065,39146,44659,39421,40369
DEATHKNIGHT|Escarcha|Shoulder|40557,40414,39621,40185,39249,40315
DEATHKNIGHT|Escarcha|Back|40403,40250,39404,40721,39297,38614
DEATHKNIGHT|Escarcha|Chest|40550,40539,40277,43998,39767,39617
DEATHKNIGHT|Escarcha|Wrist|40330,40186,39729,40733,39195,40282
DEATHKNIGHT|Escarcha|Hands|40552,40261,40541,39727,40347,40262
DEATHKNIGHT|Escarcha|Waist|40278,40260,39345,40317,39762,37088
DEATHKNIGHT|Escarcha|Legs|40556,44011,40294,37193,43994,40318
DEATHKNIGHT|Escarcha|Feet|40591,40206,40742,39701,39706,44297
DEATHKNIGHT|Escarcha|Finger|40075,43993,40474,40074,39401,40717
DEATHKNIGHT|Escarcha|Trinket|42987,40256,40531,40431,40684,37166
DEATHKNIGHT|Escarcha|Weapon|40189,42208,40407,40345,39291,41383
DEATHKNIGHT|Escarcha|Off hand|40189,42208,40407,40345,39291,41383
DEATHKNIGHT|Escarcha|Relic|40207,40715,40822
DEATHKNIGHT|Profano|Head|44006,41386,40554,39403,39619,40543
DEATHKNIGHT|Profano|Neck|44664,40065,39421,39146,44659,40369
DEATHKNIGHT|Profano|Shoulder|40557,40414,39621,39249,40185,40315
DEATHKNIGHT|Profano|Back|40403,40721,37647,39404,39297,40250
DEATHKNIGHT|Profano|Chest|40550,39767,40365,39617,39239,43990
DEATHKNIGHT|Profano|Wrist|40330,39729,40733,39195,39765,41355
DEATHKNIGHT|Profano|Hands|40347,40261,40552,40541,34378,39618
DEATHKNIGHT|Profano|Waist|40278,40317,39345,40260,40688,37171
DEATHKNIGHT|Profano|Legs|40294,44011,40556,37193,43994,39620
DEATHKNIGHT|Profano|Feet|39706,40206,40742,40591,39139,39701
DEATHKNIGHT|Profano|Finger|40075,39401,40474,40074,40717,44935
DEATHKNIGHT|Profano|Trinket|42987,37390,40531,37166,40256,40684
DEATHKNIGHT|Profano|Weapon|40402,40491,40189,40407,39730,40345
DEATHKNIGHT|Profano|Off hand|40402,40491,40189,40407,39730,40345
DEATHKNIGHT|Profano|Relic|40867,42620,40822,40715,40207
DRUID|Equilibrio|Head|40467,39545,40562,44007,40339,43995
DRUID|Equilibrio|Neck|44661,44658,39472,40427,40064,40374
DRUID|Equilibrio|Shoulder|40470,40286,40351,39548,40555,40594
DRUID|Equilibrio|Back|44005,40405,39241,40251,40253,40723
DRUID|Equilibrio|Chest|40469,40526,40234,39396,44002,43401
DRUID|Equilibrio|Wrist|44008,40325,40740,39252,40198,40323
DRUID|Equilibrio|Hands|40466,40380,40197,39192,40238,39733
DRUID|Equilibrio|Waist|40561,40301,40696,37408,40341,40200
DRUID|Equilibrio|Legs|40560,39720,40376,40398,40468,40379
DRUID|Equilibrio|Feet|40519,40246,40750,40558,40409,40270
DRUID|Equilibrio|Finger|40399,40080,39389,40719,43253,40585
DRUID|Equilibrio|Trinket|40255,40432,37873,42395,40682,39229
DRUID|Equilibrio|Weapon|40395,40489,40408,39424,39763,39423
DRUID|Equilibrio|Off hand|40192,40273,40698,39199,37134,39766
DRUID|Equilibrio|Relic|40321,40712,32387,38360
DRUID|Feral Tanque|Head|40329,40473,39399,44908,39553,42550
DRUID|Feral Tanque|Neck|40387,44664,42646,39246,40069,44659
DRUID|Feral Tanque|Shoulder|40494,40437,39556,40305,43481,37139
DRUID|Feral Tanque|Back|40252,40722,40403,43988,43565,43406
DRUID|Feral Tanque|Chest|40471,40277,43590,40539,40319,43990
DRUID|Feral Tanque|Wrist|40186,39765,40738,37183,41830,39247
DRUID|Feral Tanque|Hands|40472,40362,39727,40541,39299,39557
DRUID|Feral Tanque|Waist|43591,40260,37194,40205,41827,40694
DRUID|Feral Tanque|Legs|44011,40493,39555,40333,39761,37644
DRUID|Feral Tanque|Feet|40243,43592,40748,44893,41828,39701
DRUID|Feral Tanque|Finger|40370,37784,43993,40718,43582,42643
DRUID|Feral Tanque|Trinket|44253,37220,44063,42341,40257,40767
DRUID|Feral Tanque|Weapon|40280,40388,40233,39422,40406,40497
DRUID|Feral Tanque|Relic|38365,33509
DRUID|Feral DPS|Head|40473,40329,39399,39553,42550,37293
DRUID|Feral DPS|Neck|44664,40065,44659,39146,40369,39421
DRUID|Feral DPS|Shoulder|40494,40437,40305,39237,39556,43481
DRUID|Feral DPS|Back|40403,40250,39404,40721,39297,43406
DRUID|Feral DPS|Chest|40539,40277,40471,43990,39554,40319
DRUID|Feral DPS|Wrist|39765,40186,40738,39247,44203,37366
DRUID|Feral DPS|Hands|40541,39727,40362,40472,37409,39299
DRUID|Feral DPS|Waist|40205,40260,40694,43484,37194,39279
DRUID|Feral DPS|Legs|44011,40493,39761,40333,39224,39555
DRUID|Feral DPS|Feet|40243,39701,40748,44297,39196,37666
DRUID|Feral DPS|Finger|40474,40717,40074,40075,43993,39401
DRUID|Feral DPS|Trinket|42987,40256,40431,40684,39257,37166
DRUID|Feral DPS|Weapon|40388,40497,40406,40208,39758,39422
DRUID|Feral DPS|Relic|39757,40713,38365
DRUID|Restauracion|Head|44007,40287,40562,39240,43995,40461
DRUID|Restauracion|Neck|39392,44661,40071,44658,40374,39232
DRUID|Restauracion|Shoulder|39719,40063,40594,40555,40465,40286
DRUID|Restauracion|Back|40723,44005,40405,41610,40253,39272
DRUID|Restauracion|Chest|44002,40463,39756,42102,39538,40194
DRUID|Restauracion|Wrist|44008,40323,39731,39390,40741,37361
DRUID|Restauracion|Hands|40460,39733,40349,42113,39543,40197
DRUID|Restauracion|Waist|40561,40341,40566,39190,39308,40271
DRUID|Restauracion|Legs|40379,40060,39408,40398,39191,40462
DRUID|Restauracion|Feet|40558,40409,40326,40751,39215,39254
DRUID|Restauracion|Finger|40719,40375,39250,40399,40433,37694
DRUID|Restauracion|Trinket|40432,37111,44322,37657,42988,37835
DRUID|Restauracion|Weapon|40395,40488,39763,39423,40244,40300
DRUID|Restauracion|Off hand|39766,40699,40192,37718,44210,37051
DRUID|Restauracion|Relic|40342,33508,25643,38366
HUNTER|Bestias|Head|40543,40451,40344,40505,39399,39578
HUNTER|Bestias|Neck|44664,40065,44659,40369,39421,40678
HUNTER|Bestias|Shoulder|40507,40315,44003,40299,39237,39581
HUNTER|Bestias|Back|40403,39404,40250,40721,38614,39297
HUNTER|Bestias|Chest|43998,40503,39724,40277,39248,40193
HUNTER|Bestias|Wrist|40282,40736,43131,39278,39702,39765
HUNTER|Bestias|Hands|40541,40262,39194,40504,40242,37409
HUNTER|Bestias|Waist|39762,40260,40692,37407,40275,40205
HUNTER|Bestias|Legs|40506,44011,40331,40201,39580,37644
HUNTER|Bestias|Feet|40549,40746,39701,44297,40184,40367
HUNTER|Bestias|Finger|40474,43993,40074,40717,39277,43251
HUNTER|Bestias|Trinket|40256,44253,37166,40431,40371,39257
HUNTER|Bestias|Weapon|40388,40386,40497,40491,39420,39714
HUNTER|Bestias|Off hand|40386,40491,39420,39714,40239,44311
HUNTER|Bestias|Ranged|40385,40265,39419,40346,42485,39296
HUNTER|Punteria|Head|40543,40451,40505,40344,39399,44903
HUNTER|Punteria|Neck|44664,40065,44659,40369,39146,40678
HUNTER|Punteria|Shoulder|40507,40315,44003,39237,40299,39581
HUNTER|Punteria|Back|40403,39404,40250,40721,38614,43406
HUNTER|Punteria|Chest|43998,40503,39724,40277,39248,39579
HUNTER|Punteria|Wrist|40282,40736,43131,39278,39702,39765
HUNTER|Punteria|Hands|40504,40541,40262,39194,37409,39727
HUNTER|Punteria|Waist|40275,40260,39762,37407,40692,40205
HUNTER|Punteria|Legs|40331,44011,40506,40201,37644,39580
HUNTER|Punteria|Feet|40549,39701,40746,44297,40184,40367
HUNTER|Punteria|Finger|40474,40074,40717,43251,43993,37685
HUNTER|Punteria|Trinket|44253,40684,40256,37166,39257,40431
HUNTER|Punteria|Weapon|40388,40386,40497,40491,39714,40384
HUNTER|Punteria|Off hand|40386,40491,39714,40239,39420,40704
HUNTER|Punteria|Ranged|40385,39419,40265,40346,42485,39296
HUNTER|Supervivencia|Head|40543,40451,39399,40505,40344,39578
HUNTER|Supervivencia|Neck|44664,40065,40369,44659,39421,39146
HUNTER|Supervivencia|Shoulder|40507,40315,39237,44003,40299,40305
HUNTER|Supervivencia|Back|40403,39404,40250,40721,38614,43406
HUNTER|Supervivencia|Chest|43998,40503,39724,40277,43990,39579
HUNTER|Supervivencia|Wrist|40282,40736,43131,39278,39765,39702
HUNTER|Supervivencia|Hands|40541,40262,37409,39194,39727,40242
HUNTER|Supervivencia|Waist|40275,40260,39762,37407,40692,40205
HUNTER|Supervivencia|Legs|40506,44011,40331,37644,40201,40333
HUNTER|Supervivencia|Feet|40549,39701,40746,44297,40184,40367
HUNTER|Supervivencia|Finger|40474,40074,40717,45859,43251,43993
HUNTER|Supervivencia|Trinket|44253,40256,37166,40431,40684,39257
HUNTER|Supervivencia|Weapon|40388,40497,40386,40491,39714,40384
HUNTER|Supervivencia|Off hand|40386,40491,39714,39420,40239,44311
HUNTER|Supervivencia|Ranged|40385,40265,39419,40346,39296,37191
MAGE|Arcano|Head|40416,40562,40287,40339,44910,43995
MAGE|Arcano|Neck|44661,44658,39472,40064,40427,40374
MAGE|Arcano|Shoulder|40419,40286,40351,39719,40555,39494
MAGE|Arcano|Back|44005,39241,40723,40405,41610,40251
MAGE|Arcano|Chest|44002,40526,40234,39396,42102,40418
MAGE|Arcano|Wrist|44008,40325,40740,39252,39731,40198
MAGE|Arcano|Hands|40415,40380,40197,42113,39495,39733
MAGE|Arcano|Waist|40561,40301,40696,37408,37850,39735
MAGE|Arcano|Legs|40417,40560,40376,39720,39493,40398
MAGE|Arcano|Feet|40558,40246,40750,40326,44202,44899
MAGE|Arcano|Finger|40399,40719,39389,37651,43253,39250
MAGE|Arcano|Trinket|40255,39229,37873,40432,42395,40682
MAGE|Arcano|Weapon|40396,40489,40408,39424,40336,42346
MAGE|Arcano|Off hand|40273,40698,39199,37134,39766,40192
MAGE|Arcano|Ranged|39426,39712,37177,38206,40284,40245
MAGE|Fuego|Head|40416,40562,43995,40287,40339,39491
MAGE|Fuego|Neck|44661,44658,39472,40427,40064,40374
MAGE|Fuego|Shoulder|40419,40286,40351,40555,39719,39494
MAGE|Fuego|Back|44005,40405,41610,39241,40251,40723
MAGE|Fuego|Chest|40418,40526,40234,39396,44002,40062
MAGE|Fuego|Wrist|44008,40325,40740,39252,40198,39731
MAGE|Fuego|Hands|40415,40380,39495,40197,39192,42113
MAGE|Fuego|Waist|40561,40301,37408,40696,39735,37850
MAGE|Fuego|Legs|40560,39720,40417,40376,39493,40398
MAGE|Fuego|Feet|40558,40246,40750,40326,40269,40751
MAGE|Fuego|Finger|39389,40399,43253,37651,40080,40719
MAGE|Fuego|Trinket|40255,40432,37873,39229,42395,40682
MAGE|Fuego|Weapon|40396,40489,40408,39424,40336,45085
MAGE|Fuego|Off hand|40273,40698,39199,37134,40192,39766
MAGE|Fuego|Ranged|39712,37177,40284,39426,38206,37238
MAGE|Escarcha|Head|40416,40562,40287,40339,43995,39491
MAGE|Escarcha|Neck|44661,44658,39472,40374,40064,40427
MAGE|Escarcha|Shoulder|40419,40286,40351,39719,40555,39494
MAGE|Escarcha|Back|44005,41610,40723,40405,40251,39241
MAGE|Escarcha|Chest|40418,40526,40234,39396,44002,42102
MAGE|Escarcha|Wrist|44008,40325,39252,40740,39731,40198
MAGE|Escarcha|Hands|40415,40380,34344,42113,39495,39733
MAGE|Escarcha|Waist|40561,40301,40696,37408,37850,39735
MAGE|Escarcha|Legs|40560,40417,39493,39720,40376,40398
MAGE|Escarcha|Feet|40558,40246,40750,40326,40751,44202
MAGE|Escarcha|Finger|40399,40719,39389,37651,43253,37694
MAGE|Escarcha|Trinket|40255,40432,37873,42395,39229,40682
MAGE|Escarcha|Weapon|40396,40489,40408,39424,40336,42346
MAGE|Escarcha|Off hand|40273,40698,39766,39199,37134,40192
MAGE|Escarcha|Ranged|39712,37177,39426,38206,40284,40245
PALADIN|Sagrado|Head|40298,44007,40339,40571,39260,40304
PALADIN|Sagrado|Neck|44662,40374,44657,40071,40378,39232
PALADIN|Sagrado|Shoulder|40573,39725,40590,40439,40377,39631
PALADIN|Sagrado|Back|44005,40251,39425,40724,39415,40254
PALADIN|Sagrado|Chest|40569,40283,40453,40588,39188,40249
PALADIN|Sagrado|Wrist|40324,40274,40332,44008,40209,40741
PALADIN|Sagrado|Hands|40570,39703,40564,40302,40316,39632
PALADIN|Sagrado|Waist|40259,40561,40327,40691,40272,40241
PALADIN|Sagrado|Legs|40572,40352,40204,39630,40398,40363
PALADIN|Sagrado|Feet|40187,40592,40237,40519,43996,39734
PALADIN|Sagrado|Finger|40399,40375,39244,40108,40433,44283
PALADIN|Sagrado|Trinket|44255,37111,28823,40258,37835,40685
PALADIN|Sagrado|Weapon|40396,40395,39423,40336,40488,40244
PALADIN|Sagrado|Off hand|40401,39716,39233,40700,42564,37061
PALADIN|Sagrado|Relic|40705,40268,30063,33502
PALADIN|Proteccion|Head|40581,40328,44006,42549,39640,40366
PALADIN|Proteccion|Neck|44665,40387,40069,42646,44660,39246
PALADIN|Proteccion|Shoulder|40584,39704,40334,39267,39642,37814
PALADIN|Proteccion|Back|40722,40252,43988,40410,39225,37197
PALADIN|Proteccion|Chest|40579,40203,44000,39398,40279,44198
PALADIN|Proteccion|Wrist|39764,40306,40734,39467,39195,39729
PALADIN|Proteccion|Hands|40580,37645,40188,39726,44183,39639
PALADIN|Proteccion|Waist|39759,40263,40689,37241,39298,37379
PALADIN|Proteccion|Legs|40589,40446,40583,43500,40240,39258
PALADIN|Proteccion|Feet|40297,40743,39717,39234,44201,37618
PALADIN|Proteccion|Finger|40718,40107,40426,42643,39141,40370
PALADIN|Proteccion|Trinket|37220,40257,44063,42341,39292,44323
PALADIN|Proteccion|Weapon|40345,40402,37401,39344,37260,37179
PALADIN|Proteccion|Off hand|40400,40475,40266,42508,43085,40701
PALADIN|Proteccion|Relic|40707,40337,38363,37574
PALADIN|Reprension|Head|44006,41386,40576,40543,39399,39403
PALADIN|Reprension|Neck|44664,40065,39146,44659,39421,40369
PALADIN|Reprension|Shoulder|40578,40414,39637,39249,39237,40315
PALADIN|Reprension|Back|40403,40721,39404,40250,39297,38614
PALADIN|Reprension|Chest|40574,39767,40277,40539,43998,43990
PALADIN|Reprension|Wrist|40330,40186,40736,40282,39729,39765
PALADIN|Reprension|Hands|40541,40261,39727,40347,40262,40575
PALADIN|Reprension|Waist|40278,40260,40317,39762,39345,39759
PALADIN|Reprension|Legs|44011,40294,37193,43994,40577,37263
PALADIN|Reprension|Feet|39706,39701,40206,40742,40243,40591
PALADIN|Reprension|Finger|40075,40717,40474,40074,39401,43993
PALADIN|Reprension|Trinket|42987,40431,40256,37166,40371,40684
PALADIN|Reprension|Weapon|40384,39758,39417,40497,40406,40343
PALADIN|Reprension|Relic|42852,40191,37574,38362
PRIEST|Disciplina|Head|40562,40447,40287,40339,39295,39514
PRIEST|Disciplina|Neck|44662,40374,40071,44657,39232,40378
PRIEST|Disciplina|Shoulder|40450,40555,39310,39719,40289,37673
PRIEST|Disciplina|Back|40724,44005,40251,40405,39425,40254
PRIEST|Disciplina|Chest|40194,44002,42102,40381,40602,44180
PRIEST|Disciplina|Wrist|44008,40741,39731,40338,40198,37361
PRIEST|Disciplina|Hands|40445,39733,42113,39285,40303,37825
PRIEST|Disciplina|Waist|40271,40561,39721,39735,39190,44302
PRIEST|Disciplina|Legs|40398,40060,40448,39408,39517,39309
PRIEST|Disciplina|Feet|40236,40558,40326,40246,40751,44202
PRIEST|Disciplina|Finger|40108,40720,40399,40375,40719,40433
PRIEST|Disciplina|Trinket|40432,42988,37835,42413,40258,40382
PRIEST|Disciplina|Weapon|40395,40300,39423,40488,40244,39424
PRIEST|Disciplina|Off hand|40350,39766,40192,40699,39311,44210
PRIEST|Disciplina|Ranged|40245,39426,40284,40335,39473,37238
PRIEST|Sagrado|Head|40447,40447,40562,40287,43995,39514
PRIEST|Sagrado|Neck|44662,40374,40071,44657,39392,40486
PRIEST|Sagrado|Shoulder|40555,39719,40450,39310,40289,39518
PRIEST|Sagrado|Back|44005,40405,40723,40251,40253,39425
PRIEST|Sagrado|Chest|44002,42102,40602,40381,40449,40194
PRIEST|Sagrado|Wrist|44008,39731,40741,40198,37361,39390
PRIEST|Sagrado|Hands|40445,39733,42113,39519,40303,39285
PRIEST|Sagrado|Waist|40561,39735,40271,39190,39721,40697
PRIEST|Sagrado|Legs|40398,40060,40448,39408,39517,39309
PRIEST|Sagrado|Feet|40558,40326,40751,40269,40236,39254
PRIEST|Sagrado|Finger|40399,40719,40375,40433,40080,39250
PRIEST|Sagrado|Trinket|44255,37111,40432,42413,40382,40430
PRIEST|Sagrado|Weapon|40395,40488,39423,40244,40300,39424
PRIEST|Sagrado|Off hand|39766,40192,44210,40699,40350,37718
PRIEST|Sagrado|Ranged|39426,40245,40284,40335,39473,37619
PRIEST|Sombras|Head|40562,40456,43995,40287,40339,39521
PRIEST|Sombras|Neck|44661,44658,39472,40064,40427,40374
PRIEST|Sombras|Shoulder|40459,40286,39529,40351,40555,39719
PRIEST|Sombras|Back|44005,40405,39241,40253,40723,42057
PRIEST|Sombras|Chest|44002,40526,40234,40458,39523,39396
PRIEST|Sombras|Wrist|44008,40325,40740,39252,39731,39390
PRIEST|Sombras|Hands|40454,40380,39192,40197,39192,39733
PRIEST|Sombras|Waist|40561,40301,40696,37408,39735,37850
PRIEST|Sombras|Legs|40560,39720,40376,40398,40457,40060
PRIEST|Sombras|Feet|40558,40246,40750,40326,40269,40751
PRIEST|Sombras|Finger|40399,40719,39389,40080,40585,43253
PRIEST|Sombras|Trinket|40255,40432,37873,42395,39229,40682
PRIEST|Sombras|Weapon|40395,40489,40408,39424,39423,40244
PRIEST|Sombras|Off hand|40273,40698,39199,40192,39766,37134
PRIEST|Sombras|Ranged|39712,39426,40284,37177,36989,37238
ROGUE|Asesinato|Head|40499,39399,40329,39561,42550,40296
ROGUE|Asesinato|Neck|44664,40065,39146,40369,39421,44659
ROGUE|Asesinato|Shoulder|40502,39237,40305,40437,39565,37139
ROGUE|Asesinato|Back|40403,39404,40721,40250,39297,38614
ROGUE|Asesinato|Chest|40539,40277,43990,40495,39386,40319
ROGUE|Asesinato|Wrist|40186,39765,40738,44203,37366,39247
ROGUE|Asesinato|Hands|40496,40541,39727,39560,37409,40362
ROGUE|Asesinato|Waist|40205,40260,40694,37194,43484,39279
ROGUE|Asesinato|Legs|40500,44011,39761,39564,40333,39224
ROGUE|Asesinato|Feet|40243,39701,44297,40748,39196,34575
ROGUE|Asesinato|Finger|40474,40717,40074,39277,37642,40586
ROGUE|Asesinato|Trinket|44253,40684,40256,40431,40531,37166
ROGUE|Asesinato|Weapon|39714,37856,40368,39427,37037,44166
ROGUE|Asesinato|Off hand|40386,39714,40281,40368,39420,39140
ROGUE|Asesinato|Ranged|40385,40190,40265,39296,43612,40346
ROGUE|Combate|Head|40499,39399,40329,39561,42550,34244
ROGUE|Combate|Neck|44664,40065,39146,40369,39421,44659
ROGUE|Combate|Shoulder|40502,40305,39237,40437,39565,37139
ROGUE|Combate|Back|40403,39404,40250,40721,39297,38614
ROGUE|Combate|Chest|40539,40277,43990,40495,40319,39386
ROGUE|Combate|Wrist|39765,40186,40738,39247,44203,37366
ROGUE|Combate|Hands|40541,39727,40496,40362,39560,37409
ROGUE|Combate|Waist|40205,45709,45555,45547,45829,46095
ROGUE|Combate|Legs|44011,40500,39761,39564,40333,39224
ROGUE|Combate|Feet|39701,40243,44297,40748,39196,37666
ROGUE|Combate|Finger|40474,40074,40717,43993,39277,40586
ROGUE|Combate|Trinket|44253,40684,40256,40431,37166,34427
ROGUE|Combate|Weapon|40383,39416,40407,42285,39291,40429
ROGUE|Combate|Off hand|39714,37856,42248,40368,40491,39427
ROGUE|Combate|Ranged|40385,40190,40265,39296,43612,40346
SHAMAN|Elemental|Head|40516,44007,44904,40562,40339,39594
SHAMAN|Elemental|Neck|44661,44658,39472,40427,40374,37595
SHAMAN|Elemental|Shoulder|40286,40518,40351,40439,40438,40555
SHAMAN|Elemental|Back|44005,41610,42057,40251,39241,40405
SHAMAN|Elemental|Chest|40514,40526,40234,39396,40283,40588
SHAMAN|Elemental|Wrist|40324,40325,39252,40740,44008,40323
SHAMAN|Elemental|Hands|40302,40380,40515,34344,39593,40564
SHAMAN|Elemental|Waist|40301,40696,37408,40561,40327,37680
SHAMAN|Elemental|Legs|40560,39720,40517,40376,39595,40352
SHAMAN|Elemental|Feet|40519,40246,40750,40237,44896,44202
SHAMAN|Elemental|Finger|40399,40585,39389,43253,40719,37694
SHAMAN|Elemental|Trinket|40255,40432,40682,37873,42395,37660
SHAMAN|Elemental|Weapon|40395,40489,40408,39763,39423,39424
SHAMAN|Elemental|Off hand|40401,40273,40698,37134,39233,39716
SHAMAN|Elemental|Relic|40267,40708,38361
SHAMAN|Mejora|Head|40543,40521,40451,39602,39399,39294
SHAMAN|Mejora|Neck|44661,44658,40065,39472,40427,39146
SHAMAN|Mejora|Shoulder|40524,40315,40286,40299,39237,44003
SHAMAN|Mejora|Back|44005,40403,39404,40251,40721,38614
SHAMAN|Mejora|Chest|40523,39724,40526,43998,39597,40234
SHAMAN|Mejora|Wrist|40736,40186,40282,40325,43131,39278
SHAMAN|Mejora|Hands|40520,40541,40262,39727,37409,39194
SHAMAN|Mejora|Waist|40275,40260,40301,39762,37407,40205
SHAMAN|Mejora|Legs|40522,40560,44011,39720,40331,39603
SHAMAN|Mejora|Feet|40367,39701,40246,44297,40746,40549
SHAMAN|Mejora|Finger|40074,40399,39389,40474,43251,40717
SHAMAN|Mejora|Trinket|40255,40684,37873,37166,39257,37390
SHAMAN|Mejora|Weapon|39763,40395,39423,45085,40408,39424
SHAMAN|Mejora|Off hand|39468,40386,40189,37871,42208,40281
SHAMAN|Mejora|Relic|42607,40322,40708,33507
SHAMAN|Restauracion|Head|40510,44007,39583,40339,40340,40304
SHAMAN|Restauracion|Neck|44662,40374,40071,44657,40378,39232
SHAMAN|Restauracion|Shoulder|40513,40439,40438,40289,40555,40288
SHAMAN|Restauracion|Back|44005,40251,39425,40254,40724,41610
SHAMAN|Restauracion|Chest|40508,40588,40283,40061,40249,39588
SHAMAN|Restauracion|Wrist|34438,40324,40209,40741,44008,40338
SHAMAN|Restauracion|Hands|40564,40302,39718,40303,44004,40509
SHAMAN|Restauracion|Waist|40327,40561,40272,39721,40693,40341
SHAMAN|Restauracion|Legs|40512,40352,40196,40398,39217,39589
SHAMAN|Restauracion|Feet|34565,40519,40237,39734,43996,40236
SHAMAN|Restauracion|Finger|40399,40375,40108,40433,39244,40585
SHAMAN|Restauracion|Trinket|40432,37111,37657,40258,40382,42988
SHAMAN|Restauracion|Weapon|40395,39763,39423,40488,40244,40300
SHAMAN|Restauracion|Off hand|40401,39716,39233,40700,40350,39311
SHAMAN|Restauracion|Relic|40709,38368,28523
WARLOCK|Afliccion|Head|40421,40562,40287,43995,40339,39496
WARLOCK|Afliccion|Neck|44661,44658,39472,40064,40374,40427
WARLOCK|Afliccion|Shoulder|40424,40286,40351,39499,39719,40555
WARLOCK|Afliccion|Back|44005,40405,41610,40723,39241,40251
WARLOCK|Afliccion|Chest|40423,40234,40526,44002,39396,42102
WARLOCK|Afliccion|Wrist|44008,40740,40325,39252,40198,39390
WARLOCK|Afliccion|Hands|40420,40380,40197,39733,42113,39192
WARLOCK|Afliccion|Waist|40561,40301,40696,37408,39735,39190
WARLOCK|Afliccion|Legs|40560,40376,39720,40398,40422,40060
WARLOCK|Afliccion|Feet|40558,40246,40750,40326,40751,40269
WARLOCK|Afliccion|Finger|40399,40719,39389,43253,40080,39250
WARLOCK|Afliccion|Trinket|40255,40432,39229,37873,42395,40682
WARLOCK|Afliccion|Weapon|40396,40489,40408,39424,40336,42346
WARLOCK|Afliccion|Off hand|39766,40273,40698,39199,40192,44210
WARLOCK|Afliccion|Ranged|39426,39712,37177,40284,34348,40245
WARLOCK|Demonologia|Head|40421,40562,40287,43995,44910,39496
WARLOCK|Demonologia|Neck|44661,44658,39472,40064,40680,40427
WARLOCK|Demonologia|Shoulder|40424,40286,40351,39499,39719,40555
WARLOCK|Demonologia|Back|44005,39241,40405,40723,41610,40253
WARLOCK|Demonologia|Chest|40423,40526,40234,39396,39497,44002
WARLOCK|Demonologia|Wrist|44008,40740,39252,40325,39731,40198
WARLOCK|Demonologia|Hands|40420,40197,40380,39192,39733,34344
WARLOCK|Demonologia|Waist|40561,40301,37408,40696,37850,39735
WARLOCK|Demonologia|Legs|40560,40376,39720,40398,40422,40060
WARLOCK|Demonologia|Feet|40558,40246,40750,40326,40751,40269
WARLOCK|Demonologia|Finger|40399,40719,39389,43253,40080,39250
WARLOCK|Demonologia|Trinket|40255,40432,37873,42395,39229,40682
WARLOCK|Demonologia|Weapon|40396,40489,40408,39424,40336,42346
WARLOCK|Demonologia|Off hand|40273,40698,39199,39766,37134,40192
WARLOCK|Demonologia|Ranged|39426,39712,37177,40284,34348,38206
WARLOCK|Destruccion|Head|40421,40562,44910,40287,43995,40339
WARLOCK|Destruccion|Neck|44661,44658,39472,40064,40680,40427
WARLOCK|Destruccion|Shoulder|40424,40286,39499,39719,40555,34210
WARLOCK|Destruccion|Back|44005,39241,40405,42057,40723,40253
WARLOCK|Destruccion|Chest|40423,40526,40234,39497,43401,44002
WARLOCK|Destruccion|Wrist|44008,40740,39252,40325,40198,39731
WARLOCK|Destruccion|Hands|40420,40380,40197,39192,34344,39733
WARLOCK|Destruccion|Waist|40561,40301,37408,40696,37850,39735
WARLOCK|Destruccion|Legs|40560,40376,39720,40398,40422,40060
WARLOCK|Destruccion|Feet|40558,40750,40246,40326,44899,40269
WARLOCK|Destruccion|Finger|40399,40719,39389,43253,40080,39250
WARLOCK|Destruccion|Trinket|40255,40432,37873,42395,40682,39229
WARLOCK|Destruccion|Weapon|40396,40489,40408,39424,40336,42346
WARLOCK|Destruccion|Off hand|40273,40698,39199,37134,39766,40192
WARLOCK|Destruccion|Ranged|39712,37177,39426,40284,34348,38206
WARRIOR|Armas|Head|40528,41386,40543,40344,44006,39399
WARRIOR|Armas|Neck|44664,40065,44659,39421,40369,42645
WARRIOR|Armas|Shoulder|40530,40414,40185,39249,40315,39608
WARRIOR|Armas|Back|40403,40250,39404,40721,39297,38614
WARRIOR|Armas|Chest|40539,39767,40525,40277,39606,43998
WARRIOR|Armas|Wrist|40330,40282,39765,39278,40186,40738
WARRIOR|Armas|Hands|40541,40261,40262,39727,37409,39194
WARRIOR|Armas|Waist|40260,40278,39762,40692,39345,40205
WARRIOR|Armas|Legs|40318,44011,40294,43994,37263,37193
WARRIOR|Armas|Feet|40591,40206,39701,40549,40746,40742
WARRIOR|Armas|Finger|40474,43993,40074,40717,43251,40586
WARRIOR|Armas|Trinket|40256,42987,37166,39257,40684,40431
WARRIOR|Armas|Weapon|40384,40497,40208,39417,39221,42317
WARRIOR|Armas|Ranged|40385,40190,40265,43612,39296,40346
WARRIOR|Furia|Head|44006,41386,40528,40543,40344,39605
WARRIOR|Furia|Neck|44664,40065,44659,39421,40369,39146
WARRIOR|Furia|Shoulder|40530,40414,40185,39249,39608,44003
WARRIOR|Furia|Back|40403,40250,40721,39404,39297,38614
WARRIOR|Furia|Chest|40539,40525,39767,40277,39606,43998
WARRIOR|Furia|Wrist|39765,40330,40282,40733,40186,39729
WARRIOR|Furia|Hands|40541,40261,40262,39727,40527,40362
WARRIOR|Furia|Waist|40205,40278,40260,40317,39762,39345
WARRIOR|Furia|Legs|40529,44011,40318,40294,43994,39761
WARRIOR|Furia|Feet|40591,40206,39701,40549,39706,40742
WARRIOR|Furia|Finger|40474,43993,40074,40717,40075,39401
WARRIOR|Furia|Trinket|40256,42987,40531,40684,39257,37166
WARRIOR|Furia|Weapon|40384,40497,39417,39758,40208,40406
WARRIOR|Furia|Off hand|40384,40497,39417,39758,40208,40406
WARRIOR|Furia|Ranged|40385,40190,40265,40346,39296,39419
WARRIOR|Proteccion|Head|40546,44006,39610,40328,42549,39395
WARRIOR|Proteccion|Neck|40387,44665,40069,39470,44660,40679
WARRIOR|Proteccion|Shoulder|39704,40548,39267,40334,44312,39613
WARRIOR|Proteccion|Back|40722,40410,40252,43988,37197,39225
WARRIOR|Proteccion|Chest|44000,39767,40203,39398,40279,40544
WARRIOR|Proteccion|Wrist|39764,40734,40306,39467,37620,37682
WARRIOR|Proteccion|Hands|40545,40188,39726,39197,39622,37645
WARRIOR|Proteccion|Waist|39759,39298,34547,40263,40689,37379
WARRIOR|Proteccion|Legs|40589,40446,40547,39258,40240,39612
WARRIOR|Proteccion|Feet|40297,39717,40743,39234,37082,44243
WARRIOR|Proteccion|Finger|40718,40370,40075,40107,40426,39141
WARRIOR|Proteccion|Trinket|37220,40257,44063,42341,39292,36993
WARRIOR|Proteccion|Weapon|40402,40264,40491,39730,39270,39344
WARRIOR|Proteccion|Off hand|40400,40475,40266,39276,40701,43085
WARRIOR|Proteccion|Ranged|41168,40265,40385,40190,39419,43612
]])

--========================================================
-- TIER 8 - 30 ESPECIALIZACIONES
-- Fuente de listas: Bistooltip_wowtbc_bislists_old.lua
--========================================================

MB_LoadRankedTierData("T8", [[
DEATHKNIGHT|Sangre|Head|46120,45502,45935,45336,45472,40565
DEATHKNIGHT|Sangre|Neck|45485,45821,45538,45696,46343,40387
DEATHKNIGHT|Sangre|Shoulder|46122,45251,45339,45245,39704,40568
DEATHKNIGHT|Sangre|Back|45496,45319,45588,46014,40722,40252
DEATHKNIGHT|Sangre|Chest|46039,46118,45335,45334,40559,44000
DEATHKNIGHT|Sangre|Wrist|45111,45283,40306,40734,45663,39467
DEATHKNIGHT|Sangre|Hands|45487,46119,45834,45337,45310,40563
DEATHKNIGHT|Sangre|Waist|45825,45551,45304,45241,46041,39759
DEATHKNIGHT|Sangre|Legs|45594,45295,46121,45338,40589,45708
DEATHKNIGHT|Sangre|Feet|45988,45166,45560,45542,40297,40743
DEATHKNIGHT|Sangre|Finger|45471,45871,45326,45112,45874,45534
DEATHKNIGHT|Sangre|Trinket|45158,46021,44063,42341,37220,40257
DEATHKNIGHT|Sangre|Weapon|45533,46067,45442,45876,45110,45516
DEATHKNIGHT|Sangre|Off hand|45442,45876,45110,45892,40402,40345
DEATHKNIGHT|Sangre|Relic|45144,40714,40822
DEATHKNIGHT|Escarcha|Head|45472,45610,46115,45107,45993,45299
DEATHKNIGHT|Escarcha|Neck|45459,45517,46040,45945,45285,45193
DEATHKNIGHT|Escarcha|Shoulder|46037,45245,45320,46117,45344,45300
DEATHKNIGHT|Escarcha|Back|46032,45461,45588,45138,46320,45973
DEATHKNIGHT|Escarcha|Chest|46111,45473,45712,45524,45225,45676
DEATHKNIGHT|Escarcha|Wrist|45663,45888,45264,45869,45611,40330
DEATHKNIGHT|Escarcha|Hands|46113,45444,46043,45481,45833,45997
DEATHKNIGHT|Escarcha|Waist|45241,45161,46095,46041,45555,45824
DEATHKNIGHT|Escarcha|Legs|45134,45536,45982,45248,45841,46116
DEATHKNIGHT|Escarcha|Feet|45599,40591,45501,45989,45244,45559
DEATHKNIGHT|Escarcha|Finger|45534,45608,46048,46322,45456,45106
DEATHKNIGHT|Escarcha|Trinket|45931,42987,45609,46038,40256,45522
DEATHKNIGHT|Escarcha|Weapon|46097,45947,45463,45266,45298,46031
DEATHKNIGHT|Escarcha|Off hand|46097,45947,45463,45266,45298,46031
DEATHKNIGHT|Escarcha|Relic|40207,45254,40715,40822
DEATHKNIGHT|Profano|Head|45472,45107,45610,45993,41386,44006
DEATHKNIGHT|Profano|Neck|46040,45459,45193,45819,45517,46022
DEATHKNIGHT|Profano|Shoulder|46117,45320,45245,45344,46037,40414
DEATHKNIGHT|Profano|Back|45588,45461,46320,45318,46032,45138
DEATHKNIGHT|Profano|Chest|46111,45473,45225,45340,40550,45676
DEATHKNIGHT|Profano|Wrist|45663,45611,45264,45888,40330,39729
DEATHKNIGHT|Profano|Hands|45481,46113,46043,45341,45444,40261
DEATHKNIGHT|Profano|Waist|45241,46041,45824,40278,46095,45550
DEATHKNIGHT|Profano|Legs|45134,45982,45841,46116,45343,45248
DEATHKNIGHT|Profano|Feet|45599,45501,45559,45330,45989,39706
DEATHKNIGHT|Profano|Finger|45534,45250,45540,46010,45469,46048
DEATHKNIGHT|Profano|Trinket|45609,42987,45522,45286,40531,45263
DEATHKNIGHT|Profano|Weapon|46097,45947,46036,45442,45876,45463
DEATHKNIGHT|Profano|Off hand|46097,46036,45947,45876,45442,45142
DEATHKNIGHT|Profano|Relic|45254,42620,40867,40822,40715,40207
DRUID|Equilibrio|Head|45497,45150,46191,45464,46313,40467
DRUID|Equilibrio|Neck|45133,45699,45539,44661,44658,45933
DRUID|Equilibrio|Shoulder|46196,45186,46068,45136,40470,40286
DRUID|Equilibrio|Back|45242,46042,45618,44005,45486,46321
DRUID|Equilibrio|Chest|45519,45865,40526,40234,45272,46194
DRUID|Equilibrio|Wrist|45446,45275,45549,45291,40325,40740
DRUID|Equilibrio|Hands|45665,46045,46189,45976,45351,45520
DRUID|Equilibrio|Waist|45619,45557,45508,45616,40301,45455
DRUID|Equilibrio|Legs|46192,45488,45238,40560,45353,46049
DRUID|Equilibrio|Feet|45537,45258,45135,46050,40246,45566
DRUID|Equilibrio|Finger|45495,46046,45451,45297,45515,39389
DRUID|Equilibrio|Trinket|45518,45466,45148,45866,40255,37873
DRUID|Equilibrio|Weapon|45620,45612,46035,45171,45527,45457
DRUID|Equilibrio|Off hand|45617,45115,40273,40698,45271,45314
DRUID|Equilibrio|Relic|40321,40712,32387,45270,38360
DRUID|Feral Tanque|Head|45993,45523,46161,45356,45893,40329
DRUID|Feral Tanque|Neck|45517,45485,45459,45945,45696,40387
DRUID|Feral Tanque|Shoulder|45245,46157,45265,45359,45677,40494
DRUID|Feral Tanque|Back|45461,45496,45588,46032,46320,45224
DRUID|Feral Tanque|Chest|45473,46159,45358,45940,45453,40471
DRUID|Feral Tanque|Wrist|45611,45869,45108,39765,40186,40738
DRUID|Feral Tanque|Hands|46043,45325,46158,45355,45838,45312
DRUID|Feral Tanque|Waist|46095,45555,45829,45491,45547,45709
DRUID|Feral Tanque|Legs|45536,45846,46160,45357,44011,45141
DRUID|Feral Tanque|Feet|45232,45564,45162,40243,45302,43592
DRUID|Feral Tanque|Finger|45471,45112,45608,45534,45871,45874
DRUID|Feral Tanque|Trinket|45158,46021,44253,44063,37220,42341
DRUID|Feral Tanque|Weapon|45533,45613,46033,46067,45256,45498
DRUID|Feral Tanque|Relic|45509,38365,33509
DRUID|Feral DPS|Head|46161,45993,45523,45893,45356,40473
DRUID|Feral DPS|Neck|45517,45459,45945,45820,45480,44664
DRUID|Feral DPS|Shoulder|45245,45677,46157,45359,45265,40437
DRUID|Feral DPS|Back|46032,45461,45588,45224,45704,45138
DRUID|Feral DPS|Chest|45473,45453,40539,46159,45940,45358
DRUID|Feral DPS|Wrist|45869,45611,40186,45108,39765,40738
DRUID|Feral DPS|Hands|46158,46043,45325,40541,45838,45355
DRUID|Feral DPS|Waist|46095,45547,45829,45555,45709,45491
DRUID|Feral DPS|Legs|45536,45846,45141,44011,46160,45324
DRUID|Feral DPS|Feet|45564,45232,45162,39701,45302,40243
DRUID|Feral DPS|Finger|46048,45608,45157,45534,46322,45456
DRUID|Feral DPS|Trinket|45931,45609,45522,46038,45286,42987
DRUID|Feral DPS|Weapon|45613,45533,46033,46067,45498,45256
DRUID|Feral DPS|Relic|40713,39757,38365
DRUID|Restauracion|Head|46184,45439,45864,44007,45497,45346
DRUID|Restauracion|Neck|45243,45443,45447,45822,45116,45933
DRUID|Restauracion|Shoulder|46187,46068,45492,45253,45136,46187
DRUID|Restauracion|Back|45618,46321,45541,40723,45486,45317
DRUID|Restauracion|Chest|45519,46194,45240,45354,45272,44002
DRUID|Restauracion|Wrist|45446,45149,44008,40323,39731,45146
DRUID|Restauracion|Hands|46183,45665,45273,45840,45512,45462
DRUID|Restauracion|Waist|45616,45455,45556,45830,45119,45619
DRUID|Restauracion|Legs|46185,46049,45482,45468,46034,40379
DRUID|Restauracion|Feet|45135,45483,45566,45537,45378,46050
DRUID|Restauracion|Finger|45495,45614,45946,46323,45418,45235
DRUID|Restauracion|Trinket|45703,45535,40432,45929,44322,37111
DRUID|Restauracion|Weapon|46017,45886,45620,45612,45479,46035
DRUID|Restauracion|Off hand|45271,39766,40699,45314,40192,37718
DRUID|Restauracion|Relic|40342,33508,25643,38366,46138
HUNTER|Bestias|Head|45610,45329,46143,45164,45361,45993
HUNTER|Bestias|Neck|45517,45945,45480,45820,40065,44664
HUNTER|Bestias|Shoulder|45300,45227,46145,45245,45363,45677
HUNTER|Bestias|Back|46032,45461,45224,45704,45873,40403
HUNTER|Bestias|Chest|45473,45524,46141,45364,45941,45940
HUNTER|Bestias|Wrist|45869,45454,45301,40282,40736,45611
HUNTER|Bestias|Hands|45444,46043,46142,45325,45360,45109
HUNTER|Bestias|Waist|45467,45827,45547,45553,45709,45895
HUNTER|Bestias|Legs|45536,45844,45504,45143,46144,45846
HUNTER|Bestias|Feet|45244,45989,45562,45249,40549,46346
HUNTER|Bestias|Finger|45608,46322,46048,45157,45456,40474
HUNTER|Bestias|Trinket|45931,45609,40256,46038,45522,45263
HUNTER|Bestias|Weapon|45613,45533,46033,45132,46036,45449
HUNTER|Bestias|Off hand|46036,45448,45947,45484,45930,45494
HUNTER|Bestias|Ranged|45570,45870,46018,45261,45327,45872
HUNTER|Punteria|Head|45610,45329,46143,45993,45361,45164
HUNTER|Punteria|Neck|45517,45945,45480,40065,44664,46008
HUNTER|Punteria|Shoulder|45300,45245,45227,45677,46145,45363
HUNTER|Punteria|Back|46032,45461,45704,45224,45873,40403
HUNTER|Punteria|Chest|45473,46141,45524,45364,45940,45941
HUNTER|Punteria|Wrist|45869,45454,45301,40282,40736,45108
HUNTER|Punteria|Hands|45444,46043,45325,40541,46142,45360
HUNTER|Punteria|Waist|45467,45547,45555,45827,45709,40260
HUNTER|Punteria|Legs|45536,45844,45504,45846,44011,45143
HUNTER|Punteria|Feet|45244,45989,45562,39701,45249,40746
HUNTER|Punteria|Finger|45608,46322,46048,45157,45456,40474
HUNTER|Punteria|Trinket|45931,46038,40256,45522,45263,44253
HUNTER|Punteria|Weapon|45613,45533,46033,46036,45449,45498
HUNTER|Punteria|Off hand|46036,45448,45947,45484,40386,45494
HUNTER|Punteria|Ranged|45570,45870,45327,45261,45137,40385
HUNTER|Supervivencia|Head|45610,45329,46143,45993,45361,45164
HUNTER|Supervivencia|Neck|45517,45945,45480,40065,45820,44664
HUNTER|Supervivencia|Shoulder|45300,45245,45677,45227,46145,45363
HUNTER|Supervivencia|Back|46032,45461,45224,45704,45873,39404
HUNTER|Supervivencia|Chest|45473,46141,45524,45364,45940,45941
HUNTER|Supervivencia|Wrist|45869,45454,45301,40282,40736,43131
HUNTER|Supervivencia|Hands|45444,46043,45325,40541,46142,45360
HUNTER|Supervivencia|Waist|46095,45547,45555,45827,40260,45467
HUNTER|Supervivencia|Legs|45536,45844,45504,44011,46019,45143
HUNTER|Supervivencia|Feet|45244,45989,39701,40746,45562,45249
HUNTER|Supervivencia|Finger|45608,46322,46048,45157,40474,45456
HUNTER|Supervivencia|Trinket|44253,46038,40256,45522,45286,45931
HUNTER|Supervivencia|Weapon|45613,46036,45533,45449,46033,45484
HUNTER|Supervivencia|Off hand|46036,45448,45947,40386,46024,45484
HUNTER|Supervivencia|Ranged|45570,45870,45327,45261,45137,40385
MAGE|Arcano|Head|45497,45150,46129,45365,45464,45289
MAGE|Arcano|Neck|45243,45133,45699,44661,45539,44658
MAGE|Arcano|Shoulder|46134,45186,46068,40286,45369,45253
MAGE|Arcano|Back|45618,45242,46042,46321,44005,45486
MAGE|Arcano|Chest|46130,45865,40526,40234,45272,45240
MAGE|Arcano|Wrist|45446,45275,45549,45291,40325,44008
MAGE|Arcano|Hands|45665,46045,46132,46131,45976,45520
MAGE|Arcano|Waist|45619,45557,45508,40301,45119,40561
MAGE|Arcano|Legs|45488,45238,40560,46133,45367,40417
MAGE|Arcano|Feet|45135,45258,45537,40246,45566,45483
MAGE|Arcano|Finger|45495,46046,45451,45297,45515,39389
MAGE|Arcano|Trinket|45466,45518,45148,45866,40255,45490
MAGE|Arcano|Weapon|45620,45990,45171,45527,45437,45886
MAGE|Arcano|Off hand|45617,45115,40273,45271,40698,39199
MAGE|Arcano|Ranged|45294,45257,39712,45511,45170,37177
MAGE|Fuego|Head|46129,45150,45365,45497,45464,45532
MAGE|Fuego|Neck|45133,45699,44661,45539,45933,45243
MAGE|Fuego|Shoulder|46134,46068,45186,40286,45253,45369
MAGE|Fuego|Back|45242,46042,45618,46321,44005,45493
MAGE|Fuego|Chest|46130,45865,40526,45272,40234,45240
MAGE|Fuego|Wrist|45446,45275,45549,45291,40325,45146
MAGE|Fuego|Hands|45665,46045,46132,46131,45520,45976
MAGE|Fuego|Waist|45619,45557,45508,40301,45119,45558
MAGE|Fuego|Legs|46133,45488,45238,40560,45367,46034
MAGE|Fuego|Feet|45537,45258,45135,46050,45566,40246
MAGE|Fuego|Finger|45495,46046,45451,45297,45515,39389
MAGE|Fuego|Trinket|45518,45466,45148,45866,40255,45308
MAGE|Fuego|Weapon|45620,45990,45527,45437,45171,45457
MAGE|Fuego|Off hand|45617,45115,40273,40698,45271,45314
MAGE|Fuego|Ranged|45294,45257,45511,39712,45170,37177
MAGE|Escarcha|Head|45497,45150,46129,45365,45464,45289
MAGE|Escarcha|Neck|45133,45699,44661,45539,44658,45933
MAGE|Escarcha|Shoulder|46134,45186,46068,40286,45369,40351
MAGE|Escarcha|Back|45618,45242,46042,46321,44005,45486
MAGE|Escarcha|Chest|46130,45865,40526,40234,45272,45240
MAGE|Escarcha|Wrist|45446,45275,45549,45291,40325,44008
MAGE|Escarcha|Hands|45665,46045,46132,46131,45976,45520
MAGE|Escarcha|Waist|45619,45557,45508,40301,40696,40561
MAGE|Escarcha|Legs|45488,45238,40560,46133,45367,40417
MAGE|Escarcha|Feet|45537,45258,45135,40246,45566,46050
MAGE|Escarcha|Finger|45495,46046,45451,45297,45515,39389
MAGE|Escarcha|Trinket|45466,45518,45148,45866,40255,37873
MAGE|Escarcha|Weapon|45620,45990,45527,45171,45437,40396
MAGE|Escarcha|Off hand|45617,45115,40273,40698,45271,39766
MAGE|Escarcha|Ranged|45294,45257,39712,45511,37177,45170
PALADIN|Sagrado|Head|46180,45226,45372,45687,45497,45439
PALADIN|Sagrado|Neck|45443,45933,45243,45116,45447,46047
PALADIN|Sagrado|Shoulder|46182,45474,46044,46068,45140,45373
PALADIN|Sagrado|Back|45486,45618,44005,45541,46321,45317
PALADIN|Sagrado|Chest|45445,45519,45867,45272,45531,45259
PALADIN|Sagrado|Wrist|45460,45446,45269,46345,45187,40324
PALADIN|Sagrado|Hands|46179,45665,45928,45943,45239,45520
PALADIN|Sagrado|Waist|45151,45616,45552,45505,45619,45828
PALADIN|Sagrado|Legs|46181,46049,45845,45544,45843,45371
PALADIN|Sagrado|Feet|45537,45135,45615,45561,46050,45513
PALADIN|Sagrado|Finger|45614,46046,45495,45946,46323,45168
PALADIN|Sagrado|Trinket|46051,37111,45535,44255,45929,45490
PALADIN|Sagrado|Weapon|46017,45612,46035,45147,45437,40396
PALADIN|Sagrado|Off hand|45470,45887,45682,40401,39716,39233
PALADIN|Sagrado|Relic|40705,45436,40268,30063,33502
PALADIN|Proteccion|Head|46175,45935,45502,40581,45382,40328
PALADIN|Proteccion|Neck|45485,45538,40387,44665,45696,45262
PALADIN|Proteccion|Shoulder|46177,45251,45385,39704,45697,40584
PALADIN|Proteccion|Back|45496,45319,46014,45322,45588,40722
PALADIN|Proteccion|Chest|46039,46173,45334,45381,45225,40203
PALADIN|Proteccion|Wrist|45111,45283,45663,40306,39764,40734
PALADIN|Proteccion|Hands|45487,46174,45834,45228,45383,46340
PALADIN|Proteccion|Waist|45825,46041,45139,45551,45304,45241
PALADIN|Proteccion|Legs|45594,45295,40589,46176,45842,45384
PALADIN|Proteccion|Feet|45988,45542,45166,45560,40297,45599
PALADIN|Proteccion|Finger|45471,45871,45112,45874,45247,45326
PALADIN|Proteccion|Trinket|45158,46021,44063,37220,42341,40257
PALADIN|Proteccion|Weapon|46097,45947,45463,45442,45876,40345
PALADIN|Proteccion|Off hand|45587,45450,45877,45707,40400,40475
PALADIN|Proteccion|Relic|45145,40707,40337,38363,37574
PALADIN|Reprension|Head|45472,45610,45107,45993,45329,45523
PALADIN|Reprension|Neck|45459,45945,45517,45819,46040,45480
PALADIN|Reprension|Shoulder|45245,45320,45677,40414,45227,46037
PALADIN|Reprension|Back|46032,45461,45588,46320,45224,45704
PALADIN|Reprension|Chest|45473,46154,45375,45524,39767,45712
PALADIN|Reprension|Wrist|45663,45611,45869,45264,40330,45454
PALADIN|Reprension|Hands|45444,46043,45325,40541,40261,46155
PALADIN|Reprension|Waist|46095,45241,45829,46041,45555,45547
PALADIN|Reprension|Legs|45134,45982,45846,46153,45536,44011
PALADIN|Reprension|Feet|45599,45989,45564,45244,45501,45330
PALADIN|Reprension|Finger|45534,45608,46048,45540,45250,46010
PALADIN|Reprension|Trinket|42987,45609,45522,45286,46038,45263
PALADIN|Reprension|Weapon|45516,45533,46067,45868,45521,45165
PALADIN|Reprension|Relic|42853,42852,45510,40191,37574,38362
PRIEST|Disciplina|Head|46197,45497,45289,45532,45386,40447
PRIEST|Disciplina|Neck|45443,45243,45933,45133,45447,45116
PRIEST|Disciplina|Shoulder|46190,46068,45390,45253,46013,45514
PRIEST|Disciplina|Back|45486,45618,46321,45541,44005,45317
PRIEST|Disciplina|Chest|46193,45272,45240,44002,45389,46012
PRIEST|Disciplina|Wrist|45446,44008,40741,45146,39731,45423
PRIEST|Disciplina|Hands|45520,45665,46188,45273,45840,45387
PRIEST|Disciplina|Waist|45619,45119,40561,45558,45831,45694
PRIEST|Disciplina|Legs|46195,45388,46034,45468,45848,40398
PRIEST|Disciplina|Feet|46050,45135,45537,45566,45483,45441
PRIEST|Disciplina|Finger|45614,46096,45495,45946,46046,46323
PRIEST|Disciplina|Trinket|40432,45535,45308,45929,46051,45703
PRIEST|Disciplina|Weapon|45612,46017,45457,45886,46035,45147
PRIEST|Disciplina|Off hand|45314,45271,39766,40350,40192,40699
PRIEST|Disciplina|Ranged|45170,45511,40245,45713,39426,40284
PRIEST|Sagrado|Head|45497,45289,46197,45532,40447,40562
PRIEST|Sagrado|Neck|45243,45443,45447,45933,45822,45116
PRIEST|Sagrado|Shoulder|46190,46068,45253,45390,46013,45514
PRIEST|Sagrado|Back|45618,46321,45486,45541,44005,45529
PRIEST|Sagrado|Chest|45240,45272,46193,44002,45389,46012
PRIEST|Sagrado|Wrist|45446,44008,45146,39731,40741,45423
PRIEST|Sagrado|Hands|45665,45520,46188,45273,45840,45387
PRIEST|Sagrado|Waist|45619,45119,40561,45558,45831,45694
PRIEST|Sagrado|Legs|46195,46034,45388,45468,40398,40060
PRIEST|Sagrado|Feet|45135,45537,45566,46050,45483,45441
PRIEST|Sagrado|Finger|45495,45614,45946,46323,46046,46096
PRIEST|Sagrado|Trinket|45535,46051,40432,45703,45929,44255
PRIEST|Sagrado|Weapon|46017,45886,45457,45612,46035,45147
PRIEST|Sagrado|Off hand|45271,39766,45314,40192,44210,40699
PRIEST|Sagrado|Ranged|45511,45170,39426,45713,40245,40284
PRIEST|Sombras|Head|46172,45150,45464,45497,45391,45532
PRIEST|Sombras|Neck|45133,45699,45539,44661,45933,45243
PRIEST|Sombras|Shoulder|46165,45186,46068,40459,40286,39529
PRIEST|Sombras|Back|45618,45242,46042,46321,44005,45493
PRIEST|Sombras|Chest|46168,45395,45865,40526,45272,45240
PRIEST|Sombras|Wrist|45446,45275,45549,45291,40325,44008
PRIEST|Sombras|Hands|45665,46045,45976,45520,46163,45273
PRIEST|Sombras|Waist|45619,45557,45508,40301,45119,40561
PRIEST|Sombras|Legs|46170,45488,45238,40560,46034,45848
PRIEST|Sombras|Feet|45135,45258,45537,46050,45566,45483
PRIEST|Sombras|Finger|45495,46046,45451,45297,45515,46096
PRIEST|Sombras|Trinket|45518,45466,45148,40255,45866,45308
PRIEST|Sombras|Weapon|45620,45612,46035,45171,45527,45457
PRIEST|Sombras|Off hand|45617,45115,40273,40698,45271,45314
PRIEST|Sombras|Ranged|45294,45257,39712,45511,45170,45713
ROGUE|Asesinato|Head|46125,45523,45993,45893,45398,40499
ROGUE|Asesinato|Neck|45517,45945,45480,40065,39146,44664
ROGUE|Asesinato|Shoulder|45245,46127,45400,45677,45265,39237
ROGUE|Asesinato|Back|45461,45224,45704,46032,45873,40403
ROGUE|Asesinato|Chest|45473,46123,45940,45396,40539,45453
ROGUE|Asesinato|Wrist|45611,45869,40186,45108,39765,40738
ROGUE|Asesinato|Hands|46124,46043,45325,40541,45397,39727
ROGUE|Asesinato|Waist|46095,45829,45547,45709,45555,40260
ROGUE|Asesinato|Legs|45536,45846,44011,45141,46126,40500
ROGUE|Asesinato|Feet|45564,39701,45232,44297,45162,45302
ROGUE|Asesinato|Finger|46048,45608,45157,45534,45525,45540
ROGUE|Asesinato|Trinket|45609,46038,45286,45522,45263,45931
ROGUE|Asesinato|Weapon|45484,45930,46024,45246,39714,37856
ROGUE|Asesinato|Off hand|45484,45930,45607,45448,45246,45605
ROGUE|Asesinato|Ranged|45570,45870,45296,45086,40190,46018
ROGUE|Combate|Head|45993,45523,45893,46125,45398,40499
ROGUE|Combate|Neck|45517,45945,45480,45459,45820,40065
ROGUE|Combate|Shoulder|45245,46127,45677,45400,45265,40502
ROGUE|Combate|Back|45461,45224,46032,45704,45873,40403
ROGUE|Combate|Chest|45473,46123,45396,45940,45453,40539
ROGUE|Combate|Wrist|45869,45611,40186,45108,39765,40738
ROGUE|Combate|Hands|46043,46124,45325,40541,45397,39727
ROGUE|Combate|Waist|46095,45829,45547,45555,45709,40260
ROGUE|Combate|Legs|45536,45846,44011,45141,46126,45399
ROGUE|Combate|Feet|45564,45232,39701,45162,45302,40243
ROGUE|Combate|Finger|46048,45608,45157,45456,45525,46322
ROGUE|Combate|Trinket|45609,46038,45522,45286,45931,40256
ROGUE|Combate|Weapon|45132,45449,45947,45266,45489,46097
ROGUE|Combate|Off hand|45484,45930,46036,45331,45494,45142
ROGUE|Combate|Ranged|45296,45570,45870,45086,40190,45327
SHAMAN|Elemental|Head|46209,45150,45408,45464,45497,45687
SHAMAN|Elemental|Neck|45933,45133,45699,44661,45539,44658
SHAMAN|Elemental|Shoulder|46211,46044,45186,46068,45474,45136
SHAMAN|Elemental|Back|45242,46042,45618,45486,44005,41610
SHAMAN|Elemental|Chest|46206,45865,45411,40526,40234,45867
SHAMAN|Elemental|Wrist|45460,45275,45549,40325,45291,45446
SHAMAN|Elemental|Hands|45665,46045,45976,45943,45239,46207
SHAMAN|Elemental|Waist|45616,45557,45508,40301,45151,45619
SHAMAN|Elemental|Legs|46210,45488,45238,40560,45409,39720
SHAMAN|Elemental|Feet|45537,45258,45135,40246,45615,46050
SHAMAN|Elemental|Finger|46046,45495,45451,45297,39389,45515
SHAMAN|Elemental|Trinket|40255,45518,45148,45866,40682,45490
SHAMAN|Elemental|Weapon|45612,45620,46035,45171,45527,45457
SHAMAN|Elemental|Off hand|45470,45617,45115,40273,45887,45682
SHAMAN|Elemental|Relic|40267,40708,45255,38361
SHAMAN|Mejora|Head|45610,45329,46212,45993,45164,45412
SHAMAN|Mejora|Neck|45517,45133,45480,45945,45699,44661
SHAMAN|Mejora|Shoulder|46203,45245,45227,45543,45677,45300
SHAMAN|Mejora|Back|45461,45242,45224,46042,45704,46032
SHAMAN|Mejora|Chest|46205,45413,45473,45524,45941,39724
SHAMAN|Mejora|Wrist|45460,45611,45869,45454,45301,45275
SHAMAN|Mejora|Hands|46200,45444,46043,45665,46045,45325
SHAMAN|Mejora|Waist|45553,45827,46095,45709,45547,45467
SHAMAN|Mejora|Legs|46208,45488,45844,45504,45416,45846
SHAMAN|Mejora|Feet|45989,45244,45564,45258,45537,39701
SHAMAN|Mejora|Finger|45456,45608,46048,45451,45157,45534
SHAMAN|Mejora|Trinket|45609,46038,45522,45148,45518,45263
SHAMAN|Mejora|Weapon|45132,45449,46097,45463,45489,39763
SHAMAN|Mejora|Off hand|46097,45463,46031,39468,40386,40189
SHAMAN|Mejora|Relic|42608,42607,40322,45169,40708,33507
SHAMAN|Restauracion|Head|46201,45497,45687,45402,45118,45439
SHAMAN|Restauracion|Neck|45443,45933,46047,45243,45116,45447
SHAMAN|Restauracion|Shoulder|46204,46044,45474,46068,45136,45440
SHAMAN|Restauracion|Back|45486,44005,45618,45541,46321,40251
SHAMAN|Restauracion|Chest|45867,45531,45272,45519,45288,46198
SHAMAN|Restauracion|Wrist|45460,45446,45187,45316,40324,40209
SHAMAN|Restauracion|Hands|46199,45665,45943,45239,45520,45462
SHAMAN|Restauracion|Waist|45151,45616,45554,45619,45828,45333
SHAMAN|Restauracion|Legs|46202,45544,45845,46049,46034,45274
SHAMAN|Restauracion|Feet|45615,45537,45135,46050,45563,45513
SHAMAN|Restauracion|Finger|46046,45614,45495,45946,45168,46323
SHAMAN|Restauracion|Trinket|45535,37111,45466,40432,45308,46051
SHAMAN|Restauracion|Weapon|46017,45612,46035,45527,45147,45457
SHAMAN|Restauracion|Off hand|45470,45887,45682,40401,39716,39233
SHAMAN|Restauracion|Relic|45114,40709,38368,28523
WARLOCK|Afliccion|Head|45497,45150,45464,45289,45532,46140
WARLOCK|Afliccion|Neck|45133,45243,45447,44661,45699,45933
WARLOCK|Afliccion|Shoulder|46068,45186,46136,40424,45253,40286
WARLOCK|Afliccion|Back|45618,45242,46042,46321,44005,45493
WARLOCK|Afliccion|Chest|46137,45421,45272,45865,45240,40234
WARLOCK|Afliccion|Wrist|45446,45275,45549,44008,45291,45146
WARLOCK|Afliccion|Hands|45665,46045,46135,45520,45419,45273
WARLOCK|Afliccion|Waist|45619,45557,45508,40301,45119,40561
WARLOCK|Afliccion|Legs|46139,45488,45238,40560,46034,45420
WARLOCK|Afliccion|Feet|45135,45537,45258,45566,46050,45483
WARLOCK|Afliccion|Finger|45495,46046,45451,45297,45515,45168
WARLOCK|Afliccion|Trinket|45466,45518,45148,40255,45866,40432
WARLOCK|Afliccion|Weapon|45620,45990,45886,45457,45527,45437
WARLOCK|Afliccion|Off hand|45617,45115,40273,45271,39766,40698
WARLOCK|Afliccion|Ranged|45294,45257,45511,39712,45170,39426
WARLOCK|Demonologia|Head|45497,45150,45464,45532,46140,45289
WARLOCK|Demonologia|Neck|45133,45539,45699,44661,45243,45447
WARLOCK|Demonologia|Shoulder|46068,45186,40424,40286,46136,45253
WARLOCK|Demonologia|Back|45618,45242,46042,46321,44005,45486
WARLOCK|Demonologia|Chest|46137,45421,45865,40526,40234,45272
WARLOCK|Demonologia|Wrist|45446,45275,45549,45291,40740,44008
WARLOCK|Demonologia|Hands|45665,46045,46135,45419,45976,45520
WARLOCK|Demonologia|Waist|45619,45557,45508,40301,45119,40561
WARLOCK|Demonologia|Legs|46139,45488,45238,40560,46034,45468
WARLOCK|Demonologia|Feet|45135,45258,45537,46050,45566,45483
WARLOCK|Demonologia|Finger|45495,46046,45297,45451,45515,45702
WARLOCK|Demonologia|Trinket|45148,45518,40255,45866,45466,37873
WARLOCK|Demonologia|Weapon|45620,45990,45171,45457,45527,45437
WARLOCK|Demonologia|Off hand|45617,45115,40273,45271,40698,45314
WARLOCK|Demonologia|Ranged|45294,45257,45511,39712,45170,45713
WARLOCK|Destruccion|Head|45497,45150,45464,45289,45532,46140
WARLOCK|Destruccion|Neck|45133,45699,45539,44661,45243,45447
WARLOCK|Destruccion|Shoulder|46136,46068,45186,40424,40286,45253
WARLOCK|Destruccion|Back|45618,45242,46042,46321,44005,45493
WARLOCK|Destruccion|Chest|46137,45421,45865,40526,45272,45240
WARLOCK|Destruccion|Wrist|45446,45275,45549,45291,40740,44008
WARLOCK|Destruccion|Hands|45665,46045,46135,45419,45976,45520
WARLOCK|Destruccion|Waist|45619,45557,45508,40301,45119,40561
WARLOCK|Destruccion|Legs|45488,45238,40560,46139,46034,45420
WARLOCK|Destruccion|Feet|45135,45537,45258,46050,45566,45483
WARLOCK|Destruccion|Finger|45495,46046,45451,45297,45515,45702
WARLOCK|Destruccion|Trinket|45518,45466,45148,40255,45866,37873
WARLOCK|Destruccion|Weapon|45620,45990,45171,45437,45457,45886
WARLOCK|Destruccion|Off hand|45617,45115,40273,45271,40698,39199
WARLOCK|Destruccion|Ranged|45294,45257,45511,39712,45170,37177
WARRIOR|Armas|Head|45472,45610,45107,46151,45329,45993
WARRIOR|Armas|Neck|45459,45945,45285,45819,45517,45820
WARRIOR|Armas|Shoulder|46037,45245,45677,45227,46149,45320
WARRIOR|Armas|Back|46032,45461,45588,46320,45704,45138
WARRIOR|Armas|Chest|45473,45524,45712,46146,39767,40525
WARRIOR|Armas|Wrist|45663,45869,45264,45888,40330,45454
WARRIOR|Armas|Hands|45444,46043,45325,40541,45997,40261
WARRIOR|Armas|Waist|45241,45547,45555,45824,46095,45161
WARRIOR|Armas|Legs|45536,45982,45248,45844,46150,45134
WARRIOR|Armas|Feet|45599,45989,45244,45564,45501,40591
WARRIOR|Armas|Finger|45608,46322,46048,45534,45157,45675
WARRIOR|Armas|Trinket|46038,45931,40256,45522,45286,45609
WARRIOR|Armas|Weapon|45516,45533,45868,45498,46067,45458
WARRIOR|Armas|Ranged|45296,45570,45870,46018,45086,45309
WARRIOR|Furia|Head|46151,45472,45610,45107,45993,45893
WARRIOR|Furia|Neck|45459,45945,45517,45285,45819,45820
WARRIOR|Furia|Shoulder|46149,45245,45677,45320,46037,45227
WARRIOR|Furia|Back|46032,45461,45588,46320,45704,45138
WARRIOR|Furia|Chest|46146,45473,45524,45453,45712,45225
WARRIOR|Furia|Wrist|45611,45869,45264,45663,45888,40330
WARRIOR|Furia|Hands|46148,45444,46043,45325,45430,40541
WARRIOR|Furia|Waist|46095,45241,46041,45829,45547,45555
WARRIOR|Furia|Legs|45536,45982,46150,45134,45248,45432
WARRIOR|Furia|Feet|45599,45989,45564,45244,45501,45232
WARRIOR|Furia|Finger|45608,46322,46048,45534,45157,45540
WARRIOR|Furia|Trinket|45931,45609,40256,45522,45286,46038
WARRIOR|Furia|Weapon|45516,45533,46067,45868,45521,45498
WARRIOR|Furia|Off hand|45516,46067,45868,45521,45233,45165
WARRIOR|Furia|Ranged|45296,45570,45870,45086,46018,45309
WARRIOR|Proteccion|Head|46166,45502,45935,45472,45425,40546
WARRIOR|Proteccion|Neck|45485,45821,45262,45538,44665,45696
WARRIOR|Proteccion|Shoulder|46167,45251,45428,45697,39704,40548
WARRIOR|Proteccion|Back|45496,45319,45588,46014,45322,40722
WARRIOR|Proteccion|Chest|46039,45334,46162,45424,39767,40203
WARRIOR|Proteccion|Wrist|45111,45283,39764,40734,40306,39467
WARRIOR|Proteccion|Hands|45487,45228,46164,45834,45426,45310
WARRIOR|Proteccion|Waist|45139,45825,45551,45241,45304,39759
WARRIOR|Proteccion|Legs|45594,45295,46169,45842,45427,40589
WARRIOR|Proteccion|Feet|45988,45542,45166,45560,45599,39717
WARRIOR|Proteccion|Finger|45471,45247,45326,45112,45874,45871
WARRIOR|Proteccion|Trinket|45158,46021,44063,37220,42341,40257
WARRIOR|Proteccion|Weapon|45442,45876,46036,45110,45142,45315
WARRIOR|Proteccion|Off hand|45587,45877,45450,45707,40400,40475
WARRIOR|Proteccion|Ranged|45137,45570,45296,45870,45086,41168
]])

--========================================================
-- TIER 9 - 30 ESPECIALIZACIONES
-- Fuente de listas: Bistooltip_wowtbc_bislists.lua
--========================================================

MB_LoadRankedTierData("T9", [[
DEATHKNIGHT|Sangre|Head|48545,49467,48540,47677,49332,48529
DEATHKNIGHT|Sangre|Neck|47133,47939,45485,49492,47116,47679
DEATHKNIGHT|Sangre|Shoulder|48543,48542,47698,46122,48535,47944
DEATHKNIGHT|Sangre|Back|47549,47063,45496,48675,47042,47547
DEATHKNIGHT|Sangre|Chest|46968,48547,46962,47964,47591,46039
DEATHKNIGHT|Sangre|Wrist|47111,47570,47918,47108,45111,47611
DEATHKNIGHT|Sangre|Hands|45487,48546,48539,46119,45834,48537
DEATHKNIGHT|Sangre|Waist|47076,47072,47937,45825,45551,45304
DEATHKNIGHT|Sangre|Legs|47061,48544,45594,47052,48541,45295
DEATHKNIGHT|Sangre|Feet|47003,47952,45988,46997,47738,45166
DEATHKNIGHT|Sangre|Finger|45471,47157,47955,47731,47149,45326
DEATHKNIGHT|Sangre|Trinket|47088,45158,47080,46021,47216,49487
DEATHKNIGHT|Sangre|Weapon|47515,47519,45533,47506,46067,45442
DEATHKNIGHT|Sangre|Off hand|47506,45442,45876,47967,48714,45110
DEATHKNIGHT|Sangre|Relic|47672,45144,40714,40822
DEATHKNIGHT|Escarcha|Head|48488,49466,45472,47674,47943,49333
DEATHKNIGHT|Escarcha|Neck|45459,47110,47060,47915,47105,45517
DEATHKNIGHT|Escarcha|Shoulder|48486,48485,47697,46037,47972,48478
DEATHKNIGHT|Escarcha|Back|47547,47545,48674,47192,48673,46971
DEATHKNIGHT|Escarcha|Chest|48490,47086,47589,46965,47004,47082
DEATHKNIGHT|Escarcha|Wrist|45663,47155,46967,47572,47935,47074
DEATHKNIGHT|Escarcha|Hands|47240,48489,47234,47917,47945,48482
DEATHKNIGHT|Escarcha|Waist|45241,47002,47153,47925,47112,46999
DEATHKNIGHT|Escarcha|Legs|48487,47132,45134,47970,47191,48484
DEATHKNIGHT|Escarcha|Feet|47154,47077,45599,47109,47150,47071
DEATHKNIGHT|Escarcha|Finger|46966,47920,45534,47075,47934,45608
DEATHKNIGHT|Escarcha|Trinket|47131,45931,47115,42987,45609,46038
DEATHKNIGHT|Escarcha|Weapon|47526,47156,47966,47973,46097,45947
DEATHKNIGHT|Escarcha|Off hand|47526,47156,47966,47973,46097,45947
DEATHKNIGHT|Escarcha|Relic|40207,47673,45254,40715,40822
DEATHKNIGHT|Profano|Head|48488,49466,45472,47943,48483,45107
DEATHKNIGHT|Profano|Neck|47110,47105,45459,46040,47060,45193
DEATHKNIGHT|Profano|Shoulder|48486,48485,47697,46117,48478,45320
DEATHKNIGHT|Profano|Back|47547,48674,47192,45588,47183,45461
DEATHKNIGHT|Profano|Chest|48490,47086,47082,48481,46965,47004
DEATHKNIGHT|Profano|Wrist|45663,47155,46967,46961,47572,45611
DEATHKNIGHT|Profano|Hands|48489,47917,48482,47240,48480,46113
DEATHKNIGHT|Profano|Waist|47002,47112,45241,46999,47925,46041
DEATHKNIGHT|Profano|Legs|47132,45134,47121,46975,45982,48487
DEATHKNIGHT|Profano|Feet|45599,47154,47150,45501,47919,47077
DEATHKNIGHT|Profano|Finger|46966,45534,47729,46959,47920,45250
DEATHKNIGHT|Profano|Trinket|47131,45609,47115,47734,45522,42987
DEATHKNIGHT|Profano|Weapon|47526,47156,45947,46097,47001,47506
DEATHKNIGHT|Profano|Off hand|47526,47156,46036,45947,47001,46097
DEATHKNIGHT|Profano|Relic|47673,45254,42620,40867,40822,40715
DRUID|Equilibrio|Head|48171,48164,47693,48158,45150,46191
DRUID|Equilibrio|Neck|47144,45133,47957,45699,47747,45539
DRUID|Equilibrio|Shoulder|48168,47713,45186,47923,46068,45136
DRUID|Equilibrio|Back|47552,47095,45242,47089,46042,47553
DRUID|Equilibrio|Chest|48169,47129,47974,47126,47838,45865
DRUID|Equilibrio|Wrist|47143,47927,47141,47663,45275,47066
DRUID|Equilibrio|Hands|48172,46045,47956,47745,46189,45665
DRUID|Equilibrio|Waist|47084,47921,47081,47617,45557,47145
DRUID|Equilibrio|Legs|47190,47189,48170,45488,47187,48165
DRUID|Equilibrio|Feet|47097,47205,47194,47940,45258,45537
DRUID|Equilibrio|Finger|47237,46046,47928,45297,47618,45451
DRUID|Equilibrio|Trinket|47188,45518,45148,40255,45866,47182
DRUID|Equilibrio|Weapon|47206,46980,45620,46017,46979,45612
DRUID|Equilibrio|Off hand|47064,45617,47958,47053,47742,47146
DRUID|Equilibrio|Relic|47670,40321,40712,32387,45270,38360
DRUID|Feral Tanque|Head|48204,47689,49471,48211,49473,48214
DRUID|Feral Tanque|Neck|47133,47133,47116,47939,47060,45517
DRUID|Feral Tanque|Shoulder|48207,45245,48208,47708,47972,48217
DRUID|Feral Tanque|Back|47545,47549,47547,47063,48673,45461
DRUID|Feral Tanque|Chest|47004,48206,45473,47599,48209,47004
DRUID|Feral Tanque|Wrist|45611,47155,47581,45869,47151,45108
DRUID|Feral Tanque|Hands|48203,48212,46043,46158,45325,47945
DRUID|Feral Tanque|Waist|47112,47107,46095,45555,45829,45491
DRUID|Feral Tanque|Legs|46975,48205,45536,46974,48210,45846
DRUID|Feral Tanque|Feet|47077,47919,47071,45232,47608,45564
DRUID|Feral Tanque|Finger|47955,47731,45471,49489,47075,47157
DRUID|Feral Tanque|Trinket|47088,45158,47080,46021,47216,47735
DRUID|Feral Tanque|Weapon|47130,47239,45533,47519,45613,47979
DRUID|Feral Tanque|Relic|45509,47668,38365,33509
DRUID|Feral DPS|Head|48204,47689,49471,48211,49328,45523
DRUID|Feral DPS|Neck|47060,45945,45459,47915,49485,47110
DRUID|Feral DPS|Shoulder|48207,45245,47708,48208,45677,47972
DRUID|Feral DPS|Back|47545,47547,48673,45461,46032,46971
DRUID|Feral DPS|Chest|48206,47599,47954,45453,47004,45473
DRUID|Feral DPS|Wrist|47155,45869,45611,47581,47151,40186
DRUID|Feral DPS|Hands|48203,47945,46043,45325,48212,47719
DRUID|Feral DPS|Waist|47112,46095,47107,45829,45547,45555
DRUID|Feral DPS|Legs|45536,46975,48205,46974,48210,45141
DRUID|Feral DPS|Feet|47077,47919,47071,47608,45232,45564
DRUID|Feral DPS|Finger|45608,47075,47934,46048,45157,47703
DRUID|Feral DPS|Trinket|45931,47131,47115,45522,47734,45609
DRUID|Feral DPS|Weapon|47130,47239,47519,45613,45533,46033
DRUID|Feral DPS|Relic|47668,40713,39757,38365
DRUID|Restauracion|Head|48141,47690,46184,45439,49472,45864
DRUID|Restauracion|Neck|45243,45443,45447,47144,45822,45116
DRUID|Restauracion|Shoulder|48138,46068,48137,47715,48131,46187
DRUID|Restauracion|Back|47553,46977,48672,45618,47552,46976
DRUID|Restauracion|Chest|47096,46993,45519,46992,47094,48169
DRUID|Restauracion|Wrist|47066,47208,45446,47055,47203,45149
DRUID|Restauracion|Hands|48142,45665,47236,45273,45840,45512
DRUID|Restauracion|Waist|47145,46973,45616,47140,46972,45455
DRUID|Restauracion|Legs|48140,47062,48135,47051,46049,47190
DRUID|Restauracion|Feet|47097,45135,47092,47205,45483,45566
DRUID|Restauracion|Finger|45495,47224,47732,45614,47223,45946
DRUID|Restauracion|Trinket|54589,45535,47059,47041,45703,40432
DRUID|Restauracion|Weapon|46017,47206,46980,45886,45620,45612
DRUID|Restauracion|Off hand|47958,45271,47146,47138,39766,47742
DRUID|Restauracion|Relic|40342,47671,33508,25643,38366,46138
HUNTER|Bestias|Head|48262,45610,47689,47942,49480,48257
HUNTER|Bestias|Neck|47060,49485,45945,47915,45480,45517
HUNTER|Bestias|Shoulder|48260,48259,45245,48253,45227,47704
HUNTER|Bestias|Back|47545,48673,45461,45704,46032,46971
HUNTER|Bestias|Chest|48264,47599,48255,46141,45524,48251
HUNTER|Bestias|Wrist|47074,47155,47151,45869,47916,47576
HUNTER|Bestias|Hands|48263,45444,46043,45325,47945,48256
HUNTER|Bestias|Waist|47153,47112,47152,47107,45547,45555
HUNTER|Bestias|Legs|47191,48261,46975,48258,47184,45536
HUNTER|Bestias|Feet|53127,47109,54577,47077,47106,47071
HUNTER|Bestias|Finger|45608,47075,47934,46048,45157,47703
HUNTER|Bestias|Trinket|47131,45931,45522,47734,40256,47115
HUNTER|Bestias|Weapon|47239,47515,47113,47156,45533,47130
HUNTER|Bestias|Off hand|47113,47156,46036,45448,47938,47001
HUNTER|Bestias|Ranged|47521,46995,45570,48711,47950,45870
HUNTER|Punteria|Head|48262,45610,47689,47942,49480,48257
HUNTER|Punteria|Neck|47060,49485,45945,47915,45480,45517
HUNTER|Punteria|Shoulder|48260,48259,45245,48253,45227,47704
HUNTER|Punteria|Back|47545,48673,45461,45704,46032,46971
HUNTER|Punteria|Chest|48264,47599,48255,46141,45524,48251
HUNTER|Punteria|Wrist|47074,47155,47151,45869,47916,47576
HUNTER|Punteria|Hands|48263,45444,46043,45325,47945,48256
HUNTER|Punteria|Waist|47153,47112,47152,47107,45547,45555
HUNTER|Punteria|Legs|47191,48261,46975,48258,47184,45536
HUNTER|Punteria|Feet|53127,47109,54577,47077,47106,47071
HUNTER|Punteria|Finger|45608,47075,47934,46048,45157,47703
HUNTER|Punteria|Trinket|47131,45931,45522,47734,40256,47115
HUNTER|Punteria|Weapon|47239,47515,47113,47156,45533,47130
HUNTER|Punteria|Off hand|47113,47156,46036,45448,47938,47001
HUNTER|Punteria|Ranged|47521,46995,45570,48711,47950,45870
HUNTER|Supervivencia|Head|48262,45610,47689,47942,47718,48257
HUNTER|Supervivencia|Neck|47060,49485,45945,47915,45480,45517
HUNTER|Supervivencia|Shoulder|48260,48259,45245,48253,45227,47704
HUNTER|Supervivencia|Back|47545,45461,48673,45704,46032,46971
HUNTER|Supervivencia|Chest|48264,47599,48255,46141,45524,48251
HUNTER|Supervivencia|Wrist|47074,47151,47916,45869,47576,45454
HUNTER|Supervivencia|Hands|48263,45444,46043,45325,40541,47945
HUNTER|Supervivencia|Waist|47153,47112,47152,47107,45547,45555
HUNTER|Supervivencia|Legs|47191,46975,48261,46974,45844,45536
HUNTER|Supervivencia|Feet|47109,47077,47071,47106,45989,45244
HUNTER|Supervivencia|Finger|45608,47075,47934,46048,47703,45157
HUNTER|Supervivencia|Trinket|47131,44253,47115,45522,47734,45286
HUNTER|Supervivencia|Weapon|47239,47515,46036,47113,45533,47130
HUNTER|Supervivencia|Off hand|46036,47113,47156,45448,47938,47001
HUNTER|Supervivencia|Ranged|47521,46995,45570,48711,47950,45870
MAGE|Arcano|Head|47761,47693,47754,49481,46129,45365
MAGE|Arcano|Neck|47144,45133,47957,45539,45699,47747
MAGE|Arcano|Shoulder|47758,47713,45186,46068,47757,40286
MAGE|Arcano|Back|47553,47095,45242,47089,47552,46042
MAGE|Arcano|Chest|46993,47129,47759,47974,47126,47756
MAGE|Arcano|Wrist|47208,47143,47927,47141,45549,47663
MAGE|Arcano|Hands|47762,47956,46045,46132,47745,45665
MAGE|Arcano|Waist|46973,47084,47921,47081,47617,45557
MAGE|Arcano|Legs|47760,47189,45488,47187,45238,47062
MAGE|Arcano|Feet|47097,47205,47194,47940,45135,45258
MAGE|Arcano|Finger|47237,45495,47928,45297,45451,47618
MAGE|Arcano|Trinket|47188,45518,47182,45148,45866,40255
MAGE|Arcano|Weapon|46980,45620,45990,47517,45171,47524
MAGE|Arcano|Off hand|47958,47064,45617,47053,47742,45115
MAGE|Arcano|Ranged|45294,47658,45257,39712,47922,45511
MAGE|Fuego|Head|47761,49481,47693,47754,46129,45150
MAGE|Fuego|Neck|47144,45133,47957,47747,45699,44661
MAGE|Fuego|Shoulder|47758,47713,46068,45186,47757,47751
MAGE|Fuego|Back|47552,47095,45242,47089,47553,46042
MAGE|Fuego|Chest|47129,47759,47974,47126,47756,46993
MAGE|Fuego|Wrist|47143,47927,47141,47208,47663,45275
MAGE|Fuego|Hands|47762,47956,46045,46132,45665,47236
MAGE|Fuego|Waist|47084,47921,47081,47617,45557,46973
MAGE|Fuego|Legs|47760,45488,47189,47187,46133,47062
MAGE|Fuego|Feet|47097,47205,47940,47194,45258,45537
MAGE|Fuego|Finger|47237,45495,47928,45297,45451,47618
MAGE|Fuego|Trinket|47188,45518,45148,45866,40255,47182
MAGE|Fuego|Weapon|47517,46980,45620,45990,46979,47524
MAGE|Fuego|Off hand|47064,45617,47958,47053,47742,45115
MAGE|Fuego|Ranged|45294,47658,45257,47922,45511,39712
MAGE|Escarcha|Head|47761,47693,47754,49481,47748,46129
MAGE|Escarcha|Neck|47144,45133,47957,47747,45243,45933
MAGE|Escarcha|Shoulder|47758,47713,46068,47757,47751,45186
MAGE|Escarcha|Back|47552,47553,47095,45242,47089,48671
MAGE|Escarcha|Chest|46993,47129,47759,47974,47126,47756
MAGE|Escarcha|Wrist|47143,47927,47208,47141,47585,45446
MAGE|Escarcha|Hands|47762,45665,47956,46045,47236,46132
MAGE|Escarcha|Waist|47084,47921,47081,46973,47617,45557
MAGE|Escarcha|Legs|47760,47189,45488,47187,47062,46133
MAGE|Escarcha|Feet|47097,47205,47194,47940,45537,45135
MAGE|Escarcha|Finger|45495,47237,47928,45297,45451,46046
MAGE|Escarcha|Trinket|47188,45518,45148,47182,40255,45466
MAGE|Escarcha|Weapon|47517,46980,45620,45990,48708,47524
MAGE|Escarcha|Off hand|47064,45617,47958,47053,47742,47146
MAGE|Escarcha|Ranged|45294,47658,45257,47922,45511,47612
PALADIN|Sagrado|Head|48582,48577,49476,47965,48564,46180
PALADIN|Sagrado|Neck|47144,45443,47139,45933,47930,45243
PALADIN|Sagrado|Shoulder|48580,47923,47702,45474,46044,48579
PALADIN|Sagrado|Back|47552,48671,47553,46977,48672,47238
PALADIN|Sagrado|Chest|47147,45445,47603,47142,46992,47209
PALADIN|Sagrado|Wrist|45460,47585,47066,47208,47098,47068
PALADIN|Sagrado|Hands|45665,47236,48583,47235,45928,48576
PALADIN|Sagrado|Waist|47924,47145,46973,46991,47207,45616
PALADIN|Sagrado|Legs|47067,47190,47087,47186,47057,47051
PALADIN|Sagrado|Feet|46986,47099,45537,47097,46985,47090
PALADIN|Sagrado|Finger|47224,45614,45495,47223,46046,45946
PALADIN|Sagrado|Trinket|46051,37111,45535,48724,44255,45929
PALADIN|Sagrado|Weapon|46017,47206,47517,48709,45612,47193
PALADIN|Sagrado|Off hand|47085,45470,47079,45887,47963,45682
PALADIN|Sagrado|Relic|40705,45436,40268,30063,47662,33502
PALADIN|Proteccion|Head|48644,47677,49475,48639,45935,48634
PALADIN|Proteccion|Neck|47133,47939,49492,45485,47116,45538
PALADIN|Proteccion|Shoulder|48646,48637,47944,47698,48636,47720
PALADIN|Proteccion|Back|47549,47063,45496,48675,47042,45319
PALADIN|Proteccion|Chest|46968,48642,46962,46039,48641,47964
PALADIN|Proteccion|Wrist|47111,47108,47570,47918,45111,45283
PALADIN|Proteccion|Hands|48643,45487,48640,46174,45834,48633
PALADIN|Proteccion|Waist|47076,47072,47937,45825,46041,45139
PALADIN|Proteccion|Legs|48645,47061,47052,45295,48638,45594
PALADIN|Proteccion|Feet|47003,45988,46997,47154,47952,45542
PALADIN|Proteccion|Finger|45471,47157,45326,47731,47955,47149
PALADIN|Proteccion|Trinket|47088,45158,47080,46021,47216,49487
PALADIN|Proteccion|Weapon|47156,46097,47526,45947,45442,47506
PALADIN|Proteccion|Off hand|46964,45587,47978,45450,46963,45877
PALADIN|Proteccion|Relic|47661,47664,45145,40707,40337,38363
PALADIN|Reprension|Head|48614,45610,45472,47689,49474,47943
PALADIN|Reprension|Neck|47060,47110,47105,49485,45459,45517
PALADIN|Reprension|Shoulder|48612,45245,48611,47697,48606,45320
PALADIN|Reprension|Back|47547,48674,47192,47545,45461,47183
PALADIN|Reprension|Chest|48616,47086,47082,46965,47004,45473
PALADIN|Reprension|Wrist|47155,47151,46967,47916,45611,46961
PALADIN|Reprension|Hands|48615,48608,46043,45444,47917,47240
PALADIN|Reprension|Waist|47002,47112,45241,47153,47107,46095
PALADIN|Reprension|Legs|47132,46975,48613,46974,45982,45134
PALADIN|Reprension|Feet|47154,47077,47919,47109,47071,47608
PALADIN|Reprension|Finger|46966,47075,45534,47729,46048,47934
PALADIN|Reprension|Trinket|47131,42987,47115,47734,45522,45286
PALADIN|Reprension|Weapon|47519,47515,45533,47078,47239,46067
PALADIN|Reprension|Relic|47661,42853,42852,45510,40191,37574
PRIEST|Disciplina|Head|46197,48035,45497,47984,47694,49483
PRIEST|Disciplina|Neck|47930,47144,46047,45443,47957,45243
PRIEST|Disciplina|Shoulder|46190,48029,47987,47715,46068,45390
PRIEST|Disciplina|Back|47238,47552,47553,48671,46977,45618
PRIEST|Disciplina|Chest|46193,48031,47605,46993,47986,47603
PRIEST|Disciplina|Wrist|47587,47208,45446,47585,47203,44008
PRIEST|Disciplina|Hands|46188,45520,47236,45665,48037,47235
PRIEST|Disciplina|Waist|45619,46973,47977,45558,47837,46972
PRIEST|Disciplina|Legs|47189,47062,45488,48033,47931,46034
PRIEST|Disciplina|Feet|46050,47097,45135,49234,45537,45567
PRIEST|Disciplina|Finger|47237,47733,47224,45495,45614,47054
PRIEST|Disciplina|Trinket|47059,40432,45535,47041,45308,45929
PRIEST|Disciplina|Weapon|46017,47206,45612,47524,45457,47962
PRIEST|Disciplina|Off hand|47146,47138,45271,49490,45314,39766
PRIEST|Disciplina|Ranged|45294,45170,47922,47658,45713,47612
PRIEST|Sagrado|Head|48035,45497,47694,47984,49482,49483
PRIEST|Sagrado|Neck|45243,47144,45443,45447,47139,45933
PRIEST|Sagrado|Shoulder|48029,47715,46068,46190,47987,45253
PRIEST|Sagrado|Back|47553,47552,46977,48672,48671,45618
PRIEST|Sagrado|Chest|46993,48083,48080,46992,47603,48075
PRIEST|Sagrado|Wrist|47208,45446,47203,47585,47927,44008
PRIEST|Sagrado|Hands|48037,45665,47236,47983,47235,45520
PRIEST|Sagrado|Waist|46973,46972,45619,47977,45119,47921
PRIEST|Sagrado|Legs|48033,47062,47985,47051,46195,47980
PRIEST|Sagrado|Feet|47097,45135,47092,47205,45537,45566
PRIEST|Sagrado|Finger|45495,47224,47732,45614,47237,47223
PRIEST|Sagrado|Trinket|47059,46051,47041,45535,40432,45703
PRIEST|Sagrado|Weapon|46017,47206,47524,45886,45457,45612
PRIEST|Sagrado|Off hand|47146,47138,45271,49490,39766,45314
PRIEST|Sagrado|Ranged|47922,45511,45294,45170,47612,39426
PRIEST|Sombras|Head|48085,47693,48078,45150,48073,49482
PRIEST|Sombras|Neck|47144,45133,47957,45699,47747,45539
PRIEST|Sombras|Shoulder|48082,47713,45186,46068,40459,47715
PRIEST|Sombras|Back|47552,47095,45242,47089,47553,46042
PRIEST|Sombras|Chest|48083,47129,47974,47126,46168,46993
PRIEST|Sombras|Wrist|47208,47143,47927,47141,47663,47585
PRIEST|Sombras|Hands|45665,48086,47956,46045,48077,47236
PRIEST|Sombras|Waist|46973,47084,47921,47081,47617,45619
PRIEST|Sombras|Legs|48084,47189,45488,48079,47187,48074
PRIEST|Sombras|Feet|47097,47205,47194,47940,45258,45135
PRIEST|Sombras|Finger|45495,47237,47928,45451,45297,47618
PRIEST|Sombras|Trinket|45518,47188,45148,40255,45866,47213
PRIEST|Sombras|Weapon|47206,46980,45620,46017,46979,47941
PRIEST|Sombras|Off hand|47064,45617,47958,47053,47742,45115
PRIEST|Sombras|Ranged|45294,47658,45257,47922,39712,45511
ROGUE|Asesinato|Head|48230,47689,47529,48225,49477,45993
ROGUE|Asesinato|Neck|47060,49485,45945,45480,45517,47915
ROGUE|Asesinato|Shoulder|48228,45245,46127,45400,45677,47972
ROGUE|Asesinato|Back|47545,45461,46971,45224,48673,45704
ROGUE|Asesinato|Chest|48232,48223,47599,47004,48219,45473
ROGUE|Asesinato|Wrist|47155,45611,47151,45869,40186,47581
ROGUE|Asesinato|Hands|48231,46043,48224,46124,45325,48222
ROGUE|Asesinato|Waist|47112,47107,45829,46095,45555,45547
ROGUE|Asesinato|Legs|46975,48229,46974,48226,45846,45536
ROGUE|Asesinato|Feet|47077,47919,47071,47608,45564,39701
ROGUE|Asesinato|Finger|47075,45608,46048,47934,47703,45157
ROGUE|Asesinato|Trinket|47131,45609,47115,45522,47734,47948
ROGUE|Asesinato|Weapon|46969,45484,47113,45930,47938,46958
ROGUE|Asesinato|Off hand|46969,47113,45484,45930,47938,45607
ROGUE|Asesinato|Ranged|47521,45570,47950,45870,45296,48711
ROGUE|Combate|Head|48230,47689,48225,49477,47529,45993
ROGUE|Combate|Neck|47060,49485,45945,45517,45480,47915
ROGUE|Combate|Shoulder|48228,45245,46127,48227,47972,45677
ROGUE|Combate|Back|47545,48673,45461,46971,47547,45224
ROGUE|Combate|Chest|48232,48223,47599,47004,45473,48219
ROGUE|Combate|Wrist|47155,45869,45611,47151,47581,40186
ROGUE|Combate|Hands|48231,46043,48224,46124,45325,47945
ROGUE|Combate|Waist|47112,47107,46095,45829,45547,45555
ROGUE|Combate|Legs|46975,48229,46974,48226,45536,45846
ROGUE|Combate|Feet|47077,47919,47071,47608,45564,45232
ROGUE|Combate|Finger|47934,47075,46048,45157,47703,45608
ROGUE|Combate|Trinket|47131,45609,45931,47115,45522,46038
ROGUE|Combate|Weapon|47156,47966,47148,45132,45449,45947
ROGUE|Combate|Off hand|47001,46036,45331,47971,46996,46969
ROGUE|Combate|Ranged|47521,45570,47950,45296,48711,45870
SHAMAN|Elemental|Head|48323,49468,47693,49331,46209,45150
SHAMAN|Elemental|Neck|47144,45133,47957,45699,47747,44661
SHAMAN|Elemental|Shoulder|48321,47713,47250,46044,47923,45186
SHAMAN|Elemental|Back|47552,47095,45242,47089,46042,48671
SHAMAN|Elemental|Chest|48325,47129,47974,47126,48316,48310
SHAMAN|Elemental|Wrist|45460,47143,47927,47141,47663,45275
SHAMAN|Elemental|Hands|48324,48317,46045,47956,48312,47745
SHAMAN|Elemental|Waist|47921,47084,47617,47081,45557,45508
SHAMAN|Elemental|Legs|47190,48322,47189,45488,48319,47187
SHAMAN|Elemental|Feet|47099,47205,47194,47940,45258,45537
SHAMAN|Elemental|Finger|46046,47928,45451,47618,45297,47512
SHAMAN|Elemental|Trinket|45518,47188,45148,40255,45866,47182
SHAMAN|Elemental|Weapon|47206,46980,45620,46017,46979,47941
SHAMAN|Elemental|Off hand|47085,47064,45617,47958,47053,45470
SHAMAN|Elemental|Relic|47666,40267,40708,45255,38361
SHAMAN|Mejora|Head|48353,45610,48348,47942,47693,49469
SHAMAN|Mejora|Neck|47060,45133,47957,47144,49485,45517
SHAMAN|Mejora|Shoulder|48351,45245,48350,47713,48345,47969
SHAMAN|Mejora|Back|47552,47095,45461,45242,48671,46971
SHAMAN|Mejora|Chest|46965,47129,48355,46205,47004,48346
SHAMAN|Mejora|Wrist|47916,47155,47143,47576,47927,45611
SHAMAN|Mejora|Hands|48354,45444,46043,45665,47956,47236
SHAMAN|Mejora|Waist|47112,47084,47921,47153,47107,46095
SHAMAN|Mejora|Legs|48352,47189,46975,48349,47190,45488
SHAMAN|Mejora|Feet|47099,47205,47919,47109,45989,45244
SHAMAN|Mejora|Finger|47075,46046,47928,45451,46048,47618
SHAMAN|Mejora|Trinket|47188,45609,47734,45522,45148,47131
SHAMAN|Mejora|Weapon|47206,46980,46017,45620,47941,48709
SHAMAN|Mejora|Off hand|47156,47526,46097,47973,47966,45463
SHAMAN|Mejora|Relic|47666,47667,42608,42607,40322,45169
SHAMAN|Restauracion|Head|46201,48292,47965,47686,48287,47813
SHAMAN|Restauracion|Neck|47144,47139,45443,45933,47930,46047
SHAMAN|Restauracion|Shoulder|46204,48290,47923,46044,47926,45474
SHAMAN|Restauracion|Back|47552,48671,47553,47238,47095,45486
SHAMAN|Restauracion|Chest|46198,48294,47603,47209,48285,46993
SHAMAN|Restauracion|Wrist|45460,47585,47068,47066,47579,47208
SHAMAN|Restauracion|Hands|46199,45665,47236,48293,47235,45943
SHAMAN|Restauracion|Waist|46991,47145,46973,45616,45151,46990
SHAMAN|Restauracion|Legs|47190,47087,47186,48291,47062,47083
SHAMAN|Restauracion|Feet|47099,45537,47090,47097,45615,45135
SHAMAN|Restauracion|Finger|47224,45614,46046,47223,45495,47237
SHAMAN|Restauracion|Trinket|47059,45535,45466,47041,40432,45308
SHAMAN|Restauracion|Weapon|46017,47206,45612,48709,47941,47960
SHAMAN|Restauracion|Off hand|47085,45470,47079,45887,47963,45682
SHAMAN|Restauracion|Relic|47665,45114,40709,38368,28523
WARLOCK|Afliccion|Head|47789,47693,45150,45497,49484,45464
WARLOCK|Afliccion|Neck|47144,45133,47957,45243,45447,44661
WARLOCK|Afliccion|Shoulder|47792,46068,47713,47715,45186,47781
WARLOCK|Afliccion|Back|47552,47095,47553,47089,48671,46977
WARLOCK|Afliccion|Chest|47129,47791,47126,46993,47974,47779
WARLOCK|Afliccion|Wrist|47208,47143,47927,45446,47585,47663
WARLOCK|Afliccion|Hands|47788,47956,45665,46045,47236,47745
WARLOCK|Afliccion|Waist|46973,47921,47084,47617,45557,47081
WARLOCK|Afliccion|Legs|47790,47189,45488,47062,47187,45238
WARLOCK|Afliccion|Feet|47097,47205,47194,45135,47940,45537
WARLOCK|Afliccion|Finger|45495,47237,47928,45451,45297,46046
WARLOCK|Afliccion|Trinket|45466,45518,45148,40255,47188,45866
WARLOCK|Afliccion|Weapon|46980,47517,45620,45990,48708,47524
WARLOCK|Afliccion|Off hand|47958,47064,45617,47053,47742,47146
WARLOCK|Afliccion|Ranged|45294,47658,45257,47922,45511,47612
WARLOCK|Demonologia|Head|47789,47693,45150,45464,45497,47564
WARLOCK|Demonologia|Neck|45243,45133,47957,47144,45539,45699
WARLOCK|Demonologia|Shoulder|47792,47713,45186,46068,47715,47781
WARLOCK|Demonologia|Back|47553,47095,47552,47089,45242,48671
WARLOCK|Demonologia|Chest|47791,47129,47126,47974,47779,46993
WARLOCK|Demonologia|Wrist|47208,47143,47927,47141,45275,45446
WARLOCK|Demonologia|Hands|47788,47956,46045,47782,45665,47236
WARLOCK|Demonologia|Waist|46973,47084,47921,47081,47617,45557
WARLOCK|Demonologia|Legs|47062,47189,45488,47187,47790,45238
WARLOCK|Demonologia|Feet|47097,47205,47194,47940,45135,45537
WARLOCK|Demonologia|Finger|45495,47237,47928,45297,45451,47618
WARLOCK|Demonologia|Trinket|40255,45518,45148,47188,47182,47213
WARLOCK|Demonologia|Weapon|46980,47517,45620,45990,46979,47524
WARLOCK|Demonologia|Off hand|47958,47064,45617,47053,47742,47146
WARLOCK|Demonologia|Ranged|45294,47658,45257,47922,45511,39712
WARLOCK|Destruccion|Head|47789,47693,45150,45464,47564,45497
WARLOCK|Destruccion|Neck|47144,45133,47957,45699,44661,45539
WARLOCK|Destruccion|Shoulder|47792,47713,46068,45186,47715,40424
WARLOCK|Destruccion|Back|47552,47095,45242,47089,47553,46977
WARLOCK|Destruccion|Chest|47791,47129,47126,47838,47779,46993
WARLOCK|Destruccion|Wrist|47143,47927,47208,47663,47141,45275
WARLOCK|Destruccion|Hands|47788,47956,46045,45665,47782,47236
WARLOCK|Destruccion|Waist|46973,47084,47921,47617,45557,47081
WARLOCK|Destruccion|Legs|47062,47189,45488,47187,45238,47790
WARLOCK|Destruccion|Feet|47097,47205,47194,47940,45135,45537
WARLOCK|Destruccion|Finger|45495,47237,47928,45451,45297,47618
WARLOCK|Destruccion|Trinket|47188,45518,45148,40255,45866,47182
WARLOCK|Destruccion|Weapon|46980,47517,45620,45990,47524,46979
WARLOCK|Destruccion|Off hand|47064,45617,47958,47053,47742,45115
WARLOCK|Destruccion|Ranged|45294,47658,45257,47922,39712,45511
WARRIOR|Armas|Head|48383,45610,45472,48378,47674,49478
WARRIOR|Armas|Neck|47915,45459,47110,45945,47105,49485
WARRIOR|Armas|Shoulder|48381,45245,47697,45677,48380,47708
WARRIOR|Armas|Back|47545,47547,48673,48674,47192,45461
WARRIOR|Armas|Chest|48385,47086,47082,45524,47589,48376
WARRIOR|Armas|Wrist|47074,47155,45869,45264,47935,47572
WARRIOR|Armas|Hands|47240,48384,46043,47945,45325,45444
WARRIOR|Armas|Waist|47153,47112,47152,45241,45547,47925
WARRIOR|Armas|Legs|48382,46975,47191,45248,47970,45536
WARRIOR|Armas|Feet|47077,47109,47071,47106,47919,47154
WARRIOR|Armas|Finger|45608,47934,46048,45157,45534,47703
WARRIOR|Armas|Trinket|46038,47131,45931,47734,40256,45522
WARRIOR|Armas|Weapon|47078,47515,47239,47519,45533,45516
WARRIOR|Armas|Ranged|46995,45296,48711,47950,45870,45570
WARRIOR|Furia|Head|48383,47689,45472,45610,48378,47942
WARRIOR|Furia|Neck|47060,45459,47110,45945,49485,47915
WARRIOR|Furia|Shoulder|48381,45245,47697,48380,47708,45677
WARRIOR|Furia|Back|47545,47547,48674,47192,48673,45461
WARRIOR|Furia|Chest|48385,47086,47082,47004,47954,47589
WARRIOR|Furia|Wrist|46967,47155,45611,45869,47074,47151
WARRIOR|Furia|Hands|47240,48384,46043,45444,47945,48377
WARRIOR|Furia|Waist|47002,47153,47112,45241,46095,47152
WARRIOR|Furia|Legs|48382,46975,47191,48379,46150,45536
WARRIOR|Furia|Feet|47077,47109,47919,47154,47071,47106
WARRIOR|Furia|Finger|47075,46966,47934,46048,45534,45157
WARRIOR|Furia|Trinket|45931,47131,40256,45522,47115,45609
WARRIOR|Furia|Weapon|47078,47515,47519,45516,46067,48713
WARRIOR|Furia|Off hand|47078,47515,47519,45516,46067,48713
WARRIOR|Furia|Ranged|46995,45296,48711,47950,47659,45570
WARRIOR|Proteccion|Head|48433,48430,47677,49479,48429,46166
WARRIOR|Proteccion|Neck|47133,47939,45485,49492,47116,47679
WARRIOR|Proteccion|Shoulder|48455,47944,48454,47698,47720,46167
WARRIOR|Proteccion|Back|47549,47063,48675,45496,47547,47042
WARRIOR|Proteccion|Chest|46968,48451,46962,48450,47964,46039
WARRIOR|Proteccion|Wrist|47111,47570,47918,47108,46967,45111
WARRIOR|Proteccion|Hands|48453,45487,48452,45228,46164,45834
WARRIOR|Proteccion|Waist|47076,47072,47937,45139,47002,45825
WARRIOR|Proteccion|Legs|48447,47061,48446,45594,47052,48445
WARRIOR|Proteccion|Feet|47003,47952,46997,45988,47154,45542
WARRIOR|Proteccion|Finger|47157,45471,47955,47149,47731,45247
WARRIOR|Proteccion|Trinket|47088,45158,47080,46021,47216,49487
WARRIOR|Proteccion|Weapon|47506,47001,45442,45876,48714,47967
WARRIOR|Proteccion|Off hand|45587,46964,47978,45877,46963,47835
WARRIOR|Proteccion|Ranged|47660,45137,47521,45570,46995,48711
]])
