# Allow Mystical Agriculture's mob essences to recreate the mob.
# This is the harder recipes, costing lots more essence.
# Note that spawn eggs need to be specified differently when they're inputs.
# Updated 2017-05-17
# Not (yet?) done: donkey, mule, husk, stray, silverfish, endermites,
#      	     	   shulkers, illagers, bats
#
#  Note:  Most of the mobs lacking species chunks require one of two gray
#  intermediate eggs, the "Beast" or "Humanoid" spawn eggs.
# Currently, JEI doesn't show the identifying names in the recipes using them.
#  However, both recipes will show up if you look at the recipe for any
#  spawn egg, and the names do show in output.

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

var Mob_egg =  [
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),

    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}}),

    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:slime"}}),

    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:skeleton"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:creeper"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:spider"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:guardian"}}),
    
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:blaze"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:ghast"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:enderman"}}),

    <minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:wither_skeleton"}})
    ] as IItemStack[];

var Mob_essence = [
    <mysticalagriculture:pig_essence>,
    <mysticalagriculture:cow_essence>, 
    <mysticalagriculture:chicken_essence>,
    <mysticalagriculture:sheep_essence>,

    <mysticalagriculture:zombie_essence>,
    <mysticalagriculture:slime_essence>,
    <mysticalagriculture:skeleton_essence>,
    <mysticalagriculture:creeper_essence>, 
    <mysticalagriculture:spider_essence>,
    <mysticalagriculture:rabbit_essence>, 
    <mysticalagriculture:guardian_essence>,

    <mysticalagriculture:blaze_essence>, 
    <mysticalagriculture:ghast_essence>,
    <mysticalagriculture:enderman_essence>, 
    <mysticalagriculture:wither_skeleton_essence>,
    ] as IIngredient[];


var Mob_chunk = [
    <mysticalagriculture:pig_chunk>,
    <mysticalagriculture:cow_chunk>, 
    <mysticalagriculture:chicken_chunk>,
    <mysticalagriculture:sheep_chunk>,

    <mysticalagriculture:zombie_chunk>,
    <mysticalagriculture:slime_chunk>,
    <mysticalagriculture:skeleton_chunk>,
    <mysticalagriculture:creeper_chunk>, 
    <mysticalagriculture:spider_chunk>,
    <mysticalagriculture:rabbit_chunk>, 
    <mysticalagriculture:guardian_chunk>,

    <mysticalagriculture:blaze_chunk>, 
    <mysticalagriculture:ghast_chunk>,
    <mysticalagriculture:enderman_chunk>, 
    <mysticalagriculture:wither_skeleton_chunk>,
    ] as IIngredient[];

var inferium = <mysticalagriculture:inferium_essence>;
var prudentium = <mysticalagriculture:prudentium_essence>;
var intermedium = <mysticalagriculture:intermedium_essence>;
var superium = <mysticalagriculture:superium_essence>;
var supremium = <mysticalagriculture:supremium_essence>;

var Xium = [
      prudentium,
      prudentium,
      prudentium,
      prudentium,

      inferium,
      prudentium,

      intermedium,
      intermedium,
      intermedium,
      intermedium,
      intermedium,

      superium,
      superium,
      superium,
      superium,
      supremium
    ] as IIngredient[];

######################################################################
#  HARD PATTERN
######################################################################
# Need tier essence, like making a seed.
# Chunkless mobs mostly need intermediate eggs, recipes below.
for i, egg in Mob_egg {
    recipes.addShaped(egg, [
        [Mob_chunk[i], Xium[i], Mob_chunk[i]],
	[Xium[i], <minecraft:egg>, Xium[i]],
        [Mob_chunk[i], Xium[i], Mob_chunk[i]]
	]);
}

###########################################################################
# Some monsters don't have their own chunk/essence, so mix in some extras.
# Some of these are default-disabled for gameplay or balance.
###########################################################################
var potionH =<minecraft:splash_potion>.withTag({Potion:
   "minecraft:strong_harming"});
