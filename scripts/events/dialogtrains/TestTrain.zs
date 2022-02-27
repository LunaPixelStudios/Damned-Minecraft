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
    public static dynamicTrain(dialogue as string[], speed as float, train as string, global as string, repeat as bool, decision as bool, question as string, op1 as string[], op2 as string[]) as void{
        var trainBuilder = new CTDialogueTrainBuilder();
        for line in dialogue {
            trainBuilder.addDialogue(line, speed);
        }
        if (repeat) {
            trainBuilder.repeatUntilDone();
        }
        if (decision == true) {
            var decisionVar = new mods.talktome.CTNpcDialogueDecisionBuilder();
            decisionVar.setString(question);
            decisionVar.setOption1(op1[0] as string, op1[1] as string);
            decisionVar.setOption2(op2[0] as string, op2[1] as string);
            trainBuilder.addDecision(decisionVar).repeatUntilDone();
        }
        trainBuilder.save(train, global);
    }
}
TrainHelpers.dynamicTrain(["login.1", "login.2"] as string[], 1.5 as float, "dmc:login.1", "dmc:login", false, false, "", ["",""] as string[], ["",""] as string[]);
TrainHelpers.dynamicTrain(["test.1", "test.2"] as string[], 1.5 as float, "dmc:test.1", "dmc:test1", false, false, "", ["", ""] as string[], ["", ""] as string[]);
TrainHelpers.dynamicTrain(["test.3", "test.4"] as string[], 1.5 as float, "dmc:test.2", "dmc:test2", false, false, "", ["", ""] as string[], ["", ""] as string[]);

TrainHelpers.dynamicTrain(librarianResponses.responses[0] as string[], 2.0 as float, "dmc:librarian.1", "dmc:librarian1", true, false, "villager.newhere", ["dmc:test1", "response.yes"], ["dmc:test2", "response.no"]);
TrainHelpers.dynamicTrain(librarianResponses.responses[1] as string[], 2.0 as float, "dmc:librarian.2", "dmc:librarian2", true, false, "villager.newhere", ["dmc:test1", "response.yes"], ["dmc:test2", "response.no"]);
TrainHelpers.dynamicTrain(librarianResponses.responses[2] as string[], 2.0 as float, "dmc:librarian.3", "dmc:librarian3", true, false, "villager.newhere", ["dmc:test1", "response.yes"], ["dmc:test2", "response.no"]);
TrainHelpers.dynamicTrain(librarianResponses.responses[3] as string[], 2.0 as float, "dmc:librarian.4", "dmc:librarian4", true, false, "villager.newhere", ["dmc:test1", "response.yes"], ["dmc:test2", "response.no"]);
TrainHelpers.dynamicTrain(librarianResponses.responses[3] as string[], 2.0 as float, "dmc:librarian.5", "dmc:librarian5", true, true, "villager.newhere", ["dmc:test.1", "response.yes"], ["dmc:test.2", "response.no"]);

var trains = ["dmc:librarian1","dmc:librarian2","dmc:librarian3","dmc:librarian4","dmc:librarian5"] as string[];

CTEventManager.register<MCEntityInteractEvent>(event => {
    val player = event.getPlayer() as MCPlayerEntity;
    val world = player.world as MCWorld;
    var rand = world.random.nextInt(0, 4);
    // TODO: register all possible interaction events and randomize them on interact.
    if (event.getTarget().getType() == <entitytype:minecraft:villager> && event.getTarget() is MCLivingEntity) {
        Dialogue.playDialogue(event.getPlayer(), player as MCLivingEntity,trains[rand] as string);
    //println(librarianResponses.responses[rand] as string);
    }
});