
--========================================================
-- MY BISS - BY CHARLS
-- INTERFACE 0.6.1
-- WOTLK 3.3.5a
-- BIS + ALTERNATIVAS + PROCEDENCIA
--========================================================

local function CreateButton(parent, text, width, height, callback)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width, height)
    button:SetText(text)
    button:SetScript("OnClick", callback)
    return button
end

local function CreateText(parent, text, x, y, width)
    local font = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    font:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    font:SetText(text or "")

    if width then
        font:SetWidth(width)
        font:SetJustifyH("LEFT")
        font:SetJustifyV("TOP")
    end

    return font
end

--========================================================
-- RANURAS
--========================================================

local SlotTextures = {
    ["Cabeza"] = "HeadSlot",
    ["Cuello"] = "NeckSlot",
    ["Hombros"] = "ShoulderSlot",
    ["Espalda"] = "BackSlot",
    ["Pecho"] = "ChestSlot",
    ["Muñecas"] = "WristSlot",
    ["Manos"] = "HandsSlot",
    ["Cintura"] = "WaistSlot",
    ["Piernas"] = "LegsSlot",
    ["Pies"] = "FeetSlot",
    ["Dedo 1"] = "Finger0Slot",
    ["Dedo 2"] = "Finger1Slot",
    ["Abalorio 1"] = "Trinket0Slot",
    ["Abalorio 2"] = "Trinket1Slot",
    ["Arma principal"] = "MainHandSlot",
    ["Mano secundaria"] = "SecondaryHandSlot",
    ["A distancia"] = "RangedSlot",
}

local function GetEmptySlotTexture(slot)
    local inventorySlot = SlotTextures[slot]

    if inventorySlot and GetInventorySlotInfo then
        local texture = GetInventorySlotInfo(inventorySlot)

        if texture then
            return texture
        end
    end

    return "Interface\\Icons\\INV_Misc_QuestionMark"
end

--========================================================
-- DATOS DE OBJETOS
--========================================================

local function GetItemSource(item)
    if not item or not item.itemID then
        return nil
    end

    local sources = MyBissData.ItemSources

    if not sources then
        return nil
    end

    return sources[item.itemID] or sources[tostring(item.itemID)]
end

local function GetItemName(item)
    if not item then
        return "Objeto desconocido"
    end

    if item.itemID then
        local name = GetItemInfo(item.itemID)

        if name then
            return name
        end
    end

    return item.name or "Objeto pendiente"
end

local function GetItemTexture(item, slot)
    if item and item.itemID then
        local _, _, _, _, _, _, _, _, _, texture = GetItemInfo(item.itemID)

        if texture then
            return texture
        end
    end

    return GetEmptySlotTexture(slot)
end

local function GetItemLevel(item)
    if not item or not item.itemID then
        return nil
    end

    local _, _, _, itemLevel = GetItemInfo(item.itemID)

    return itemLevel
end

--========================================================
-- PROCEDENCIA
--========================================================

local function GetSourceType(source)
    local note = string.lower(source.note or "")
    local hasRaid = string.find(note, "raid", 1, true) ~= nil
    local hasDungeon = string.find(note, "dungeon", 1, true) ~= nil

    if hasRaid and hasDungeon then
        return "mixed"
    elseif hasRaid then
        return "raid"
    elseif hasDungeon then
        return "dungeon"
    end

    if source.boss == "Vendedor"
        or string.find(note, "vendedor", 1, true)
        or string.find(note, "misión", 1, true)
        or string.find(note, "recompensa de misión", 1, true)
        or string.find(note, "herrería", 1, true)
        or string.find(note, "fabricad", 1, true)
        or string.find(note, "crafted", 1, true)
        or string.find(note, "profession", 1, true)
        or string.find(note, "world", 1, true)
        or string.find(note, "mundo", 1, true) then
        return "not_applicable"
    end

    return "unknown"
end