var emerald = <minecraft:emerald>;

var beast_egg_output = <minecraft:spawn_egg>
    	.withTag({EntityTag: {id: "craftable:beast"}})
        .withTag({display: {Name: "Beast Crafting Egg"}});
var person_egg_output = <minecraft:spawn_egg>
	.withTag({EntityTag: {id: "craftable:person"}})
        .withTag({display: {Name: "Humanoid Crafting Egg"}});
var beast_egg_input = <minecraft:spawn_egg>
    	.onlyWithTag({EntityTag: {id: "craftable:beast"}})
        .onlyWithTag({display: {Name: "Beast Crafting Egg"}});
var person_egg_input = <minecraft:spawn_egg>
    	.onlyWithTag({EntityTag: {id: "craftable:person"}})
        .onlyWithTag({display: {Name: "Humanoid Crafting Egg"}});

recipes.addShaped(beast_egg_output, [
    [<mysticalagriculture:tier3_mob_chunk>,
     intermedium,
     <mysticalagriculture:tier3_mob_chunk>],
    [intermedium, <minecraft:egg>, intermedium],
    [<mysticalagriculture:tier3_mob_chunk>,
     intermedium,
     <mysticalagriculture:tier3_mob_chunk> ]
]);

recipes.addShaped(person_egg_output, [
    [<mysticalagriculture:tier4_mob_chunk>,
     superium,
      <mysticalagriculture:tier4_mob_chunk>],
    [superium, <minecraft:egg>, superium],
    [<mysticalagriculture:tier4_mob_chunk>,
     superium,
      <mysticalagriculture:tier4_mob_chunk> ]
]);

# Squid -- cheap!
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:squid"}}), [
    [<minecraft:dye:0>,
     <mysticalagriculture:tier1_mob_chunk>,
     inferium],
    [<mysticalagriculture:tier1_mob_chunk>,
     <minecraft:egg>,
     <mysticalagriculture:tier1_mob_chunk>],
    [inferium,
     <mysticalagriculture:tier1_mob_chunk>,
     <minecraft:water_bucket>]
]);

# Cave Spider:  More spidery, with stone for the caves.
#  Maybe add extra intermedium?
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:cave_spider"}}), [
    [null, <mysticalagriculture:spider_essence>, null],
    [<mysticalagriculture:stone_essence>,
    <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:spider"}}),
     <mysticalagriculture:stone_essence>],
    [null,
     <mysticalagriculture:spider_essence>,
     null]
]);

# Zombie Pigman -- using skelly egg for tier, plus pig chunks, gold and nether
# 1 gold essence equals a half ingot, with the other essences this
#   should be enough to prevent "PROFIT!!!"
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:zombie_pigman"}}), [
    [<mysticalagriculture:gold_essence>,
     <mysticalagriculture:pig_chunk>,
     intermedium],
    [<mysticalagriculture:pig_chunk>,
    <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:skeleton"}}),
     <mysticalagriculture:pig_chunk>],
    [intermedium,
     <mysticalagriculture:pig_chunk>,
     <mysticalagriculture:nether_essence>]
]);

# Magma Cube -- nether and fire, and a tier boost
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:magma_cube"}}), [
    [<mysticalagriculture:fire_essence>,
     intermedium,
     <mysticalagriculture:fire_essence>],
    [intermedium,
    <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:slime"}}),
     intermedium],
    [<mysticalagriculture:nether_essence>,
     intermedium,
     <mysticalagriculture:nether_essence>]
]);

# Mooshroom -- cow plus mushrooms and Tier 3 essence
# Default disabled for rarity
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:mooshroom"}}), [
#	 [<minecraft:red_mushroom>, intermedium, <minecraft:brown_mushroom>],
#        [intermedium,
#         <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:cow"}}),
#         intermedium],
#        [<minecraft:red_mushroom>, intermedium, <minecraft:brown_mushroom>]
#]);

# Polar bear.  No boost, because they're rare but useless
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:polar_bear"}}), [
    [null, <minecraft:fish>, null],
    [<minecraft:ice>, beast_egg_input, <minecraft:ice>],
    [null, <minecraft:fish>, null]
]);

