# This script fills in the recipes for Mystical Agriculture's Dye Essence.
# Since we don't want the cheap dye essence to produce valuables,
# Ee use the Oredict to look for "generic" dyes registered by some other
# mod such as Biomes O'Plenty.  Naturally, such dyes must exist to get recipes!

var Edye = <mysticalagriculture:dye_essence>;

val green = <ore:dyeGreen>;
val brown = <ore:dyeBrown>;
val blue = <ore:dyeBlue>;
val white = <ore:dyeWhite>;

# If any of the mod dyes are also "precious", remove them in this section.
green.remove(<minecraft:dye:2>);
brown.remove(<minecraft:dye:3>);
blue.remove(<minecraft:dye:4>);
white.remove(<minecraft:dye:15>);


for Green in green.items {
    recipes.addShaped(Green, [
        [Edye, null, null],
    	[null, Edye, Edye],
    	[null, null, null]
    ]);
}

for Brown in brown.items {
    recipes.addShaped(Brown, [
        [null, null, Edye],
	[Edye, Edye, null],
	[null, null, null]
    ]);
}

for Blue in blue.items {
    recipes.addShaped(Blue, [
        [null, null, null],
	[null, Edye, Edye],
    	[Edye, null, null]
    ]);
}

for White in white.items {
    recipes.addShaped(White, [
        [null, null, null],
    	[Edye, Edye, null],
    	[null, null, Edye]
    ]);
}