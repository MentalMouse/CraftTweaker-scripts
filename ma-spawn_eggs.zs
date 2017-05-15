# Allow Mystical Agriculture's mob essences to recreate the mob.
# Updated 2017-05-13:  Eggs for cave spiders, zombie pigmen, magma cubes, witch
#                      Optionally, tameables, mooshroom, witch

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

var Xium = [
      <mysticalagriculture:prudentium_essence>,
      <mysticalagriculture:prudentium_essence>,
      <mysticalagriculture:prudentium_essence>,
      <mysticalagriculture:prudentium_essence>,

      <mysticalagriculture:inferium_essence>,
      <mysticalagriculture:prudentium_essence>,

      <mysticalagriculture:intermedium_essence>,
      <mysticalagriculture:intermedium_essence>,
      <mysticalagriculture:intermedium_essence>,
      <mysticalagriculture:intermedium_essence>,
      <mysticalagriculture:intermedium_essence>,

      <mysticalagriculture:superium_essence>,
      <mysticalagriculture:superium_essence>,
      <mysticalagriculture:superium_essence>,
      <mysticalagriculture:superium_essence>,
      <mysticalagriculture:supremium_essence>
    ] as IIngredient[];

######################################################################
#  ALTERNATE PATTERNS
######################################################################
# Make it really tough, like making a seed
#for i, egg in Mob_egg {
#    recipes.addShaped(egg, [
#        [Mob_chunk[i], Xium[i], Mob_chunk[i]],
#	[Xium[i], <minecraft:egg>, Xium[i]],
#        [Mob_chunk[i], Xium[i], Mob_chunk[i]]
#	]);
#}

# The easiest way -- spawn away!  Evem make it just 4 if you like.
#for i, egg in Mob_egg {
#    recipes.addShaped(egg, [
#        [Mob_essence[i], Mob_essence[i], Mob_essence[i]],
#	[Mob_essence[i], <minecraft:egg>, Mob_essence[i]],
#	[Mob_essence[i], Mob_essence[i], Mob_essence[i]]
#	]);
#}

######################################################################
#  ACTIVE PATTERNS
######################################################################
# A middle ground:  Still limited by mob chunks, but doesn't need
#  quite as much essence for spawning powerful mobs.  Also, this pattern
# can be adapted for chunkless mobs, below.
for i, egg in Mob_egg {
    recipes.addShaped(egg, [
        [null, Mob_chunk[i], null],
	[Mob_chunk[i], <minecraft:egg>, Mob_chunk[i]],
	[null, Mob_chunk[i], null]
	]);
}

###########################################################################
# Some monsters don't have their own chunk/essence, so mix in some extras.
# Some of these are default-disabled for gameplay or balance.
###########################################################################

# Squid
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:squid"}}), [
        [<minecraft:dye:0>,
	 <mysticalagriculture:tier1_mob_chunk>,
	 <minecraft:dye:0>],
	[<mysticalagriculture:tier1_mob_chunk>,
	 <minecraft:egg>,
	 <mysticalagriculture:tier1_mob_chunk>],
	[<minecraft:water_bucket>,
	 <mysticalagriculture:tier1_mob_chunk>,
	 <minecraft:water_bucket>]
	]);


# Cave Spider:  More spidery, with stone for the caves
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:cave_spider"}}), [
        [<mysticalagriculture:spider_essence>,
	 <mysticalagriculture:spider_chunk>,
	 <mysticalagriculture:spider_essence>],
	[<mysticalagriculture:spider_chunk>, <minecraft:egg>, <mysticalagriculture:spider_chunk>],
        [<mysticalagriculture:stone_essence>,
	 <mysticalagriculture:spider_chunk>,
	 <mysticalagriculture:stone_essence>]
	]);

# Zombie Pigman -- using skelly chunks for tier, pig chunks, gold and nether
# 2 gold essence equals one ingot, which should be enough to prevent "PROFIT!!!"
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:zombie_pigman"}}), [
        [<mysticalagriculture:gold_essence>,
	 <mysticalagriculture:pig_chunk>,
	 <mysticalagriculture:gold_essence>],
	[<mysticalagriculture:skeleton_chunk>,
	 <minecraft:egg>,
	 <mysticalagriculture:skeleton_chunk>],
	[<mysticalagriculture:nether_essence>,
	 <mysticalagriculture:pig_chunk>,
	 <mysticalagriculture:nether_essence>]
	]);

# Magma Cube -- nether and fire, might warrant a tier boost
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:magma_cube"}}), [
        [<mysticalagriculture:fire_essence>,
	 <mysticalagriculture:slime_chunk>,
	 <mysticalagriculture:fire_essence>],
	[<mysticalagriculture:slime_chunk>,
	 <minecraft:egg>,
	 <mysticalagriculture:slime_chunk>],
	[<mysticalagriculture:nether_essence>,
	 <mysticalagriculture:slime_chunk>,
	 <mysticalagriculture:nether_essence>]
	]);

