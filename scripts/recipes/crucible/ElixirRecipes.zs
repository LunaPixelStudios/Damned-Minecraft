import mods.eidolon.CrucibleRecipe;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;

new CrucibleRecipe("elixir_of_healing",
<item:contenttweaker:empty_vial>.withTag({
	dmc_vial_col: 16066600,
	dmc_conc_effect_a: "minecraft:instant_health",
	dmc_conc_effect_b: 0,
	dmc_conc_effect_c: 0,
	dmc_override: 1,
	display:{Name:'[{"text":"Elixir of Healing","italic":false,"color":"gold"}]'},
	dmc_sips: 3
}))
.addStep(<item:contenttweaker:yeowryn_vial>, <item:contenttweaker:ordalis_vial>)
.addStep(2)
.register();

new CrucibleRecipe("nimblefeet_elixir",
<item:contenttweaker:empty_vial>.withTag({
	dmc_vial_col: 261339,
	dmc_conc_effect_a: "minecraft:swiftness",
	dmc_conc_effect_b: 0,
	dmc_conc_effect_c: 0,
	dmc_override: 1,
	display:{Name:'[{"text":"Nimblefoot Elixir","italic":false,"color":"gold"}]'},
	dmc_sips: 3
}))
.addStep(<item:contenttweaker:aurwynn_vial>, <item:contenttweaker:ordalis_vial>, <item:contenttweaker:yunagaz_vial>)
.addStep(3)
.register();