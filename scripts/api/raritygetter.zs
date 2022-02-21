/*import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.item.IngredientAny;
import crafttweaker.api.item.IItemStack;

// No idea if this works, copy pasted pseudocode
IngredientAny.getInstance().modifyTooltip((stack, tooltip, advanced) => {
    var found = false;
    var needle = "";
    var rarities =
        ["","ꑵ","ꈁ","","","","","","",""] as string[];
    // FIGURE OUT [IF TOOLTIP != ANY IN RARITY]
    for rarity in rarities {
        if !(tooltip[0] as string == rarity) {
            for line in tooltip {
                if !found && (line as string).matchesRegex(".*Rarity.*") {
                    found = true;
                    needle = line as string;
                }
            }
            if found {
                // find out how to make a substr method pls
                var rarityTooltip as MCTextComponent = MCTextComponent.createStringTextComponent(needle[8 .. needle.length]);
                println(rarityTooltip as string);
                tooltip.insert(1, rarityTooltip);
                found = false;
            }
        }
    }
    
});*/