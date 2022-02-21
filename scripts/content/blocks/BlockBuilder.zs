#loader contenttweaker

import mods.contenttweaker.block.BlockBuilder;
import mods.contenttweaker.block.advance.BlockBuilderAdvanced;
import mods.contenttweaker.block.BlockRenderType;
import mods.contenttweaker.block.BlockTypeBuilder;
import crafttweaker.api.item.ItemGroup;

var cage = new BlockBuilder(<blockmaterial:earth>);
cage.notSolid();
cage.withItemGroup(DMCItemBuilder.vialItemGroup);
cage.withType<BlockBuilderAdvanced>();
cage.withRenderType(BlockRenderType.CUTOUT);
cage.build("cage");