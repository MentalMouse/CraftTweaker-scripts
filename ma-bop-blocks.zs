# Let Mystical Agriculture provide Biome O'Plenty's dirt and stone types.
# May 19 2017:  Hardened Ice

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

var Edirt = <mysticalagriculture:dirt_essence>;
var Estone = <mysticalagriculture:stone_essence>;
var Enature = <mysticalagriculture:nature_essence>;
var Enether = <mysticalagriculture:nether_essence>;
var Efire = <mysticalagriculture:fire_essence>;
var Eice = <mysticalagriculture:ice_essence>;
var Ewater = <mysticalagriculture:water_essence>;
var Ecoal = <mysticalagriculture:coal_essence>;
var Eglow = <mysticalagriculture:glowstone_essence>;

# Plain dirt is 8->24,  coarse is 3->16, podzol is 3->8

# <biomesoplenty:dirt:0>, Loamy Dirt (8->24)
recipes.addShaped(<biomesoplenty:dirt:0> * 24, [
	 [Edirt, null, Edirt],
	 [Edirt, Edirt, Edirt],
	 [Edirt, Edirt, Edirt]
	]);
	
# <biomesoplenty:dirt:1>, Sandy Dirt (8->24)
 recipes.addShaped(<biomesoplenty:dirt:1> * 24, [
	 [Edirt, Edirt, Edirt],
	 [null, Edirt, Edirt],
	 [Edirt, Edirt, Edirt]
	]);

# <biomesoplenty:dirt:2>, Silty Dirt (8->24)
 recipes.addShaped(<biomesoplenty:dirt:1> * 24, [
	 [Edirt, Edirt, Edirt],
	 [Edirt, Edirt, null],
	 [Edirt, Edirt, Edirt]
	]);

# <biomesoplenty:dried_sand>, Dried Sand (like sand, 2+2=16)
 recipes.addShaped(<biomesoplenty:dried_sand> * 16, [
	 [null, Edirt, null],
	 [Efire, Edirt, Efire],
	 [null, null, null]
	]);

# <biomesoplenty:mud>, Mud (mirror of clay recipe)
 recipes.addShaped(<biomesoplenty:mudball> * 24, [
	 [Edirt, Ewater, null],
	 [Ewater, Edirt, null],
	 [null, null, null]
	]);

# For now, make coarse dirt with recipes and grow grass on dirt blocks.
# <biomesoplenty:dirt:8>, Coarse Loamy Dirt
# <biomesoplenty:dirt:9>, Coarse Sandy Dirt
# <biomesoplenty:dirt:10>, Coarse Silty Dirt
# <biomesoplenty:grass:2>, Loamy Grass
# <biomesoplenty:grass:3>, Sandy Grass
# <biomesoplenty:grass:4>, Silty Grass

# Fancy grass etc.  (Not implemented, unique location or not in current version)
# <biomesoplenty:grass:0>, Spectral Moss	// unused
# <biomesoplenty:grass:1>, Overgrown Stone	// new Crag biome
# <biomesoplenty:grass:5>, Origin Grass		// Origin Island
# <biomesoplenty:grass:6>, Overgrown Netherrack // in Nether biomes
# <biomesoplenty:grass:7>, Flowering Grass	// Flower Island

# <biomesoplenty:stone:0>, Limestone
recipes.addShaped(<biomesoplenty:stone:0> * 16, [
	 [Ewater, Estone, null],
	 [Estone, null, Estone],
	 [null, Estone, null]
	]);

# <biomesoplenty:stone:1>, Siltstone
recipes.addShaped(<biomesoplenty:stone:1> * 16, [
	 [Estone, null, Estone],
	 [null, Ewater, null],
	 [Estone, null, Estone]
	]);
# <biomesoplenty:stone:2>, Shale
recipes.addShaped(<biomesoplenty:stone:2> * 16, [
	 [null, Estone, null],
	 [Estone, Ecoal, Estone],
	 [null, Estone, null]
	]);

# <biomesoplenty:hard_ice>, Hardened Ice
recipes.addShaped(<biomesoplenty:hard_ice> * 12, [
	 [Eice, null, Eice],
	 [null, Estone, null],
	 [Eice, null, Eice]
	]);

# <biomesoplenty:flesh>, Flesh Block (nether)
recipes.addShaped(<biomesoplenty:flesh> * 16, [
	 [null, Enether, null],
	 [Enether, <minecraft:rotten_flesh>, Enether],
	 [null, Estone, Enether]
	]);

