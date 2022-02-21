/*import crafttweaker.api.food.MCFood;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.loot.conditions.LootConditionBuilder;
import crafttweaker.api.loot.conditions.vanilla.KilledByPlayer;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;
import crafttweaker.api.loot.modifiers.CommonLootModifiers;
import crafttweaker.api.util.MCHand;
import crafttweaker.api.util.text.MCTextComponent;

CTEventManager.register<crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent>((event) => {
    val player = event.player;
    val world = player.world;
    if world.remote {
        return;
    }
    if event.hand != MCHand.MAIN_HAND {
        return;
    } else {
    println(event.itemStack.getOrCreate.getString());
    event.itemStack.mutable().identifySoul();
    println(event.itemStack.getOrCreate.getString());
    }

});

*/