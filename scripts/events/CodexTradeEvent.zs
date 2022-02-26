import crafttweaker.api.util.MCHand;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.entity.MCLivingEntity;
import mods.talktome.CTDialogueTrainBuilder;
import mods.talktome.Dialogue;

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
                if (TrainHelpers.lib1 == false) {
                    TrainHelpers.dynamicTrain(librarianResponses.responses[rand] as string[], 2.0 as float, "dmc:librarian.1", "dmc:librarian", true, false, "Are you new here?", ["dmc:test.1", "Yes!"], ["dmc:test.2", "No."]);
                    TrainHelpers.lib1 = true;
                }
                if (event.getTarget().getType() == <entitytype:minecraft:villager> && event.getTarget() is MCLivingEntity) {
                    Dialogue.playDialogue(event.getPlayer(), event.getTarget() as MCLivingEntity,"dmc:librarian");
                //println(librarianResponses.responses[rand] as string);
                }
                player.setHeldItem(MCHand.MAIN_HAND, entry.page);
                player.setHeldItem(MCHand.OFF_HAND, <item:minecraft:air>);
                }
              }
          }
      }
    }
});