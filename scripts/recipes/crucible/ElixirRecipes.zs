import mods.eidolon.Crucible;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IntData;

Crucible.create("elixir_of_healing",
<item:contenttweaker:empty_vial>.withTag({
	dmc_vial_col: 16066600,
	dmc_conc_effect_a: "minecraft:instant_health",
	dmc_override: 1,
	display:{Name:'[{"text":"Elixir of Healing","italic":false,"color":"gold"}]'},
	dmc_sips: 3,
	dmc_potency: 1,
	dmc_discovered: 0
}))
.addStep([<item:contenttweaker:yeowryn_vial>, <item:contenttweaker:ordalis_vial>], (output as IItemStack, input as IItemStack[], stirs as int) => {
     return output;
 })
.addStep(2)
.register();

Crucible.create("nimblefeet_elixir",
<item:contenttweaker:empty_vial>.withTag({
	dmc_vial_col: 261339,
	dmc_conc_effect_a: "minecraft:swiftness",
	dmc_override: 1,
	display:{Name:'[{"text":"Nimblefoot Elixir","italic":false,"color":"gold"}]'},
	dmc_sips: 3,
	dmc_potency: 1,
	dmc_discovered: 0
}))
.addStep([<item:contenttweaker:aurwynn_vial>, <item:contenttweaker:ordalis_vial>, <item:contenttweaker:yunagaz_vial>], (output as IItemStack, input as IItemStack[], stirs as int) => {
     return output;
 })
.addStep(3)
.register();

var putup = Crucible.create("pot_up",
<item:contenttweaker:empty_vial>);
putup.addStep([<item:contenttweaker:empty_vial>, <item:contenttweaker:yhivren_vial>], (output as IItemStack, input as IItemStack[], stirs as int) => {
	for item in input {
        if <item:contenttweaker:empty_vial>.matches(item){
            (item.getOrCreate as MapData).put("dmc_potency", (item.dmcPotency.asNumber() as int) + 1);
			println("potency up!");
            return item;
        }
    }
	println("potency down!");
    return output;
 });
putup.addStep(3);
putup.register();