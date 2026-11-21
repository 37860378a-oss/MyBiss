
--========================================================
-- MY BISS - CORE
--========================================================

MyBiss = MyBiss or {}

MyBiss.SelectedClass = "WARRIOR"
MyBiss.SelectedSpec = "Armas"
MyBiss.SelectedPhase = "PRE_RAID"
MyBiss.SelectedMode = "PVE"
MyBiss.SelectedSlot = "Cabeza"

local function GetClass(token)

    for _, class in ipairs(MyBissData.Classes) do
        if class.token == token then
            return class
        end
    end

end

function MyBiss:GetProfile()

    local class = GetClass(self.SelectedClass)

    if not class then
        return nil, nil
    end

    for _, spec in ipairs(class.specs) do
        if spec.key == self.SelectedSpec then
            return class, spec
        end
    end

    return class, class.specs[1]
end

function MyBiss:GetPhase()

    local class, spec = self:GetProfile()

    if not class or not spec then
        return nil
    end

    return MyBissData.Gear[class.token][spec.key][self.SelectedPhase]
end

function MyBiss:Message(message)

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffMy Biss:|r " .. tostring(message)
    )

end

function MyBiss:Toggle()

    if not MyBissFrame then
        self:CreateUI()
        return
    end

    if MyBissFrame:IsShown() then
        MyBissFrame:Hide()
    else
        MyBissFrame:Show()
        self:Refresh()
    end

end

--========================================================
-- BOTON DEL MINIMAPA
--========================================================

function MyBiss:CreateMinimapButton()
    if self.MinimapButton then return end

    local button = CreateFrame("Button", "MyBissMinimapButton", Minimap)
    button:SetSize(32, 32)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetMovable(true)
    button:EnableMouse(true)
    button:RegisterForClicks("LeftButtonUp")
    button:RegisterForDrag("LeftButton")
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER")
    button.Icon = icon

    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetSize(54, 54)
    border:SetPoint("TOPLEFT", button, "TOPLEFT")
    button.Border = border

    local function UpdatePosition()
        local angle = MyBissDB and MyBissDB.minimapAngle or 220
        local radius = 80
        local x = math.cos(math.rad(angle)) * radius
        local y = math.sin(math.rad(angle)) * radius
        button:ClearAllPoints()
        button:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end

    button:SetScript("OnClick", function()
        MyBiss:Toggle()
    end)

    button:SetScript("OnEnter", function(selfButton)
        GameTooltip:SetOwner(selfButton, "ANCHOR_LEFT")
        GameTooltip:AddLine("My Biss", 0.4, 0.8, 1)
        GameTooltip:AddLine("Clic izquierdo: abrir / cerrar", 1, 1, 1)
        GameTooltip:AddLine("Arrastrar: mover icono", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    button:SetScript("OnDragStart", function(selfButton)
        selfButton:LockHighlight()
        selfButton:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = UIParent:GetEffectiveScale()
            px, py = px / scale, py / scale
            local angle = math.deg(math.atan2(py - my, px - mx))
            MyBissDB.minimapAngle = angle
            UpdatePosition()
        end)
    end)

    button:SetScript("OnDragStop", function(selfButton)
        selfButton:UnlockHighlight()
        selfButton:SetScript("OnUpdate", nil)
    end)

    UpdatePosition()
    self.MinimapButton = button
end

function MyBiss:ShowItem(itemID)

    itemID = tonumber(itemID)

    if not itemID then
        return
    end

    GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
    GameTooltip:SetHyperlink("item:" .. itemID)
    GameTooltip:Show()

end

SLASH_MYBISS1 = "/mbiss"
SLASH_MYBISS2 = "/mybiss"

SlashCmdList["MYBISS"] = function()

    MyBiss:Toggle()

end

-- Inicializacion del addon.
local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("ADDON_LOADED")

eventFrame:SetScript("OnEvent", function(self, event, addonName)

    if addonName ~= "MyBiss" then
        return
    end

    MyBissDB = MyBissDB or {}
    MyBiss:CreateMinimapButton()

    MyBiss:Message("Addon cargado correctamente. Usa /mbiss o el icono del minimapa para abrirlo.")

    self:UnregisterEvent("ADDON_LOADED")

end)

--========================================================
-- CAMBIO ENTRE PvE Y PvP
--========================================================

function MyBiss:SetMode(mode)

    if mode ~= "PVE" and mode ~= "PVP" then
        return
    end

    self.SelectedMode = mode

    if mode == "PVE" then
        self.SelectedPhase = "PRE_RAID"
    else
        self.SelectedPhase = "PVP_S5"
    end

    self:Refresh()

end

function MyBiss:GetCurrentBuild()

    return MyBissData:GetBuild(
        self.SelectedMode,
        self.SelectedClass,
        self.SelectedSpec,
        self.SelectedPhase
    )

end

function MyBiss:GetSelectedItem()

    local build = self:GetCurrentBuild()

    if not build then return nil end

    return build.bestInSlot[self.SelectedSlot]

end

function MyBiss:GetSelectedAlternatives()

    local build = self:GetCurrentBuild()

    if not build then return {} end

    return build.alternatives[self.SelectedSlot] or {}

end