local function GetSourceDifficulty(source)
    if source.difficulty and source.difficulty ~= "" then
        return source.difficulty
    end

    local sourceType = GetSourceType(source)
    if sourceType == "not_applicable" then
        return "No aplica"
    elseif sourceType == "mixed" then
        return "Depende del origen"
    end

    return "Sin verificar"
end

local function GetSourceMode(source)
    if source.raidSize and source.raidSize ~= "" then
        return source.raidSize
    end

    local sourceType = GetSourceType(source)
    if sourceType == "not_applicable" then
        return "No aplica"
    elseif sourceType == "dungeon" then
        return "5 jugadores"
    elseif sourceType == "mixed" then
        return "Ver nota de procedencia"
    end

    return "Sin verificar"
end

local function FormatSource(item)
    local source = GetItemSource(item)

    if not source then
        return "|cff888888Procedencia pendiente de verificar|r"
    end

    if type(source) == "string" then
        return source ..
            "\n|cffffcc66Dificultad:|r No aplica" ..
            "\n|cffffcc66Modalidad:|r No aplica"
    end

    local result = ""

    if source.instance and source.instance ~= "" then
        result = result .. "|cffffcc66Instancia:|r " .. source.instance .. "\n"
    end

    if source.boss and source.boss ~= "" then
        result = result .. "|cffffcc66Jefe / Origen:|r " .. source.boss .. "\n"
    end

    result = result .. "|cffffcc66Dificultad:|r " .. GetSourceDifficulty(source) .. "\n"
    result = result .. "|cffffcc66Modalidad:|r " .. GetSourceMode(source) .. "\n"

    if source.note and source.note ~= "" then
        result = result .. "|cffaaaaaa" .. source.note .. "|r\n"
    end

    if result == "" then
        result = "|cff888888Procedencia pendiente de verificar|r"
    end

    return result
end

local function AddSourceToTooltip(item)
    local source = GetItemSource(item)

    if not source then
        return
    end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("PROCEDENCIA", 1, 0.82, 0)

    if type(source) == "string" then
        GameTooltip:AddLine(source, 0.8, 0.8, 0.8, true)
        GameTooltip:AddLine("Dificultad: No aplica", 0.8, 0.8, 0.8, true)
        GameTooltip:AddLine("Modalidad: No aplica", 0.8, 0.8, 0.8, true)
        return
    end

    if source.instance then
        GameTooltip:AddLine("Instancia: " .. source.instance, 0.8, 0.8, 0.8, true)
    end

    if source.boss then
        GameTooltip:AddLine("Jefe / Origen: " .. source.boss, 0.8, 0.8, 0.8, true)
    end

    GameTooltip:AddLine("Dificultad: " .. GetSourceDifficulty(source), 0.8, 0.8, 0.8, true)
    GameTooltip:AddLine("Modalidad: " .. GetSourceMode(source), 0.8, 0.8, 0.8, true)

    if source.note then
        GameTooltip:AddLine(source.note, 0.7, 0.7, 0.7, true)
    end
end

local function SetItemTooltip(owner, item, title)
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")

    if item and item.itemID then
        GameTooltip:SetHyperlink("item:" .. item.itemID)
    else
        GameTooltip:AddLine(title or "Objeto")
        GameTooltip:AddLine("Sin ID de objeto verificado", 0.7, 0.7, 0.7)
    end

    AddSourceToTooltip(item)

    GameTooltip:Show()
end

--========================================================
-- BOTON DE EQUIPO
--========================================================

