PrefabFiles = {
	"rin",
	"willowfire",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/rin.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/rin.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/rin.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/rin.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/rin_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/rin_silho.xml" ),

    Asset( "IMAGE", "bigportraits/rin.tex" ),
    Asset( "ATLAS", "bigportraits/rin.xml" ),
	
	Asset( "IMAGE", "images/map_icons/rin.tex" ),
	Asset( "ATLAS", "images/map_icons/rin.xml" ),
	
}

local require = GLOBAL.require


-- The character select screen lines
GLOBAL.STRINGS.CHARACTER_TITLES.rin = "The Exorcist"
GLOBAL.STRINGS.CHARACTER_NAMES.rin = "Rin Okumura"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.rin = "*Immune to Fire\n*Always Hungry\n*Not Scared of the Dark"
GLOBAL.STRINGS.CHARACTER_QUOTES.rin = "\"I'm going to become the most powerful Exorcist ever!\""

-- Custom speech strings
GLOBAL.STRINGS.CHARACTERS.RIN = require "speech_rin"

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "rin")


AddMinimapAtlas("images/map_icons/rin.xml")
AddModCharacter("rin")

