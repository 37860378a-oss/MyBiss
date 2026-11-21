
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

    MyBiss:Message("Addon cargado correctamente. Escribi /mbiss para abrirlo.")

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
