import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.entity.MCEntityType;
import crafttweaker.api.entity.MCLivingEntity;

var name1 = "amoooooooooo";
var name2 = "Eliselli";
var name3 = "Rainy_Days1";
var name4 = "AzureDoom";
var name5 = "TRCI101";
var name6 = "TheCatsKing";
var name7 = "SharkieWasBanned";

<entitytype:minecraft:player>.setNameplate((entity, result) => {
  var livingEnt = entity as MCLivingEntity;
  if result.content as string == name2 || result.content as string == name3 || result.content as string == name4 || result.content as string == name5 || result.content as string == name6 {
    result.content = MCTextComponent.createTranslationTextComponent("nametag.developer") + " " + result.content;
  } else if (result.content as string == name7){
    result.content = MCTextComponent.createTranslationTextComponent("nametag.lunapixel") + " " + result.content;
  } else if result.content as string == name1{
    result.content = MCTextComponent.createTranslationTextComponent("nametag.developer") + " amo";
  } else {
    result.content = MCTextComponent.createTranslationTextComponent("nametag.adventurer") + " " + result.content;
  }
});