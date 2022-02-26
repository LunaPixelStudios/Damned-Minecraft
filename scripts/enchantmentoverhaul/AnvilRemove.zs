import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.MCAnvilUpdateEvent;

CTEventManager.register<MCAnvilUpdateEvent>(event => {
    if event.left.withoutTag().matches(<item:minecraft:enchanted_book>)
        event.cancel();
    if event.right.withoutTag().matches(<item:minecraft:enchanted_book>)
        event.cancel();
});