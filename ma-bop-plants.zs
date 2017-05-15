# Let Mystical Agriculture provide Biome O'Plenty's plants, flowers, and
# the 4 missing dyes.

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
var Ewither = <mysticalagriculture:wither_skeleton_essence>;
var Edye = <mysticalagriculture:dye_essence>;



# <biomesoplenty:ivy>, Ivy
recipes.addShaped(<biomesoplenty:ivy> * 16, [
	 [null, Enature, null],
	 [null, Enature, null],
	 [null, null, Enature]
	]);

# <biomesoplenty:flower_vine>, Flowering Vines  (unimplemented?)
#recipes.addShaped(<biomesoplenty:flower_vine> * 16, [
#	 [null, Enature, null],
#	 [null, Enature, null],
#	 [Enature, null, Enature]
#	]);


# <biomesoplenty:waterlily>, Water Lily/4 types: Medium, small, tiny, flowered 
recipes.addShaped(<biomesoplenty:waterlily:0> * 8, [
	 [Enature, Enature, Enature],
	 [Enature, <biomesoplenty:waterlily:0>, Enature],
	 [null, Enature, null]]
	);
recipes.addShaped(<biomesoplenty:waterlily:1> * 8, [
	 [Enature, Enature, Enature],
	 [Enature, <biomesoplenty:waterlily:1>, Enature],
	 [null, Enature, null]]
	);
recipes.addShaped(<biomesoplenty:waterlily:2> * 8, [
	 [Enature, Enature, Enature],
	 [Enature, <biomesoplenty:waterlily:2>, Enature],
	 [null, Enature, null]]
	);
recipes.addShaped(<biomesoplenty:waterlily:3> * 8, [
	 [Enature, Enature, Enature],
	 [Enature, <biomesoplenty:waterlily:3>, Enature],
	 [null, Enature, null]]
	);


# To do: 
# Greenery:  Enature duplication, but close to 1:1 nature:plant
# Flowers:  2 Enature+1 Edye + flower -> 3 flowers (vanilla get 4)?
# specials:  Poison Ivy, Deathbloom
# River cane, mb cattails (they might be flowers)
# Coral (water+2 nature + stone? = 4?), algae, kelp
# Turnips? 3-->12

var Plant6 = [
] as IItemStack[];

var Flower3 = [
] as IItemStack[];

var Flower4 = [
] as IItemStack[];

var Coral = [
] as IItemStack[];
