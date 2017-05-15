# Let Mystical Agriculture provide Biome O'Plenty's plants, flowers, and
# the 4 missing dyes.
#
# Due to the multitude of recipes, most of them are based on duplicating
#     a sample with a pattern.

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

var Edirt = <mysticalagriculture:dirt_essence>;
var Ewood = <mysticalagriculture:wood_essence>;
# var Estone = <mysticalagriculture:stone_essence>;
var Enature = <mysticalagriculture:nature_essence>;
# var Enether = <mysticalagriculture:nether_essence>;
# var Efire = <mysticalagriculture:fire_essence>;
# var Eice = <mysticalagriculture:ice_essence>;
var Ewater = <mysticalagriculture:water_essence>;
var Eglow = <mysticalagriculture:glowstone_essence>;
# var Ewither = <mysticalagriculture:wither_skeleton_essence>;
var Edye = <mysticalagriculture:dye_essence>;

###################################################################
# from-scratch recipes

# <biomesoplenty:ivy>, Ivy
recipes.addShaped(<biomesoplenty:ivy> * 16, [
	 [null, Enature, null],
	 [null, Enature, null],
	 [null, null, Enature]
	]);

# <biomesoplenty:kelp>, Kelp
recipes.addShaped(<biomesoplenty:seaweed> * 16, [
	 [null, Enature, null],
	 [null, Ewater, null],
	 [null, Enature, null]
	]);

# <biomesoplenty:flower_vine>, Flowering Vines  (unused or scarce?)
recipes.addShaped(<biomesoplenty:flower_vine> * 16, [
	 [null, Enature, null],
	 [null, Enature, null],
	 [Enature, null, Enature]
	]);

# Turnips:  3->12 like beets, mirror beet recipe
recipes.addShaped(<biomesoplenty:turnip> * 12, [
	 [null, null, Enature],
	 [Enature, null, null],
	 [null, null, Enature]
	]);

# River cane (like sugar cane with a bit of wood),
recipes.addShaped(<biomesoplenty:plant_1:5> * 16, [
    [null, Ewood, null],
    [Enature, Enature, Enature],
    [Enature, null, Enature]
    ]);

###################################################################
# Specials:  Individual recipes, but need a sample to make these.

var poison_ivy = <biomesoplenty:plant_0:4>;
var deathbloom = <biomesoplenty:flower_0:2>;
var enderlotus = <biomesoplenty:flower_0:10>;
var eyebulb = <biomesoplenty:double_plant:2>;
var devilweed = <biomesoplenty:plant_1:7>;
var burning_blossom = <biomesoplenty:flower_0:15>;

recipes.addShaped(poison_ivy * 4, [
    [null, <mysticalagriculture:spider_essence>, null],
    [Enature, poison_ivy, Enature],
    [null, Enature, null]]
    );

recipes.addShaped(deathbloom * 3, [
	 [null, <mysticalagriculture:wither_skeleton_essence>, null],
	 [Enature, deathbloom, Enature],
	 [null, Edye, null]]
	);
	
recipes.addShaped(enderlotus * 3, [
	 [null, <mysticalagriculture:end_essence>, null],
	 [Enature, enderlotus, Enature],
	 [null, Edye, null]]
	);

# Could include Efire.
recipes.addShaped(burning_blossom * 3, [
	 [null, <mysticalagriculture:nether_essence>, null],
	 [Enature, burning_blossom, Enature],
	 [null, Edye, null]]
	);
	
recipes.addShaped(eyebulb * 4, [
         [null, <mysticalagriculture:nether_essence>, null],
	 [Enature, eyebulb, Enature],
    	 [null, Enature, null]]
	 );

recipes.addShaped(devilweed * 6, [
    [null, <mysticalagriculture:nether_essence>, null],
    [Enature, devilweed, Enature],
    [null, Enature, null]]
    );

###################################################################
# Water Lilies.  5 types: Vanilla, medium, small, tiny, flowered 
#  Vanilla has a recipe already, but is included here for symmetry.

var Water_Lily =  [
    <minecraft:waterlily>,
    <biomesoplenty:waterlily:0>,
    <biomesoplenty:waterlily:1>,
    <biomesoplenty:waterlily:2>,
    <biomesoplenty:waterlily:3>		
    ] as IItemStack[];	

# <biomesoplenty:waterlily>, Water Lily
for lily in Water_Lily {
    recipes.addShaped(lily * 8, [
	 [Enature, Enature, Enature],
	 [Enature, lily, Enature],
	 [null, Enature, null]]
	);
}

