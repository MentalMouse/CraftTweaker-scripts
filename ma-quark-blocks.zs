# Provide recipes for Quark's additional stone types

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

var Edirt = <mysticalagriculture:dirt_essence>;
var Estone = <mysticalagriculture:stone_essence>;
var Enature = <mysticalagriculture:nature_essence>;
var Enether = <mysticalagriculture:nether_essence>;
var Efire = <mysticalagriculture:fire_essence>;
var Eice = <mysticalagriculture:ice_essence>;
var Ewater = <mysticalagriculture:water_essence>;
var Eglow = <mysticalagriculture:glowstone_essence>;
var Ediamond = <mysticalagriculture:diamond_essence>;


# Quark 
# <quark:limestone>, Limestone
recipes.addShaped(<quark:limestone> * 16, [
	 [null, Estone, null],
	 [Estone, null, Estone],
	 [null, Estone, Ewater]
	]);

# <quark:biome_cobblestone:0>,  Brimstone
recipes.addShaped(<quark:biome_cobblestone:0> * 16, [
	 [Efire, Estone, null],
	 [Estone, Efire, Estone],
	 [null, Estone, Efire]
	]);

# <quark:biome_cobblestone:1>,  Permafrost
recipes.addShaped(<quark:biome_cobblestone:1> * 16, [
	 [Eice, Estone, null],
	 [Estone, Eice, Estone],
	 [null, Estone, Eice]
	]);

# <quark:soul_sandstone> Soul Sandstone (make from soul sand)

# <quark:marble> Marble
recipes.addShaped(<quark:marble> * 16, [
	 [Estone, Estone, null],
	 [Estone, Estone, Estone],
	 [null, Estone, Ewater]
	]);

# <quark:glowcelium> Glowcelium  (optional, rare)
#recipes.addShaped(<quark:glowcelium> * 16, [
#	 [Enature, Eglow, Enature],
#	 [Edirt, Eglow, Edirt],
#	 [Edirt, Edirt, Edirt]
#	]);

# <quark:basalt> Basalt (nether/end)
recipes.addShaped(<quark:basalt> * 16, [
	 [null, Estone, null],
	 [Estone, Enether, Estone],
	 [null, Estone, null]
	]);

# <quark:crystal> Cave Crystal (colors 0-7: White, ROYGBIV)
# Needs ore dictionary for the dyes; Cost is nearly 1 diamond per piece.
#  Note that you need 8 to make a rune.
# Disabled by default.

var Dyes = [
    <ore:dyeWhite>,
    <ore:dyeRed>,
    <ore:dyeOrange>,
    <ore:dyeYellow>,
    <ore:dyeGreen>,
    <ore:dyeBlue>,
    <ore:dyeCyan>, //There is no indigo dye
    <ore:dyePurple>,
] as IIngredient[];

var Crystals = [
    <quark:crystal:0>,
    <quark:crystal:1>,
    <quark:crystal:2>,
    <quark:crystal:3>,
    <quark:crystal:4>,
    <quark:crystal:5>,
    <quark:crystal:6>,
    <quark:crystal:7>,
] as IItemStack[];


#for i, dye in Dyes {
#    recipes.addShaped(Crystals[i], [
#    	 [Ediamond, Ediamond, Ediamond],
#    	 [Ediamond, dye, Ediamond],
#    	 [Ediamond, Ediamond, Ediamond]
#    ]);
#}