local function CreateSlotButton(parent, slot)
    local button = CreateFrame("Button", nil, parent)

    button:SetSize(40, 40)

    button:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 10,
        insets = {
            left = 2,
            right = 2,
            top = 2,
            bottom = 2,
        }
    })

    button.Icon = button:CreateTexture(nil, "ARTWORK")
    button.Icon:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)
    button.Icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 3)
    button.Icon:SetTexture(GetEmptySlotTexture(slot))

    button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    button.Label:SetPoint("TOP", button, "BOTTOM", 0, -3)
    button.Label:SetWidth(115)
    button.Label:SetJustifyH("CENTER")
    button.Label:SetText(slot)

    button.Item = nil
    button.SlotName = slot

    button:SetScript("OnClick", function()
        MyBiss.SelectedSlot = slot
        MyBiss.SelectedAlternative = nil
        MyBiss:Refresh()
    end)

    button:SetScript("OnEnter", function(selfButton)
        SetItemTooltip(selfButton, selfButton.Item, slot)
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    return button
end

local function UpdateSlotButton(button, item, selected)
    button.Item = item

    button.Icon:SetTexture(GetItemTexture(item, button.SlotName))
    button.Icon:SetAlpha(item and 1 or 0.45)

    local quality

    if item and item.itemID then
        local _, _, itemQuality = GetItemInfo(item.itemID)
        quality = itemQuality
    end

    if selected then
        button:SetBackdropBorderColor(0.2, 0.8, 1, 1)
    elseif quality and GetItemQualityColor then
        local r, g, b = GetItemQualityColor(quality)
        button:SetBackdropBorderColor(r, g, b, 1)
    elseif item then
        button:SetBackdropBorderColor(0.65, 0.65, 0.65, 1)
    else
        button:SetBackdropBorderColor(0.35, 0.35, 0.35, 0.7)
    end
end

--========================================================
-- BOTONES DE ALTERNATIVAS
--========================================================

local function CreateAlternativeButton(parent, index)
    local button = CreateFrame("Button", nil, parent)

    button:SetSize(34, 34)

    button:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 9,
        insets = {
            left = 2,
            right = 2,
            top = 2,
            bottom = 2,
        }
    })

    button.Icon = button:CreateTexture(nil, "ARTWORK")
    button.Icon:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)
    button.Icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 3)
    button.Icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")

    button.Rank = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    button.Rank:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 3, -2)
    button.Rank:SetText(tostring(index))

    button.Item = nil
    button.Index = index

    button:SetScript("OnClick", function(selfButton)
        MyBiss.SelectedAlternative = selfButton.Index
        MyBiss:Refresh()
    end)

    button:SetScript("OnEnter", function(selfButton)
        SetItemTooltip(selfButton, selfButton.Item, "Alternativa")
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    return button
end

local function UpdateAlternativeButton(button, item, selected, slot)
    button.Item = item

    if not item then
        button:Hide()
        return
    end

    button:Show()
    button.Icon:SetTexture(GetItemTexture(item, slot))

    local quality

    if item.itemID then
        local _, _, itemQuality = GetItemInfo(item.itemID)
        quality = itemQuality
    end

    if selected then
        button:SetBackdropBorderColor(0.2, 0.8, 1, 1)
    elseif quality and GetItemQualityColor then
        local r, g, b = GetItemQualityColor(quality)
        button:SetBackdropBorderColor(r, g, b, 1)
    else
        button:SetBackdropBorderColor(0.65, 0.65, 0.65, 1)
    end
end

--========================================================
-- CREAR INTERFAZ
--========================================================

function MyBiss:CreateUI()

    if MyBissFrame then
        MyBissFrame:Show()
        self:Refresh()
        return
    end

    local frame = CreateFrame("Frame", "MyBissFrame", UIParent)

    frame:SetSize(850, 730)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")

    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = {
            left = 11,
            right = 12,
            top = 12,
            bottom = 11,
        }
    })

    -- TITULO

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -20)
    title:SetText("|cff66ccffMY BISS|r |cffffffff- BY CHARLS|r")

    local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)

    -- TITULOS

    CreateText(frame, "CLASES", 22, -55)
    CreateText(frame, "ESPECIALIZACIONES", 205, -55)
    CreateText(frame, "PROGRESION", 435, -55)
    CreateText(frame, "EQUIPO RECOMENDADO", 205, -220)
    CreateText(frame, "OBJETO Y PROCEDENCIA", 610, -220)

    frame.ClassButtons = {}
    frame.SpecButtons = {}
    frame.PhaseButtons = {}
    frame.SlotButtons = {}
    frame.ModeButtons = {}
    frame.AlternativeButtons = {}

    -- MODOS

    frame.ModeButtons.PVE = CreateButton(frame, "PvE", 70, 25, function()
        MyBiss:SetMode("PVE")
    end)

    frame.ModeButtons.PVE:SetPoint("TOPLEFT", frame, "TOPLEFT", 435, -65)

    frame.ModeButtons.PVP = CreateButton(frame, "PvP", 70, 25, function()
        MyBiss:SetMode("PVP")
    end)

    frame.ModeButtons.PVP:SetPoint("TOPLEFT", frame, "TOPLEFT", 510, -65)

    -- CLASES

    for i, class in ipairs(MyBissData.Classes) do
        local selectedClass = class

        local button = CreateButton(frame, class.name, 155, 25, function()
            MyBiss.SelectedClass = selectedClass.token
            MyBiss.SelectedSpec = selectedClass.specs[1].key
            MyBiss.SelectedSlot = nil
            MyBiss.SelectedAlternative = nil
            MyBiss:Refresh()
        end)

        button:SetPoint("TOPLEFT", frame, "TOPLEFT", 22, -78 - ((i - 1) * 29))
        frame.ClassButtons[i] = button
    end

    -- ESPECIALIZACIONES

    for i = 1, 4 do
        local index = i

        local button = CreateButton(frame, "", 190, 27, function()
            local class = MyBiss:GetProfile()

            if class and class.specs[index] then
                MyBiss.SelectedSpec = class.specs[index].key
                MyBiss.SelectedSlot = nil
                MyBiss.SelectedAlternative = nil
                MyBiss:Refresh()
            end
        end)

        button:SetPoint("TOPLEFT", frame, "TOPLEFT", 205, -78 - ((i - 1) * 31))
        frame.SpecButtons[i] = button
    end

    -- FASES

    for i = 1, 6 do
        local index = i

        local button = CreateButton(frame, "", 145, 27, function()
            local phases

            if MyBiss.SelectedMode == "PVP" then
                phases = MyBissData.PvPPhases
            else
                phases = MyBissData.Phases
            end

            if phases and phases[index] then
                MyBiss.SelectedPhase = phases[index].key
                MyBiss.SelectedSlot = nil
                MyBiss.SelectedAlternative = nil
                MyBiss:Refresh()
            end
        end)

        local column = (i - 1) % 2
        local row = math.floor((i - 1) / 2)

        button:SetPoint(
            "TOPLEFT",
            frame,
            "TOPLEFT",
            435 + (column * 150),
            -105 - (row * 31)
        )

        frame.PhaseButtons[i] = button
    end

    -- EQUIPO

    for i, slot in ipairs(MyBissData.Slots) do
        local button = CreateSlotButton(frame, slot)

        local column = (i - 1) % 3
        local row = math.floor((i - 1) / 3)

        button:SetPoint(
            "TOPLEFT",
            frame,
            "TOPLEFT",
            215 + (column * 130),
            -242 - (row * 48)
        )

        frame.SlotButtons[i] = button
    end

    -- PANEL DE DETALLES DEL OBJETO

    frame.InfoTitle = CreateText(frame, "OBJETO SELECCIONADO", 610, -245, 215)
    frame.Info = CreateText(frame, "", 610, -265, 215)

    -- PANEL DE GEMAS Y ENCANTAMIENTOS

    frame.BuildTitle = CreateText(frame, "CONFIGURACION DEL EQUIPO", 610, -455, 215)
    frame.BuildInfo = CreateText(frame, "", 610, -475, 215)

    -- ALTERNATIVAS

    frame.AlternativeTitle = CreateText(frame, "ALTERNATIVAS", 610, -585, 215)

    for i = 1, 6 do
        local button = CreateAlternativeButton(frame, i)

        local column = (i - 1) % 3
        local row = math.floor((i - 1) / 3)

        button:SetPoint(
            "TOPLEFT",
            frame,
            "TOPLEFT",
            610 + (column * 43),
            -607 - (row * 43)
        )

        frame.AlternativeButtons[i] = button
    end

    -- ESTADO Y PIE

    frame.Status = CreateText(frame, "", 205, -680, 600)

    frame.Footer = CreateText(
        frame,
        "/mbiss para abrir o cerrar | WotLK 3.3.5a",
        22,
        -705,
        780
    )

    MyBissFrame = frame

    self:Refresh()
    frame:Show()
