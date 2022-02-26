import crafttweaker.api.enchantment.MCEnchantment;
import stdlib.List;
import crafttweaker.api.potion.MCPotionEffect;

public class globalArrays {
    public static var curses = new List<MCEnchantment>();
    public static var posPots = new List<MCPotionEffect>();
    public static var negPots = new List<MCPotionEffect>();
}
    for ench in game.enchantments {
        if ench.curse {
            println("👻spooky enchantment: " + ench.name + " 👻");
            globalArrays.curses.add(ench);
        }
    }
    for effect in game.effects{
        if effect.isBeneficial{
            globalArrays.posPots.add(effect);
        } else {
            globalArrays.negPots.add(effect);
        }
    }
