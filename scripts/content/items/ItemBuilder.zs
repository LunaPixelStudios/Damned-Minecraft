#loader contenttweaker

import mods.contenttweaker.item.ItemBuilder;
import mods.contenttweaker.item.tool.ItemBuilderTool;
import mods.contenttweaker.item.advance.ItemBuilderAdvanced;
import crafttweaker.api.BracketHandlers;
import crafttweaker.api.item.ItemGroup;

public class DMCItemBuilder {
	public static var vialItemGroup = ItemGroup.create("dmc.alchemy", () => BracketHandlers.getItem("contenttweaker:mundane_vial"));
}

var powder = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
powder.withType<ItemBuilderAdvanced>().build("powder");
var empty = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
empty.withType<ItemBuilderAdvanced>().build("empty_vial");
var almanis = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
almanis.withType<ItemBuilderAdvanced>().build("almanis_vial");
var aurwynn = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
aurwynn.withType<ItemBuilderAdvanced>().build("aurwynn_vial");
var mundane = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
mundane.withType<ItemBuilderAdvanced>().build("mundane_vial");
var cyaris = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
cyaris.withType<ItemBuilderAdvanced>().build("cyaris_vial");
var lyrginaz = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
lyrginaz.withType<ItemBuilderAdvanced>().build("lyrginaz_vial");
var cedawynn = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
cedawynn.withType<ItemBuilderAdvanced>().build("cedawynn_vial");
var mayunis = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
mayunis.withType<ItemBuilderAdvanced>().build("mayunis_vial");
var fegalaz = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
fegalaz.withType<ItemBuilderAdvanced>().build("fegalaz_vial");
var finalaz = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
finalaz.withType<ItemBuilderAdvanced>().build("finalaz_vial");
var frewynn = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
frewynn.withType<ItemBuilderAdvanced>().build("frewynn_vial");
var heolirgaz = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
heolirgaz.withType<ItemBuilderAdvanced>().build("heolirgaz_vial");
var ordalis = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
ordalis.withType<ItemBuilderAdvanced>().build("ordalis_vial");
var unuris = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
unuris.withType<ItemBuilderAdvanced>().build("unuris_vial");
var oodren = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
oodren.withType<ItemBuilderAdvanced>().build("oodren_vial");
var yeowryn = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
yeowryn.withType<ItemBuilderAdvanced>().build("yeowryn_vial");
var yunagaz = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
yunagaz.withType<ItemBuilderAdvanced>().build("yunagaz_vial");
var yhivren = new ItemBuilder().withItemGroup(DMCItemBuilder.vialItemGroup);
yhivren.withType<ItemBuilderAdvanced>().build("yhivren_vial");