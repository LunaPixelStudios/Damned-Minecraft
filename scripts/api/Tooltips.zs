// Just to make sure it always loads after tags.
#priority 399

import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.tag.TagManager;
import crafttweaker.api.item.IngredientAny;
import crafttweaker.api.item.IItemStack;

import stdlib.List;

IngredientAny.getInstance().modifyTooltip((stack, tooltip, advanced) => {

    if <tag:items:minecraft:dmc_exotics>.asIIngredient().matches(stack) {
        var rarity = globals.rarities["Exotic"];
        tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
        tooltip.insert(1, (MCTextComponent.createTranslationTextComponent("rarity.damnedmc.exotic")));
    }
    else if <tag:items:minecraft:dmc_ancient>.asIIngredient().matches(stack) {
        var rarity = globals.rarities["Ancient"];
        tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
        tooltip.insert(1, (rarity.name as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
    }
    else if <tag:items:minecraft:dmc_uncommon>.asIIngredient().matches(stack){
        var rarity = globals.rarities["Uncommon"];
          tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
          tooltip.insert(1, (rarity.name as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
    }
    else if <tag:items:minecraft:dmc_rare>.asIIngredient().matches(stack){
        var rarity = globals.rarities["Rare"];
          tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
          tooltip.insert(1, (rarity.name as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
    }
    else if <tag:items:minecraft:dmc_healing>.asIIngredient().matches(stack){
        var rarity = globals.rarities["Healing"];
        tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
        tooltip.insert(1, (rarity.name as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
    }
    else if <tag:items:minecraft:dmc_currency>.asIIngredient().matches(stack){
        var rarity = globals.rarities["Currency"];
        tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
        tooltip.insert(1, (rarity.name as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
    }
    else if <tag:items:minecraft:dmc_heirloom>.asIIngredient().matches(stack){
        var rarity = globals.rarities["Heirloom"];
        tooltip[0] = (tooltip[0].formattedText as MCTextComponent).setStyle(tooltip[0].getStyle().setColor(rarity.primaryColor));
        tooltip.insert(1, (MCTextComponent.createTranslationTextComponent("tooltip.spellworking")));
    }/*
    else if <tag:items:crafttweaker:relics>.asIIngredient().matches(stack) {
        var rarity = globals.rarities["Relics"];
        if tooltip.length > 1 && tooltip[1].getString() != "Relic" {
            tooltip.insert(1, ("Relic" as MCTextComponent).setStyle(new MCStyle().setColor(rarity.secondaryColor)));
        }
    }*/
    else {
        tooltip.insert(1, (MCTextComponent.createTranslationTextComponent("rarity.dmcloot.common")));
    }

});