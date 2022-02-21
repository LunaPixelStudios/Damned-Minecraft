import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.recipe.RecipeFunctionArray;

// Mundane Vial
 <recipetype:farmersdelight:cooking>.addRecipe("mundane_vial",
    <item:contenttweaker:mundane_vial>,
    [<tag:items:farmersrespite:tea_leaves>],
    <item:minecraft:potion>.withTag({
    Potion:"water"
    }),
    10,
    400
 );

// Almanis Vial
<recipetype:farmersdelight:cooking>.addRecipe("almanis",
	<item:contenttweaker:almanis_vial>,
	[<item:biomesoplenty:orange_cosmos>, <item:forbidden_arcanus:mundabitur_dust>],
	<item:contenttweaker:mundane_vial>,
	10,
	400
);

// Aurwynn Vial
<recipetype:farmersdelight:cooking>.addRecipe("aurwynn",
	<item:contenttweaker:aurwynn_vial>,
	[<item:biomesoplenty:wildflower>, <item:forbidden_arcanus:mundabitur_dust>],
	<item:contenttweaker:mundane_vial>,
	10,
	400
);

// Cyaris Vial

<recipetype:farmersdelight:cooking>.addRecipe("cyaris",
	<item:contenttweaker:cyaris_vial>,
	[<item:minecraft:twisting_vines>, <item:minecraft:crimson_roots>, <item:forbidden_arcanus:mundabitur_dust>],
	<item:contenttweaker:mundane_vial>,
	10,
	400
);


/*var brewPotRecipe = mods.custommachinery.CMRecipeBuilder.create("custommachinery:brewing_pot", 200);
brewPotRecipe.requireFluid(<fluid:minecraft:water> * 100);
brewPotRecipe.consumeDropOnStart(<item:biomesoplenty:orange_cosmos>, 1, 0);
brewPotRecipe.consumeDropOnStart(<item:forbidden_arcanus:mundabitur_dust>, 1, 0);
brewPotRecipe.consumeDropOnEnd(<item:contenttweaker:empty_vial>.withTag({
	dmc_vial_col: 20735,
	dmc_conc_effect_a: 0,
	dmc_conc_effect_b: 0,
	dmc_conc_effect_c: 0,
	dmc_override: 1,
	display:{Name:'[{"text":"Mundane vial","italic":false}]'}
}), 1, 0);
brewPotRecipe.dropItemOnEnd(<item:contenttweaker:almanis_vial>);
brewPotRecipe.produceItem(<item:minecraft:stone>);
brewPotRecipe.build("almanis_vial");*/