local mod	= DBM:NewMod("DrakosTheInterrogator", "DBM-Party-WotLK", 9)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 2481 $"):sub(12, -3))
mod:SetCreatureID(27654)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"UNIT_DIED"
)

mod:AddBoolOption("MakeitCountTimer", true, "timer")

function mod:UNIT_DIED(args)
	if not self:IsDifficulty("normal5") then
		if self.Options.MakeitCountTimer and not DBM.Bars:GetBar(L.MakeitCountTimer) then
			local cid = self:GetCIDFromGUID(args.destGUID)
			if cid == 27654 then		-- Drakos The Interrogator
				DBM.Bars:CreateBar(1200, L.MakeitCountTimer)
			end
		end
	end
end