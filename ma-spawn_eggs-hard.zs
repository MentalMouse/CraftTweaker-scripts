# Allow Mystical Agriculture's mob essences to recreate the mob.
# This is the harder recipes, costing lots more essence.
# Note that spawn eggs need to be specified differently when they're inputs.
# Not (yet?) done: mule, husk, stray, illagers, any BoP mobs.
#
# Note:  Most of the mobs lacking species chunks require one of three
# gray intermediate eggs, the "Critter", "Beast" or "Humanoid" spawn eggs.
# These can be distinguished by their names (hovertext).
#
# Updated May-23-2017:  Shulkers, silverfish, endermite, bat, donkey
# 	  		I think I'm pretty much done here.
# 	  May-24-2017:  Nope...  Yet another fix to the crafting eggs.

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
# Base Eggs:  Some monsters don't have their own chunk/essence, so we
# start with a base egg and mix in some extras.
###########################################################################

var critter_egg_output = <minecraft:spawn_egg>
    	.withTag({display: {Name: "Critter Crafting Egg"},
		  EntityTag: {id: "craftable:critter"} } );
var critter_egg_input = <minecraft:spawn_egg>
    	.withTag({EntityTag: {id: "craftable:critter"},
	          display: {Name: "Critter Crafting Egg"} } )
    	.onlyWithTag({EntityTag: {id: "craftable:critter"}}) ;

var beast_egg_output = <minecraft:spawn_egg>
    	.withTag({EntityTag: {id: "craftable:beast"},
		  display: {Name: "Beast Crafting Egg"}});
var beast_egg_input = <minecraft:spawn_egg>
    	.withTag({EntityTag: {id: "craftable:beast"},
		  display: {Name: "Beast Crafting Egg"}})
    	.onlyWithTag({EntityTag: {id: "craftable:beast"}}) ;

var person_egg_output = <minecraft:spawn_egg>
	.withTag({EntityTag: {id: "craftable:person"},
		  display: {Name: "Humanoid Crafting Egg"}});
var person_egg_input = <minecraft:spawn_egg>
	.withTag({EntityTag: {id: "craftable:person"},
		  display: {Name: "Humanoid Crafting Egg"}})
    	.onlyWithTag({EntityTag: {id: "craftable:person"}}) ;

# A base egg for various small creatures.
recipes.addShaped(critter_egg_output, [
    [<mysticalagriculture:tier1_mob_chunk>,
     inferium,
     <mysticalagriculture:tier1_mob_chunk>],
    [inferium, <minecraft:egg>, inferium],
    [<mysticalagriculture:tier1_mob_chunk>,
     inferium,
     <mysticalagriculture:tier1_mob_chunk> ]
]);

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

##########################################################################
# Critters
##########################################################################

# Squid -- cheap!  (Should using ore:dyeBlack be allowed?)
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:squid"}}), [
    [null, <minecraft:dye:0>, null],
    [<minecraft:dye:0>, critter_egg_input, <minecraft:dye:0>],
    [null, <minecraft:water_bucket>, null]
]);

# Silverfish.  No, making silverfish isn't nasty.
# Making Monster Eggs, that would be nasty.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:silverfish"}}), [
    [null, <minecraft:stonebrick:*>, null],
    [<minecraft:stonebrick:*>, critter_egg_input, <minecraft:stonebrick:*>],
    [null, <minecraft:stonebrick:*>, null]
]);

# And Endermites too!
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:endermite"}}), [
    [null, <minecraft:ender_pearl>, null],
    [<minecraft:ender_pearl>, critter_egg_input, <minecraft:ender_pearl>],
    [null, <minecraft:ender_pearl>, null]
]);

# Pumpkin pie is a reference to the Pet Bats mod, which uses it to tame bats.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:bat"}}), [
    [null, <minecraft:pumpkin_pie>, null],
    [<minecraft:pumpkin_pie>, critter_egg_input, <minecraft:pumpkin_pie>],
    [null, <minecraft:pumpkin_pie>, null]
]);

