import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;

<advanceditem:powder>.setItemColorSupplier((stack, tintIndex) => {
    if tintIndex == 1 {
        if stack.hasTag {
          if (stack.tag as MapData).contains("dmc_powder_col") {
            return ((stack.tag as MapData).dmc_vial_col as IData).asNumber() as int;
          }
        }
        return 0;
    } else {
        return 0;
    }
});