#priority 399
for item in <tag:items:minecraft:dmc_exotics>.asIIngredient().items {
    item.setRarity(globals.rarities["Exotic"].rarity);
}

for item in <tag:items:minecraft:dmc_uncommon>.asIIngredient().items {
    item.setRarity(globals.rarities["Uncommon"].rarity);
}

for item in <tag:items:minecraft:dmc_rare>.asIIngredient().items {
    item.setRarity(globals.rarities["Rare"].rarity);
}
for item in <tag:items:minecraft:dmc_ancient>.asIIngredient().items {
    item.setRarity(globals.rarities["Ancient"].rarity);
}
/*for item in <tag:items:crafttweaker:relics>.asIIngredient().items {
    item.setRarity(globals.rarities["Relics"].rarity);
}*/
for item in <tag:items:minecraft:dmc_currency>.asIIngredient().items {
    item.setRarity(globals.rarities["Currency"].rarity);
}
for item in <tag:items:minecraft:dmc_healing>.asIIngredient().items {
    item.setRarity(globals.rarities["Healing"].rarity);
}
/*for item in <tag:items:crafttweaker:anointment>.asIIngredient().items {
    item.setRarity(globals.rarities["Anointment"].rarity);
}*/
for item in <tag:items:minecraft:dmc_heirloom>.asIIngredient().items {
    item.setRarity(globals.rarities["Heirloom"].rarity);
}