/*
# Monster Egg recipes, for nasty people.
# Stone, Cobble, Stone Brick, Mossy Stone Brick, Cracked Stone Brick, Chiseled.
var SFstone = [
    <minecraft:stone>,
    <minecraft:cobblestone>,
    <minecraft:stonebrick:0>,
    <minecraft:stonebrick:1>,
    <minecraft:stonebrick:2>,
    <minecraft:stonebrick:3>
    ] as IIngredient[];
    
var SFMegg = [
    <minecraft:monster_egg:0>,
    <minecraft:monster_egg:1>,
    <minecraft:monster_egg:2>,
    <minecraft:monster_egg:3>,
    <minecraft:monster_egg:4>,
    <minecraft:monster_egg:5>
    ] as IItemStack[];

# Plenty of room for tier essence if you like.
for i,stone in SFstone {
    recipes.addShaped(SFMegg[i], [
        [null, stone, null],
        [null, <minecraft:spawn_egg>
	       .withTag({EntityTag: {id: "minecraft:silverfish"}})
	       .onlyWithTag({EntityTag:{id: "minecraft:silverfish"}}),
         null],
        [null, stone, null]
    ]);
}
# Ain't I a stinker?

*/


##########################################################################
# Main Mobs
##########################################################################



# Cave Spider:  More spidery, with stone for the caves.
#  Maybe add extra intermedium?
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:cave_spider"}}), [
    [null, <mysticalagriculture:spider_essence>, null],
    [<mysticalagriculture:stone_essence>,
    <minecraft:spawn_egg>
        .withTag({EntityTag: {id: "minecraft:spider"}})
	.onlyWithTag({EntityTag: {id: "minecraft:spider"}}),
     <mysticalagriculture:stone_essence>],
    [null,
     <mysticalagriculture:spider_essence>,
     null]
]);

# Zombie Pigman -- using skelly egg for tier, plus pig chunks, gold and nether.
# 1 gold essence equals a half ingot, with the other essences this
#   should be enough to prevent "PROFIT!!!"
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
        {id: "minecraft:zombie_pigman"}}), [
    [<mysticalagriculture:gold_essence>,
     <mysticalagriculture:pig_chunk>,
     intermedium],
    [<mysticalagriculture:pig_chunk>,
    <minecraft:spawn_egg>
        .withTag({EntityTag: {id: "minecraft:skeleton"}})
	.onlyWithTag({EntityTag: {id: "minecraft:skeleton"}}),
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
    <minecraft:spawn_egg>
	.withTag({EntityTag: {id: "minecraft:slime"}})
	.onlyWithTag({EntityTag: {id: "minecraft:slime"}}),
     intermedium],
    [<mysticalagriculture:nether_essence>,
     intermedium,
     <mysticalagriculture:nether_essence>]
]);

/*
# Mooshroom -- cow plus mushrooms and Tier 3 essence
# Default disabled for rarity
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:mooshroom"}}), [
	 [<minecraft:red_mushroom>, intermedium, <minecraft:brown_mushroom>],
        [intermedium,
         <minecraft:spawn_egg>
		.withTag({EntityTag: {id: "minecraft:cow"}})
		.onlyWithTag({EntityTag: {id: "minecraft:cow"}}),
         intermedium],
        [<minecraft:red_mushroom>, intermedium, <minecraft:brown_mushroom>]
]);
*/

# Polar bear.  No boost, because they're rare but useless
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:polar_bear"}}), [
    [null, <minecraft:fish>, null],
    [<minecraft:ice>, beast_egg_input, <minecraft:ice>],
    [null, <minecraft:fish>, null]
]);


/*
# Elder guardian.  Tier 5 upgrade to guardian, because of mining fatigue
# Default disabled, for same reason
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:elder_guardian"}}), [
    [supremium, <mysticalagriculture:tier5_mob_chunk>, supremium],
    [<mysticalagriculture:tier5_mob_chunk>,
     <minecraft:spawn_egg>
	.withTag({EntityTag: {id: "minecraft:guardian"}})
	.onlyWithTag({EntityTag: {id: "minecraft:guardian"}}),
     <mysticalagriculture:tier5_mob_chunk>],
    [supremium, <mysticalagriculture:tier5_mob_chunk>, supremium]
]);
*/


#######################################################################
# "People":  Villager and derivatives, and one exotic mob.
#  Who knows what minds lurk within those purple boxes?
#######################################################################

