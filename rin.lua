
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/rin.zip" ),
}
local prefabs = 
{
	"willowfire",

}
local start_inv = {
	-- Custom starting items
	
}
local function sanityfn(inst)
	local x,y,z = inst.Transform:GetWorldPosition()	
	local delta = 0
	local max_rad = 10
	local ents = TheSim:FindEntities(x,y,z, max_rad, {"fire"})
    for k,v in pairs(ents) do 
    	if v.components.burnable and v.components.burnable.burning then
    		local sz = TUNING.SANITYAURA_TINY
    		local rad = v.components.burnable:GetLargestLightRadius() or 1
    		sz = sz * ( math.min(max_rad, rad) / max_rad )
			local distsq = inst:GetDistanceSqToInst(v)
			delta = delta + sz/math.max(1, distsq)
    	end
    end
    
    return delta
end


	local fn = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wilson"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "rin.tex" )
	
	-- Stats	
	inst.components.health:SetMaxHealth(300)
	inst.components.health:StartRegen(1, 2)
	inst.components.hunger:SetMax(100)
	inst.components.sanity:SetMax(200)
	inst.components.sanity:SetMax(TUNING.WILLOW_SANITY * 2)
	inst.components.sanity.custom_rate_fn = sanityfn
	inst.components.health.fire_damage_scale = 0
	inst:AddComponent("firebug")
	inst.components.firebug.prefab = "willowfire"
	inst.components.eater.strongstomach = true -- can eat monster meat!
	inst.components.sanity.night_drain_mult = 0
	inst.components.temperature.mintemp = 20
	
	
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 5
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1.25 * TUNING.WILSON_HUNGER_RATE
	
	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 8
	inst.components.locomotor.runspeed = 10
end

return MakePlayerCharacter("rin", prefabs, assets, fn)
