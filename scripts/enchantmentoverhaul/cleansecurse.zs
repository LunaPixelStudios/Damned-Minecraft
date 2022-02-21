import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.item.MCItemTossEvent;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.enchantment.MCEnchantment;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;

CTEventManager.register<MCItemTossEvent>((event) => {
    val player = event.player;
    val world = player.world;
    val entityItem = event.entityItem as MCItemEntity;
    // First we need to see what side we are running on, we only want this to run on the server side (if `remote` is true, it means it is the client)
    if world.remote {
        // Since it is the client, we are just going to do nothing and return.
        return;
    }
    val server = world.asServerWorld().server as MCServer;
    // get item position
    val itemPos = entityItem.getPosition();
    // get nearby entities from the item position
    val nearEntities = world.getEntitiesInArea(itemPos.north(3).east(3).up(1), itemPos.south(3).west(3).down(1)) as MCEntity[];
    println(entityItem.item.commandString);
    if <item:create:red_sand_paper>.matches(entityItem.item){
        nearEntities.filter((entity as MCEntity) => entity is MCItemEntity /*&& (entity as MCItemEntity).item.isEnchantable*/)
            .each(entity => {
                val item = (entity as MCItemEntity).item;
                    if structureCheck.cleanserCheck(entity.position, world, entity) {
                        for ench in item.enchantments {
                            if ench in globalArrays.curses {
                                server.executeCommand("execute in " + world.dimension +" run summon firework_rocket " + globals.positionCommand((entity as MCEntity).positionVec) + " {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Flight:0,Explosions:[{Type:0,Flicker:1,Trail:0,Colors:[I;15790320],FadeColors:[I;15790320]}]}}}}", true);
                                server.executeCommand("execute in " + world.dimension + " run particle minecraft:crimson_spore " + globals.positionCommand((entity as MCEntity).positionVec) + " 0.1 0.5 0.1 0 150", true);
                                server.executeCommand("execute in " + world.dimension +" run playsound minecraft:entity.evoker.prepare_summon ambient @p " + globals.positionCommand((entity as MCEntity).positionVec) + " 50 1.3", true);
                                item.mutable().removeEnchantment(ench);
                                val cleanseComponent = ("Cleansed " as MCTextComponent) + MCTextComponent.createTranslationTextComponent(ench.name) + " from " + MCTextComponent.createTranslationTextComponent(item.translationKey);
                                player.sendStatusMessage(cleanseComponent.setStyle(new MCStyle().setColor(4312372)), true);
                                entityItem.remove();
                            }
                        }
                    } else {
                        player.sendStatusMessage(("Incorrect structure" as MCTextComponent).setStyle(new MCStyle().setColor(11743532)), true);
                    }
        });
    }
});