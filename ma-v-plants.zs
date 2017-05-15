# Let Mystical Agriculture produce or duplicate vanilla plants and flowers

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

var Edirt = <mysticalagriculture:dirt_essence>;
var Enature = <mysticalagriculture:nature_essence>;
var Edye = <mysticalagriculture:dye_essence>;
var Eend = <mysticalagriculture:end_essence>;

# Tall Grass
recipes.addShaped(<minecraft:tallgrass:1> * 6, [
	 [null, null, null],
	 [Enature, null, Enature],
	 [Enature, null, Enature]]
	);
	
# Double Tall Grass
recipes.addShaped(<minecraft:double_plant:2> * 4, [
	 [Enature, null, Enature],
	 [Enature, null, Enature],
	 [Enature, null, Enature]]
	);
	
# Fern
recipes.addShaped(<minecraft:tallgrass:2> * 6, [
	 [null, Enature, null],
	 [Enature, Enature, Enature],
	 [null, null, null]]
	);
	
# Tall Fern
recipes.addShaped(<minecraft:double_plant:3> * 4, [
	 [null, Enature, null],
	 [Enature, null, Enature],
	 [Enature, Enature, Enature]]
	);

# dead bush
recipes.addShaped(<minecraft:deadbush> * 6, [
	 [null, Enature, null],
	 [Enature, Enature, Enature],
	 [null, Edirt, null]]
	);


# Perhaps should require a sample.
recipes.addShaped(<minecraft:chorus_flower> * 4, [
	 [Enature, Eend, Enature],
	 [Eend, null, Eend],
	 [Enature, Eend, Enature]
	]);

# Get a little more than for BoP flowers, because these give only 1 dye.
# For the two-high flowers, use bonemeal or one of MA's 2 super-bonemeals.
var Flower4 = [
    <minecraft:yellow_flower>,	// Dandelion
    <minecraft:red_flower:0>,	// Poppy
    <minecraft:red_flower:1>,	// Blue Orchid
    <minecraft:red_flower:2>,	// Allium
    <minecraft:red_flower:3>,	// Azure Bluet
    <minecraft:red_flower:4>,	// Red Tulip
    <minecraft:red_flower:5>,	// Orange Tulip
    <minecraft:red_flower:6>,	// White Tulip
    <minecraft:red_flower:7>,	// Pink Tulip
    <minecraft:red_flower:8>	// Oxeye Daisy
] as IItemStack[];

for flower in Flower4 {
    recipes.addShaped(flower * 4, [
	 [null, null, null],
	 [Enature, flower, Enature],
	 [null, Edye, null]]
	);
}