end

--========================================================
-- ACTUALIZAR INTERFAZ
--========================================================

function MyBiss:Refresh()

    if not MyBissFrame then
        return
    end

    local frame = MyBissFrame
    local class, spec = self:GetProfile()

    if not class or not spec then
        return
    end

    -- CLASES

    for i, classData in ipairs(MyBissData.Classes) do
        local prefix = ""

        if classData.token == self.SelectedClass then
            prefix = "|cff66ccff» |r"
        end

        frame.ClassButtons[i]:SetText(prefix .. classData.name)
    end

    -- ESPECIALIZACIONES

    for i = 1, 4 do
        local currentSpec = class.specs[i]

        if currentSpec then
            local prefix = ""

            if currentSpec.key == self.SelectedSpec then
                prefix = "|cff66ccff» |r"
            end

            frame.SpecButtons[i]:SetText(prefix .. currentSpec.key)
            frame.SpecButtons[i]:Show()
        else
            frame.SpecButtons[i]:Hide()
        end
    end

    -- FASES

    local phases

    if self.SelectedMode == "PVP" then
        phases = MyBissData.PvPPhases
    else
        phases = MyBissData.Phases
    end

    for i = 1, 6 do
        local phase = phases and phases[i]

        if phase then
            local prefix = ""

            if phase.key == self.SelectedPhase then
                prefix = "|cff66ccff» |r"
            end

            frame.PhaseButtons[i]:SetText(prefix .. phase.name)
            frame.PhaseButtons[i]:Show()
        else
            frame.PhaseButtons[i]:Hide()
        end
    end

    -- MODO

    frame.ModeButtons.PVE:SetText(
        self.SelectedMode == "PVE" and "|cff66ccffPvE|r" or "PvE"
    )

    frame.ModeButtons.PVP:SetText(
        self.SelectedMode == "PVP" and "|cff66ccffPvP|r" or "PvP"
    )

    -- OBTENER EQUIPO

    local phaseData = self:GetCurrentBuild()

    if not phaseData then
        frame.Info:SetText("|cff888888No hay datos cargados para esta fase.|r")
        frame.BuildInfo:SetText("")
        frame.Status:SetText("|cff888888Esta fase todavía no tiene equipo verificado.|r")

        for _, button in ipairs(frame.SlotButtons) do
            UpdateSlotButton(button, nil, false)
        end

        for _, button in ipairs(frame.AlternativeButtons) do
            button:Hide()
        end

        return
    end

    -- ACTUALIZAR ICONOS DE EQUIPO

    for i, slot in ipairs(MyBissData.Slots) do
        local item = phaseData.bestInSlot
            and phaseData.bestInSlot[slot]

        UpdateSlotButton(
            frame.SlotButtons[i],
            item,
            self.SelectedSlot == slot
        )
    end

    -- RANURA SELECCIONADA

    local selectedSlot = self.SelectedSlot or "Cabeza"

    local selectedItem = phaseData.bestInSlot
        and phaseData.bestInSlot[selectedSlot]

    local alternatives = {}

    if phaseData.alternatives then
        alternatives = phaseData.alternatives[selectedSlot] or {}
    end

    -- ALTERNATIVA SELECCIONADA

    local selectedAlternative = self.SelectedAlternative
    local displayedItem = selectedItem
    local displayedTitle = "BIS PRINCIPAL"

    if selectedAlternative and alternatives[selectedAlternative] then
        displayedItem = alternatives[selectedAlternative]
        displayedTitle = "ALTERNATIVA #" .. selectedAlternative
    end

    --====================================================
    -- INFORMACION DEL OBJETO
    --====================================================

    local info = ""

    info = info .. "|cffffcc66" .. class.name .. " - " .. spec.key .. "|r"
    info = info .. " (" .. (spec.role or "Rol no definido") .. ")\n"
    info = info .. "|cffffcc66FASE:|r " .. (self.SelectedPhase or "")
    info = info .. "  |cffffcc66RANURA:|r " .. selectedSlot .. "\n\n"

    info = info .. "|cffffcc66" .. displayedTitle .. ":|r\n"

    if displayedItem then
        info = info .. GetItemName(displayedItem) .. "\n"

        if displayedItem.itemID then
            info = info .. "ID: " .. tostring(displayedItem.itemID)
        end

        local itemLevel = GetItemLevel(displayedItem)
        if itemLevel then
            info = info .. "  |cffffcc66Nivel:|r " .. tostring(itemLevel)
        end

        info = info .. "\n|cffffcc66PROCEDENCIA:|r\n"
        info = info .. FormatSource(displayedItem)
    else
        info = info .. "|cff888888Pendiente de verificar|r\n"
        info = info .. "\n|cffffcc66PROCEDENCIA:|r\n"
        info = info .. "|cff888888Sin objeto asignado|r"
    end

    frame.Info:SetFontObject(GameFontNormalSmall)
    frame.Info:SetSpacing(1)
    frame.BuildInfo:SetFontObject(GameFontNormalSmall)
    frame.BuildInfo:SetSpacing(1)
    frame.Info:SetText(info)

    --====================================================
    -- GEMAS, ENCANTAMIENTOS Y ESTADISTICAS
    --====================================================

    local buildInfo = ""

    local gems = phaseData.gems
        and phaseData.gems[selectedSlot]
        or {}

    buildInfo = buildInfo .. "|cffffcc66GEMAS:|r\n"

    if #gems > 0 then
        for _, gem in ipairs(gems) do
            buildInfo = buildInfo .. "- " .. tostring(gem) .. "\n"
        end
    else
        buildInfo = buildInfo .. "Sin gemas cargadas\n"
    end

    local enchant = phaseData.enchants
        and phaseData.enchants[selectedSlot]

    buildInfo = buildInfo .. "\n|cffffcc66ENCANTAMIENTO:|r\n"
    buildInfo = buildInfo .. (enchant or "Sin encantamiento cargado")

    buildInfo = buildInfo .. "\n\n|cffffcc66ESTADISTICAS:|r\n"
    buildInfo = buildInfo .. (spec.stats or "Sin prioridades definidas")

    frame.BuildInfo:SetText(buildInfo)

    --====================================================
    -- ICONOS DE ALTERNATIVAS
    --====================================================

    for i = 1, 6 do
        local alternative = alternatives[i]

        UpdateAlternativeButton(
            frame.AlternativeButtons[i],
            alternative,
            selectedAlternative == i,
            selectedSlot
        )
    end

    --====================================================
    -- ESTADO DE BASE DE DATOS
    --====================================================

    if phaseData.status == "pending_verified_items" then
        frame.Status:SetText(
            "|cffffcc66ESTADO:|r Hay objetos pendientes de verificar."
        )
    else
        frame.Status:SetText(
            "|cff66ff66ESTADO:|r Equipo cargado en la base local."
        )
    end
end