###################################################################
# Greenery:  Enature duplication, 4 nature + plant -> 6 plant.
var Plant6 = [
    <biomesoplenty:plant_0:0>,	// short grass
    <biomesoplenty:plant_0:1>,	// medium grass
    <biomesoplenty:plant_0:3>,	// sprout
    <biomesoplenty:plant_0:2>,	// bush (food, perhaps should go in specials?)
#    <biomesoplenty:plant_0:5>,	// berry bush (bush turns into this on its own)
    <biomesoplenty:plant_0:6>,	// shrub
    <biomesoplenty:plant_0:7>,	// wheat grass
    <biomesoplenty:plant_0:8>,	// damp grass
    <biomesoplenty:plant_0:9>,	// Koru (drops turnip seeds)
    <biomesoplenty:plant_0:10>,	// clover patch
    <biomesoplenty:plant_0:11>,	// leaf pile
    <biomesoplenty:plant_0:12>,	// dead leaf pile
    <biomesoplenty:plant_0:13>,	// dead grass
    <biomesoplenty:plant_0:14>,	// desert grass
    <biomesoplenty:plant_0:15>,	// desert sprouts
    <biomesoplenty:plant_1:2>,	// thorns
    <biomesoplenty:plant_1:3>,	// wild rice (food)
    <biomesoplenty:plant_1:6>,	// Tiny cactus
    <biomesoplenty:plant_1:8>,	// reed
    <biomesoplenty:plant_1:9>,	// root
] as IItemStack[];

for i, plant in Plant6 {
    recipes.addShaped(plant * 6, [
	 [null, Enature, null],
	 [Enature, plant, Enature],
	 [null, Enature, null]]
	);
}

###################################################################
# Flowers:  2 Enature+1 Edye + flower -> 3 flowers.
# (tall) Cattails and Flax go here despite their crafting potential.
# So does Rafflesia (plant_1:10)
var Flower3 = [
    <biomesoplenty:flower_0:0>,		// Clover
    <biomesoplenty:flower_0:1>,		// Swampflower
    <biomesoplenty:flower_0:3>,		// Glowflower (free glow)
    <biomesoplenty:flower_0:4>,		// Blue Hydrangea
    <biomesoplenty:flower_0:5>,		// Orange Cosmos
    <biomesoplenty:flower_0:6>,		// Pink Daffodil
    <biomesoplenty:flower_0:7>,		// Wildflower
    <biomesoplenty:flower_0:8>,		// Violet
    <biomesoplenty:flower_0:9>,		// White Anenome
    <biomesoplenty:flower_0:11>,	// Bromeliad
    <biomesoplenty:flower_0:12>,	// Wilted Lily
    <biomesoplenty:flower_0:13>,	// Pink Hibiscus
    <biomesoplenty:flower_0:14>,	// Lily of the Valley
    <biomesoplenty:flower_1:0>,		// Lavender
    <biomesoplenty:flower_1:1>,		// Goldenrod
    <biomesoplenty:flower_1:2>,		// Bluebells
    <biomesoplenty:flower_1:3>,		// Miner's Delight
    <biomesoplenty:flower_1:4>,		// Icy Iris
    <biomesoplenty:flower_1:5>,		// Rose
    
    <biomesoplenty:plant_1:4>,		// Cattail
    <biomesoplenty:plant_1:10>,		// Rafflesia
    <biomesoplenty:double_plant:0>,	// Flax
    <biomesoplenty:double_plant:1>	// Tall Cattail
] as IItemStack[];

for i, flower in Flower3 {
    recipes.addShaped(flower * 3, [
	 [null, null, null],
	 [Enature, flower, Enature],
	 [null, Edye, null]]
	);
}

###################################################################
# Coral:  2 Enature+1 Ewater + coral -> 4 coral 
# 
var Coral = [
    <biomesoplenty:coral:0>,	// Pink coral
    <biomesoplenty:coral:1>,	// Orange coral
    <biomesoplenty:coral:2>,	// Blue coral
    <biomesoplenty:coral:3>,	// Glowing coral (freebie glow1)
    <biomesoplenty:coral:4>	// Algae
] as IItemStack[];

for i, coral in Coral {
    recipes.addShaped(coral * 4, [
	 [null, null, null],
	 [Enature, coral, Enature],
	 [null, Ewater, null]]
	);
}

#######################################################################
# Mushrooms:  2 Enature+1 Edirt + shroom -> 8 mushrooms
#     or  2 Enature+1 Edirt + shroom + dye -> 4 mushrooms (cheap dye)

# Toadstool
recipes.addShaped(<biomesoplenty:mushroom:0> * 8, [
    [null, <biomesoplenty:mushroom:0>, null],
    [Enature, Edirt, Enature],
    [null, null, null]]
    );

# Portobello
recipes.addShaped(<biomesoplenty:mushroom:1> * 8, [
    [null, <biomesoplenty:mushroom:1>, null],
    [Enature, Edirt, Enature],
    [null, null, null]]
    );

# Blue Milk Cap
recipes.addShaped(<biomesoplenty:mushroom:2> * 4, [
    [null, <biomesoplenty:mushroom:2>, null],
    [Enature, Edirt, Enature],
    [null, Edye, null]]
    );

# Glowshroom (free glow)
recipes.addShaped(<biomesoplenty:mushroom:3> * 4, [
    [null, <biomesoplenty:mushroom:3>, null],
    [Enature, Edirt, Enature],
    [null, Edye, null]]
    );

# Flat Mushroom
recipes.addShaped(<biomesoplenty:mushroom:4> * 4, [
    [null, <biomesoplenty:mushroom:4>, null],
    [Enature, Edirt, Enature],
    [null, Edye, null]]
    );

# Shadow Shroom
recipes.addShaped(<biomesoplenty:mushroom:5> * 8, [
    [null, <biomesoplenty:mushroom:5>, null],
    [Enature, Edirt, Enature],
    [null, null, null]]
    );