# Witch.  Person egg, Splash potion of harming, drops, emeralds
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:witch"}}), [
    [potionH, <minecraft:redstone>, emerald],
    [<minecraft:sugar>,
     person_egg_input,
     <minecraft:spider_eye>],
    [emerald, <minecraft:glowstone_dust>, potionH]
]);

# Villager.  person egg, emeralds, trades
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:villager"}}), [
    [emerald,
     <minecraft:bread>,
     emerald],
    [<minecraft:bookshelf>,
     person_egg_input,
     <minecraft:cooked_porkchop>],
    [<minecraft:emerald>,
     <minecraft:iron_shovel>,
     emerald]
]);

# Zombie Villager. person egg, zombie chunks, emeralds.  Yeah, regular zombie
# eggs can produce a villager zombie -- at 10% chance.  Certainty is expensive.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:zombie_villager"}}), [
    [emerald, <mysticalagriculture:zombie_chunk>, emerald],
    [<mysticalagriculture:zombie_chunk>,
     person_egg_input,
     <mysticalagriculture:zombie_chunk>],
    [<minecraft:emerald>, <mysticalagriculture:zombie_chunk>, emerald]
]);

# Elder guardian.  Tier 5 upgrade to guardian, because of mining fatigue
# Default disabled, for same reason

#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:elder_guardian"}}), [
#    [supremium, <mysticalagriculture:tier5_mob_chunk>, supremium],
#    [<mysticalagriculture:tier5_mob_chunk>,
#     <minecraft:spawn_egg>.onlyWithTag({EntityTag:
#	{id: "minecraft:guardian"}}),
#     <mysticalagriculture:tier5_mob_chunk>],
#    [supremium, <mysticalagriculture:tier5_mob_chunk>, supremium]
#]);


#######################################################################
# Tameables:   I've somewhat arbitrarily made them tier 3.
# All are default-disabled.  They should spawn untamed.
#######################################################################

# Wolf
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:wolf"}}), [
#    [null, <minecraft:name_tag>, null],
#    [<minecraft:bone>, beast_egg_input, <minecraft:bone>],
#    [null, <minecraft:name_tag>, null]
#]);

# Ocelot
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:ocelot"}}), [
#    [null, <minecraft:fish:0>, null],
#    [<minecraft:fish:1>, beast_egg_input, <minecraft:fish:2>],
#    [null, <ore:bed>, null]
#]);

# Horse:  It was saddles or golden apples, and tier 5 of MA lets you fly.
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:horse"}}), [
#    [null, <minecraft:saddle>, null],
#    [<minecraft:hay_block>, beast_egg_input, <minecraft:hay_block>],
#    [null, <minecraft:saddle>, null]
#]);

# Zombie and Skeleton Horses:  Adding wither essence to make it undead.

#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:zombie_horse"}}), [
#    [<mysticalagriculture:wither_skeleton_essence>,
#     <mysticalagriculture:zombie_essence>,
#     null],
#    [<mysticalagriculture:zombie_essence>,
#     <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
#     <mysticalagriculture:zombie_essence>],
#    [null,
#     <mysticalagriculture:zombie_essence>,
#     <mysticalagriculture:wither_skeleton_essence>]
#]);

#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:skeleton_horse"}}), [
#    [<mysticalagriculture:wither_skeleton_essence>,
#     <mysticalagriculture:skeleton_essence>,
#     null],
#    [<mysticalagriculture:skeleton_essence>,
#     <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
#     <mysticalagriculture:skeleton_essence>],
#    [null,
#     <mysticalagriculture:skeleton_essence>,
#     <mysticalagriculture:wither_skeleton_essence>]
#]);

# Llama
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:llama"}}), [
#    [null, <minecraft:carpet:*>, null],
#    [<minecraft:lead>, beast_egg_input, <minecraft:lead>],
#    [null, <minecraft:carpet:*>, null]
#]);
