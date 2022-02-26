import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.player.MCItemCraftedEvent;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.util.Random;
import crafttweaker.api.item.Rarity;

CTEventManager.register<MCItemCraftedEvent>((event) => {
    var portalKey = <item:dimdungeons:item_portal_key>.setDisplayName("Advanced Dungeon Key");
    if !portalKey.matches(event.crafting) {
        return;
    }

    var random = event.player.world.random;
    event.crafting.mutable().withTag({
                                    key_activated: 1,
                                    built: 0,
                                    dest_x: random.nextInt(0 as int, 8191 as int),
                                    dest_z: random.nextInt(0 as int, 8191 as int) - 8191,
                                    name_type: 3,
                                    name_part_1: random.nextInt(0, 19),
                                    name_part_2: random.nextInt(0, 11)
                                });
});