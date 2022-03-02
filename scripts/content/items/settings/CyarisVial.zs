import crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.blocks.MCBlockState;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.util.BlockPos;
import mods.contenttweaker.block.advance.BlockBuilderAdvanced;
import crafttweaker.api.world.MCBlockDisplayReader;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.util.Direction;
import crafttweaker.api.item.MCItemUseContext;
import crafttweaker.api.util.ActionResultType;


<advanceditem:cyaris_vial>.setItemColorSupplier((stack, tintIndex) => {
    return 65430;
});
<advancedblock:cyarisvial>.setBlockColorSupplier((block as MCBlockState, reader as MCBlockDisplayReader?, pos as BlockPos?, tintIndex as int) => {
    return 65430;
});
/*
CTEventManager.register<MCRightClickBlockEvent>((event) => {
    var player = event.player as MCPlayerEntity;
    var world = player.world as MCWorld;
    var stack = player.getHeldItemMainhand() as IItemStack;
    if <item:contenttweaker:cyaris_vial>.matches(stack) {
        var face = event.getFace() as Direction;
        

            world.setBlockState(event.getBlockPos().offset(face), <blockstate:contenttweaker:cyarisvial>);
            stack.shrink();
    }
});
*/
<advanceditem:cyaris_vial>.setOnItemUse((context) => {
    var face = context.direction;
    context.world.setBlockState(context.pos.offset(face), <blockstate:contenttweaker:cyarisvial>);
    context.player.getHeldItem(context.hand).shrink();
    return ActionResultType.SUCCESS;
});