var potionH =<minecraft:splash_potion>.withTag({Potion:
   "minecraft:strong_harming"});
var emerald = <minecraft:emerald>;


# Witch.  Person egg, Splash potion of harming, drops, emeralds
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:witch"}}), [
    [potionH, <minecraft:redstone>, emerald],
    [<minecraft:sugar>,
     person_egg_input,
     <minecraft:spider_eye>],
    [emerald, <minecraft:glowstone_dust>, potionH]
]);

# Villager.  person egg, emeralds, trades.
# Yes, this recipe is meant to be a PITA.  ;-)
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:villager"}}), [
    [emerald,
     <minecraft:bread>,
     emerald],
    [<minecraft:bookshelf>,
     person_egg_input,
     <minecraft:cooked_porkchop>],
    [emerald,
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


# Shulker.  Person egg, *two* shulker shells, purpur, End essence.
# This should probably be disabled if you can craft the shells in your game.
# Unless you like that sort of thing, and are happy with the tier expenses.

var Eend = <mysticalagriculture:end_essence>;

recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:shulker"}}), [
    [Eend, <minecraft:shulker_shell>, Eend],
    [<minecraft:purpur_block>, person_egg_input,<minecraft:purpur_block>],
    [Eend, <minecraft:shulker_shell>, Eend]
]);

/*
# A potential recipe for shulker shells.  Default disabled.
#  You could also replace the last two Eends with tier essence.

recipes.addShaped(<minecraft:shulker_shell>, [
    [Eend, Eend, Eend],
    [Eend, <minecraft:end_rod>, Eend],
    [Eend, superium, Eend]
]);
*/

#######################################################################
# Tameables:  Most are default-disabled.  They should spawn untamed.
#######################################################################
/*
# Wolf
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:wolf"}}), [
    [null, <minecraft:name_tag>, null],
    [<minecraft:bone>, beast_egg_input, <minecraft:bone>],
    [null, <minecraft:name_tag>, null]
]);
*/

/*
# Ocelot
# I have something in mind here, but I haven't figured out how to do it yet.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:ocelot"}}), [
    [null, <minecraft:name_tag>, null],
    [<minecraft:fish:0>, beast_egg_input, <minecraft:fish:1>],
    [null, <ore:bed>, null]
]);
*/

/*
# Horse:  It was saddles or golden apples, and tier 5 of MA lets you fly.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:horse"}}), [
    [null, <minecraft:saddle>, null],
    [<minecraft:hay_block>, beast_egg_input, <minecraft:hay_block>],
    [null, <minecraft:hay_block>, null]
]);
*/

/*
# Donkey:  Because some times you just feel like an ass.
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:donkey"}}), [
    [null, <minecraft:saddle>, null],
    [<minecraft:hay_block>, beast_egg_input, <minecraft:hay_block>],
    [null, <ore:chestWood>, null]
]);
*/


# Zombie and Skeleton Horses:  Adding wither essence to make it undead.
# Not default disabled... if you've got a horse spawn egg and the other
#  essences, go ahead and trade in your tameable, breedable mount, for an
#  untameable, unbreedable monster.

recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:zombie_horse"}}), [
    [<mysticalagriculture:wither_skeleton_essence>,
     <mysticalagriculture:zombie_essence>,
     null],
    [<mysticalagriculture:zombie_essence>,
     <minecraft:spawn_egg>
     	.withTag({EntityTag: {id: "minecraft:horse"}})
	.onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
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
     <minecraft:spawn_egg>
	     .withTag({EntityTag: {id: "minecraft:horse"}})
	     .onlyWithTag({EntityTag: {id: "minecraft:horse"}}),
     <mysticalagriculture:skeleton_essence>],
    [null,
     <mysticalagriculture:skeleton_essence>,
     <mysticalagriculture:wither_skeleton_essence>]
]);


/*
# Llama
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag:
	{id: "minecraft:llama"}}), [
    [null, <minecraft:carpet:*>, null],
    [<minecraft:lead>, beast_egg_input, <minecraft:lead>],
    [null, <minecraft:carpet:*>, null]
]);
*/