
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.util.Random;
import crafttweaker.api.item.Rarity;
import crafttweaker.api.recipe.RecipeFunctionArray;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.util.text.MCTextComponent;
import mods.farmersdelight.CuttingBoard;

// Removal

craftingTable.removeRecipe(<item:minecraft:end_crystal>);

// Addition

craftingTable.addShapeless( "advdungeonkey",
    <item:dimdungeons:item_portal_key>,
    [<item:minecraft:nether_star>],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
        if inputs[0].displayName == "Blank Portal Key" {
            return <item:dimdungeons:item_portal_key>.withDisplayName(("Advanced Dungeon Key" as MCTextComponent).setStyle(new MCStyle().setItalic(false)));
        }
        return usualOut.setDisplayName("Advanced Dungeon Key");
    });
<recipetype:farmersdelight:cooking>.addRecipe("cooking_pot_test",
	<item:contenttweaker:yeowryn_vial>,
    [<item:farmersrespite:rose_hips>, <item:hexerei:sage>, <item:hexerei:yellow_dock_bush>],
    <item:contenttweaker:mundane_vial>,
    10,
    400,
    (usualOut as IItemStack, inputs as IItemStack[], container as IItemStack) => {
        if container.matches(<item:contenttweaker:empty_vial>) {
            return <item:contenttweaker:mundane_vial>;
        } else {
            return usualOut;
        }
    }

 );

smithing.addRecipe("iron_cluster", <item:minecraft:iron_ingot>, <item:geolosys:iron_cluster>, <item:geolosys:iron_cluster>);
//CuttingBoard.addRecipe("testipe", <item:biomesoplenty:orange_cosmos>, [<item:contenttweaker:powder>.withTag({dmc_powder_col: 16096066})], <tag:items:forge:tools/knife>);
 /*<recipetype:farmersdelight:cooking>.addRecipe("healing_vial",
    <item:contenttweaker
 )*/

for effect in globalArrays.posPots {
	println(effect.name);
}
for effect in globalArrays.negPots {
	println(effect.name);
}

// CraftingTableManager.addShapeless(recipeName as string, output as IItemStack, ingredients as IIngredient[], recipeFunction as RecipeFunctionArray) as void
/*
<item:contenttweaker:empty_vial>.withTag({
                                             dmc_vial_col: 16066600,
                                             dmc_conc_effect_a: "minecraft:instant_health",
                                             dmc_conc_effect_b: 0,
                                             dmc_conc_effect_c: 0,
                                             dmc_override: 1,
                                             display:{Name:'[{"text":"Healing Vial","italic":false}]'},
                                             dmc_sips: 3
                                         })
                                         */
