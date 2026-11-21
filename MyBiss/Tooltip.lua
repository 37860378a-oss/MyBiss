local function ExtractItemID(link)
    if not link then return nil end
    local id = string.match(link, "item:(%d+)")
    return id and tonumber(id) or nil
end

local function AddBissLine(tooltip)
    if not tooltip or not tooltip.GetItem then return end
    local _, link = tooltip:GetItem()
    local itemID = ExtractItemID(link)
    if not itemID then return end

    local class = MyBiss.GetSelectedClass()
    local spec = MyBissDB.spec
    local mode = MyBissDB.mode or "PVE"
    if not class or not spec then return end

    local classData = MyBissData and MyBissData[class.token]
    local specData = classData and classData[spec]
    local modeData = specData and specData[mode]
    local entry = modeData and modeData[itemID]

    tooltip:AddLine(" ")
    if entry then
        local rank = entry.rank or "?"
        tooltip:AddLine("|cffffd76aMy Biss|r: |cff00ff00BiS #" .. tostring(rank) .. "|r")
        if entry.note then tooltip:AddLine("|cffaaaaaa" .. entry.note .. "|r") end
    else
        tooltip:AddLine("|cffffd76aMy Biss|r: |cffaaaaaaSin clasificar para " ..
            class.name .. " - " .. spec .. " (" .. mode .. ")|r")
    end
    tooltip:Show()
end

GameTooltip:HookScript("OnTooltipSetItem", AddBissLine)
ItemRefTooltip:HookScript("OnTooltipSetItem", AddBissLine)
