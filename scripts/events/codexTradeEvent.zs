import crafttweaker.api.util.MCHand;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;

CTEventManager.register<crafttweaker.api.event.entity.player.interact.MCEntityInteractEvent>((event) => {
    val player = event.player as MCPlayerEntity;
    val world = player.world as MCWorld;
    if world.remote {
        return;
        }
    if event.hand == MCHand.MAIN_HAND {
      val mainHandItem = player.getHeldItemMainhand() as IItemStack;
      val offHandItem = player.getHeldItemOffhand() as IItemStack;

      if <entitytype:minecraft:villager> == event.getTarget().type{
        if mainHandItem.matches(<item:minecraft:paper>){
            for entry in CodexEntries.entryList {
                if offHandItem.matches(entry.ingredient) {
                var rand = world.random.nextInt(0,1);
                var response = librarianResponses.responses[rand];
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank"));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("icon.damnedmc.villagerlarge") + MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank") + MCTextComponent.createTranslationTextComponent("util.damnedmc.speechbubble") + MCTextComponent.createStringTextComponent("Villager").setStyle(new MCStyle().setBold(true).setColor(<formatting:gray>)));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank") + MCTextComponent.createStringTextComponent("    ") + MCTextComponent.createStringTextComponent(response[0]).setStyle(<formatting:green>));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank") + MCTextComponent.createStringTextComponent("    ") + MCTextComponent.createStringTextComponent(response[1]).setStyle(<formatting:green>));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank") + MCTextComponent.createStringTextComponent("       ") + MCTextComponent.createStringTextComponent("The villager hands you a sheet of paper.").setStyle(<formatting:dark_gray>));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank") + MCTextComponent.createStringTextComponent("           ") + MCTextComponent.createStringTextComponent("Place this in your ").setStyle(<formatting:dark_gray>) + MCTextComponent.createStringTextComponent("Codex").setStyle((<formatting:yellow> as MCStyle).setUnderlined(true)));
                player.sendMessage(MCTextComponent.createTranslationTextComponent("util.damnedmc.dialogueblank"));
                player.setHeldItem(MCHand.MAIN_HAND, entry.page);
                player.setHeldItem(MCHand.OFF_HAND, <item:minecraft:air>);
                }
              }
          }
      }
    }
});