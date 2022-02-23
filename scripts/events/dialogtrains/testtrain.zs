import crafttweaker.api.event.MCEvent;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.interact.MCEntityInteractEvent;
import crafttweaker.api.entity.MCLivingEntity;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.world.MCWorld;
import mods.talktome.CTDialogueTrainBuilder;
import mods.talktome.Dialogue;

public class TrainHelpers {
    public static var login = false;
    public static var lib1 = false;
    public static dynamicTrain(dialogue as string[], speed as float, train as string, global as string, repeat as bool) as void{
        var trainBuilder = new CTDialogueTrainBuilder();
        for line in dialogue {
            trainBuilder.addDialogue(line, speed);
        }
        if (repeat) {
            trainBuilder.repeatUntilDone();
        }
        trainBuilder.save(train, global);
    }
}

new CTDialogueTrainBuilder()
.repeatUntilDone()
.addDialogue("villager.welcome")
.save("dmc:testtrain","dmc:villager1");
TrainHelpers.dynamicTrain(["login.1", "login.2"] as string[], 1.5, "dmc:login.1", "dmc:login", false);


CTEventManager.register<MCEntityInteractEvent>(event => {
    val player = event.getPlayer() as MCPlayerEntity;
    val world = player.world as MCWorld;
    var rand = world.random.nextInt(0, 1);
    if (TrainHelpers.lib1 == false) {
        TrainHelpers.dynamicTrain(librarianResponses.responses[rand] as string[], 2.0, "dmc:librarian.1", "dmc:librarian", true);
        TrainHelpers.lib1 = true;
    }
    if (event.getTarget().getType() == <entitytype:minecraft:villager> && event.getTarget() is MCLivingEntity) {
        Dialogue.playDialogue(event.getPlayer(), player as MCLivingEntity,"dmc:librarian");
    //println(librarianResponses.responses[rand] as string);
    }
});