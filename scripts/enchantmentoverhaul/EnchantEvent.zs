import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.item.MCItemTossEvent;
import crafttweaker.api.util.MCHand;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.data.MapData;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.enchantment.MCEnchantment;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.util.Random;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.game.MCGame;
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
    // check if item is an enchanted book
    if <item:minecraft:enchanted_book>.matches(entityItem.item) {
        // get server
        val server = world.asServerWorld().server as MCServer;
        // get item position
        val itemPos = entityItem.getPosition();
        // get nearby entities from the item position
        val nearEntities = world.getEntitiesInArea(itemPos.north(3).east(3).up(1), itemPos.south(3).west(3).down(1)) as MCEntity[];
        // create empty map
        val data = new MapData();
        // write enchantment data to map
        for ench in entityItem.item.enchantments {
            data.put(ench.registryName.toString(), entityItem.item.getEnchantmentLevel(ench));
        }
        //player.sendMessage(data.asFormattedText("", 0));
        nearEntities.filter((entity as MCEntity) => entity is MCItemEntity /*&& (entity as MCItemEntity).item.isEnchantable*/)
                    .each(entity => {
                        val item = (entity as MCItemEntity).item;
                        for ench in entityItem.item.enchantments {
                            if !ench.canApply(item){
                                continue;
                            }
                            for compat in item.enchantments {
                                if !ench.isCompatibleWith(compat){
                                    continue;
                                }
                            }
                            //player.sendMessage(ench.getName());
                            val playerLuck = (1 + (player.getLuck() / 100)) / 10;
                            val failChance = 0.55;
                            val curseChance = 0.25;
                            val successRand = (world.random.nextDouble(0,1) - (entityItem.item.getEnchantmentLevel(ench) / 10)) + playerLuck;
                            val failDamage = (((item.damage * 0.25) * 10) as int) / 10;
                            if successRand as double >= failChance as double {
                                item.mutable().withEnchantment(ench, entityItem.item.getEnchantmentLevel(ench));
                                server.executeCommand("execute in " + world.dimension +" run summon firework_rocket " + globals.positionCommand((entity as MCEntity).positionVec) + " {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Flight:0,Explosions:[{Type:0,Flicker:0,Trail:0,Colors:[I;3887386],FadeColors:[I;4312372]}]}}}}", true);
                                server.executeCommand("execute in " + world.dimension + " run particle minecraft:enchant " + globals.positionCommand((entity as MCEntity).positionVec) + " 0.5 1 0.5 0 150", true);
                                server.executeCommand("execute in " + world.dimension +" run playsound minecraft:entity.evoker.cast_spell ambient @p " + globals.positionCommand((entity as MCEntity).positionVec) + " 50 1.3", true);
                                //val enchLength = ench.getDisplayName(0).getString().length - 2;
                                val successComponent = ("Applied " as MCTextComponent) + MCTextComponent.createTranslationTextComponent(ench.name) + " " + (entityItem.item.getEnchantmentLevel(ench) as string) as MCTextComponent + " to " + MCTextComponent.createTranslationTextComponent(item.translationKey);
                                player.sendStatusMessage(successComponent.setStyle(new MCStyle().setColor(4312372)), true);
                                entityItem.item.mutable().removeEnchantment(ench);
                            } else {
                                server.executeCommand("execute in " + world.dimension +" run playsound minecraft:entity.iron_golem.death ambient @p " + globals.positionCommand((entity as MCEntity).positionVec) + " 50 1.3", true);
                                server.executeCommand("execute in " + world.dimension + " run particle occultism:ritual_waiting " + globals.positionCommand((entity as MCEntity).positionVec) + " 0.01 0.01 0.01 0.2 150", true);
                                val failComponent = ("Failed to apply " as MCTextComponent) + MCTextComponent.createTranslationTextComponent(ench.name) + " " + (entityItem.item.getEnchantmentLevel(ench) as string) as MCTextComponent + " to " + MCTextComponent.createTranslationTextComponent(item.translationKey);
                                if successRand <= curseChance {
                                    val curseIndex = world.random.nextInt(globalArrays.curses.length as int);
                                    val curseEnch = globalArrays.curses[curseIndex] as MCEnchantment;
                                    item.mutable().withEnchantment(curseEnch, world.random.nextInt(curseEnch.getMinLevel(), curseEnch.getMaxLevel()));
                                    server.executeCommand("execute in " + world.dimension + " run particle infernalexp:infection " + globals.positionCommand((entity as MCEntity).positionVec) + " 0.1 0.5 0.1 0 10", true);
                                }
                                player.sendStatusMessage(failComponent.setStyle(new MCStyle().setColor(11743532)), true);
                                entityItem.item.mutable().removeEnchantment(ench);
                                item.mutable().withDamage((((item.damage - failDamage)* 10) as int ) / 10);
                            }
                            
                        }
                        if entityItem.item.enchantments.isEmpty {
                            entityItem.remove();
                        }

                    });
    }
});