# Mooshroom -- cow plus dirt and nature.
# Default disabled for rarity, may warrant tier 3 essence.
#  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:mooshroom"}}), [
#        [<mysticalagriculture:nature_essence>,
#	 <mysticalagriculture:cow_chunk>,
#	 <mysticalagriculture:nature_essence>],
#	[<mysticalagriculture:cow_chunk>,
#	 <minecraft:egg>,
#	 <mysticalagriculture:cow_chunk>],
#	[<mysticalagriculture:dirt_essence>,
#	 <mysticalagriculture:cow_chunk>,
#	 <mysticalagriculture:dirt_essence>]
#	]);

# Polar bear.  Generic chunks; tier 3 because they're rare but useless
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:polar_bear"}}), [
       [<minecraft:fish>,
	 <mysticalagriculture:tier3_mob_chunk>,
	 <minecraft:ice>],
	[<mysticalagriculture:tier3_mob_chunk>,
	 <minecraft:egg>,
	 <mysticalagriculture:tier3_mob_chunk>],
	[<minecraft:ice>,
	 <mysticalagriculture:tier3_mob_chunk>,
	 <minecraft:fish>]
	]);

# Witch.  Generic chunks, tier 4.  Splash potion of harming, emeralds
  var potionH=<minecraft:splash_potion>.withTag({Potion:
   "minecraft:strong_harming"});
  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:witch"}}), [
        [potionH,
	 <mysticalagriculture:tier4_mob_chunk>,
	 <minecraft:emerald>],
	[<mysticalagriculture:tier4_mob_chunk>,
	 <minecraft:egg>,
	 <mysticalagriculture:tier4_mob_chunk>],
	[<minecraft:emerald>,
	 <mysticalagriculture:tier4_mob_chunk>,
	 potionH]
	]);

# Elder guardian.  Tier 5 upgrade to guardian, because of mining fatigue
# Default disabled, for same reason

#var supremium = <mysticalagriculture:supremium_essence>;
#recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:elder_guardian"}}), [
#        [supremium, <mysticalagriculture:tier5_mob_chunk>, supremium],
#	[<mysticalagriculture:tier5_mob_chunk>,
#	 <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:guardian"}}),
#	 <mysticalagriculture:tier5_mob_chunk>],
#	[supremium, <mysticalagriculture:tier5_mob_chunk>, supremium]
#	]);


#######################################################################
# Tameables:  These don't have chunks, so they use generic chunks
# and/or tier essence.  I've somewhat arbitrarily made them tier 3.
# All are default-disabled.  They should spawn untamed.
#######################################################################

# Wolf
#  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:wolf"}}), [
#        [<mysticalagriculture:intermedium_essence>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:name_tag>],
#	[<mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:egg>,
#	 <mysticalagriculture:tier3_mob_chunk>],
#	[<minecraft:name_tag>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <mysticalagriculture:intermedium_essence>]
#	]);

# Ocelot
#  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:ocelot"}}), [
#        [<mysticalagriculture:intermedium_essence>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:fish>],
#	[<mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:egg>,
#	 <mysticalagriculture:tier3_mob_chunk>],
#	[<minecraft:fish>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <mysticalagriculture:intermedium_essence>]
#	]);

# Horse:  It was saddles or golden apples, and tier 5 of MA lets you fly.
#  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:horse"}}), [
#        [<mysticalagriculture:intermedium_essence>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:saddle>],
#	[<mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:egg>,
#	 <mysticalagriculture:tier3_mob_chunk>],
#	[<minecraft:saddle>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <mysticalagriculture:intermedium_essence>]
#	]);

# Zombie and Skeleton Horses:  Adding wither essence to make it undead.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:zombie_horse"}}), [
        [<mysticalagriculture:wither_skeleton_essence>,
	 <mysticalagriculture:zombie_essence>,
	 null],
	[<mysticalagriculture:zombie_essence>,
	 <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
	 <mysticalagriculture:zombie_essence>],
	[null,
	 <mysticalagriculture:zombie_essence>,
	 <mysticalagriculture:wither_skeleton_essence>]
	]);

recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:skeleton_horse"}}), [
        [<mysticalagriculture:wither_skeleton_essence>,
	 <mysticalagriculture:skeleton_essence>,
	 null],
	[<mysticalagriculture:skeleton_essence>,
	 <minecraft:spawn_egg>.onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
	 <mysticalagriculture:skeleton_essence>],
	[null,
	 <mysticalagriculture:skeleton_essence>,
	 <mysticalagriculture:wither_skeleton_essence>]
	]);

# Llama
#  recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
#	{id: "minecraft:llama"}}), [
#        [<mysticalagriculture:intermedium_essence>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:carpet>],
#	[<mysticalagriculture:tier3_mob_chunk>,
#	 <minecraft:egg>,
#	 <mysticalagriculture:tier3_mob_chunk>],
#	[<minecraft:carpet>,
#	 <mysticalagriculture:tier3_mob_chunk>,
#	 <mysticalagriculture:intermedium_essence>]
#	]);
