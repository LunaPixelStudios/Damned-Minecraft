#priority 0

import crafttweaker.api.event.MCEvent;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.entity.MCLivingEntity;
import crafttweaker.api.event.entity.player.interact.MCLeftClickBlockEvent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.world.MCWorld;
import mods.talktome.CTDialogueTrainBuilder;
import mods.talktome.Dialogue;

CTEventManager.register<MCLeftClickBlockEvent>(event => {
    val player = event.getPlayer() as MCPlayerEntity;
    val world = player.world as MCWorld;
    if world.remote {
        return;
    }
    if player.getPersistentData().contains("dmc_logged_in") {
        println("true");
        return;
    } else {
        println("else works");
        Dialogue.playDialogue(player, player as MCLivingEntity,"dmc:login");
        player.updatePersistentData({dmc_logged_in: "true"});
    }        
});