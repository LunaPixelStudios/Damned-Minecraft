import mods.contenttweaker.item.advance.CoTItemAdvanced;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.player.MCItemCraftedEvent;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.util.Random;
import crafttweaker.api.item.Rarity;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.food.MCFood;
import crafttweaker.api.potion.MCPotionEffect;
import crafttweaker.api.event.entity.living.MCLivingEntityUseItemFinishEvent;
import crafttweaker.api.player.MCPlayerEntity;
import math.Functions;
import crafttweaker.api.event.tick.MCPlayerTickEvent;
import crafttweaker.api.util.text.MCTextComponent;

<advanceditem:empty_vial>.setItemUseAction((stack) => crafttweaker.api.item.UseAction.DRINK);
<advanceditem:empty_vial>.setItemColorSupplier((stack, tintIndex) => {
    if tintIndex == 1 {
        if stack.hasTag {
          if (stack.tag as MapData).contains("dmc_vial_col") {
            return ((stack.tag as MapData).dmc_vial_col as IData).asNumber() as int;
          }
        }
        return 0;
    } else {
        return 0;
    }
});

<advanceditem:empty_vial>.setOnItemUseFinish((stack, world, livingEntity) => {
  var effectIndex = world.random.nextInt((globalArrays.posPots.length as int) -1 );
  if !world.remote && stack.hasTag {
    if stack.effectB.getString() == null || stack.effectA.getString() == null || stack.effectC.getString() == null {
        return stack;
    }
    if stack.dmcOverride.asNumber() as int == 1 {
        if stack.effectB.getString() == "0" {
            if stack.effectB.asNumber() as double < 0 {
                var effect = Functions.round(stack.effectB.asNumber() as double) as int;
                livingEntity.addPotionEffect((globalArrays.posPots[effect as usize] as MCPotionEffect).newInstance(400, 1));
            }
        } else {
            var setEffect = stack.effectB.getString();
            livingEntity.addPotionEffect((<effect:${setEffect}> as  MCPotionEffect).newInstance(100,2));
        }
        if ((stack.tag as MapData).dmc_conc_effect_c as IData).getString() == "0" {
            if stack.effectC.asNumber() as double < 0 {
                var effect = Functions.round(stack.effectC.asNumber() as double) as int;
                livingEntity.addPotionEffect((globalArrays.negPots[effect as usize] as MCPotionEffect).newInstance(400, 1));
            }
        } else {
            var setEffect = stack.effectC.getString();
            livingEntity.addPotionEffect((<effect:${setEffect}> as  MCPotionEffect).newInstance(100,2));
        }
        if stack.effectA.getString() == "0" {

        } else {
	        var setEffect = stack.effectA.getString();
	        livingEntity.addPotionEffect((<effect:${setEffect}> as MCPotionEffect).newInstance(100, (stack.dmcPotency.asNumber() as int) - 1));
        }
    } else {
	    if stack.effectB.asNumber() as double < 0 {
	        var effect = Functions.round(stack.effectB.asNumber() as double * 10) as int;
	        livingEntity.addPotionEffect((globalArrays.posPots[effect] as MCPotionEffect).newInstance(400, 1));
	    }
	    if ((stack.tag as MapData).dmc_conc_effect_c as IData).asNumber() as double < 0 {
	        var effect = Functions.round(stack.effectC.asNumber() as double  * 10) as int;
	        livingEntity.addPotionEffect((globalArrays.negPots[effect] as MCPotionEffect).newInstance(400, 1));
	    }
	    livingEntity.addPotionEffect((globalArrays.posPots[stack.effectA.asNumber() as int as usize] as MCPotionEffect).newInstance(100, 2));
	    }
	    if stack.dmcSips.asNumber() as int > 0 {
	        (stack.tag as MapData).put("dmc_sips", (stack.dmcSips.asNumber() as int) - 1);
	    } else {
	        stack.shrink();
	        (livingEntity as MCPlayerEntity).give(<item:minecraft:glass_bottle>);
	    }
  }
  if !((stack.dmcDiscovered.asNumber() as int) == 1){
      (stack.tag as MapData).put("dmc_discovered", 1);
  }
  return stack;
});
    var potionFood = new MCFood(0, 0);
    <item:contenttweaker:empty_vial>.food = potionFood.setCanEatWhenFull(true).setFastEating(true);


CTEventManager.register<MCPlayerTickEvent>((event) => {
    var player = event.player as MCPlayerEntity;
    var world = player.world as MCWorld;
    var stack = player.getHeldItemMainhand() as IItemStack;
    if <item:contenttweaker:empty_vial>.matches(stack) {
        if !world.remote && stack.hasTag {
			var dmcDiscovered = stack.dmcDiscovered;
            if dmcDiscovered != null && stack.effectA != null {
                if(dmcDiscovered.asNumber() as int) == 1 {
                    if stack.effectA.getString() != null {
                        var effectA = stack.effectA.getString();
                        stack.addTooltip(((<effect:${effectA}> as MCPotionEffect).displayName) as MCTextComponent);
                    }
                    if stack.effectB.getString() != null {
                        var effectB = stack.effectB.getString();
                        stack.addTooltip(((<effect:${effectB}> as MCPotionEffect).displayName) as MCTextComponent);
                    }
                    if stack.effectC.getString() != null {
                        var effectC = stack.effectB.getString();
                        stack.addTooltip(((<effect:${effectC}> as MCPotionEffect).displayName) as MCTextComponent);
                    }
                }
            }

        }
    }
});

/*
CTEventManager.register<MCItemCraftedEvent>((event) => {
	val player = event.player;
    val world = player.world;
    var potion = <item:contenttweaker:empty_vial>;
    if !potion.matches(event.crafting) {
        return;
    }
    var random = event.player.world.random;
    var color = random.nextInt(0 as int, 16777215 as int);
    var potionIndex = random.nextInt(globalArrays.posPots.length as int);
    var effect2Chance = world.random.nextDouble();
    var negChance = world.random.nextDouble();
    var secEffect = 0;
    var negEffect = 0;
    if effect2Chance < 0.25 {
        secEffect = 0;
    } else {
        secEffect = random.nextInt(globalArrays.posPots.length as int);
    }
    if negChance < 0.15 {
        negEffect = 0;
    } else {
        negEffect = random.nextInt(globalArrays.negPots.length as int);
    }
    event.crafting.mutable().withTag({
        dmc_vial_col: color,
        dmc_conc_effect_a: potionIndex,
        dmc_conc_effect_b: secEffect,
        dmc_conc_effect_c: negEffect
    });
});
*/