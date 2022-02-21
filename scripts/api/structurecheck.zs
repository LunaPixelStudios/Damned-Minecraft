import crafttweaker.api.util.BlockPos;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.entity.MCEntity;

public class structureCheck {
    public static cleanserCheck(pos as BlockPos, world as MCWorld, item as MCEntity) as bool{
        var north = world.getBlockState(item.position.north()) == <blockstate:minecraft:quartz_block>;
        var south = world.getBlockState(item.position.south()) == <blockstate:minecraft:quartz_block>;
        var east = world.getBlockState(item.position.east()) == <blockstate:minecraft:quartz_block>;
        var west = world.getBlockState(item.position.west()) == <blockstate:minecraft:quartz_block>;
        var down = world.getBlockState(item.position.down()) == <blockstate:minecraft:glowstone>;
        var inside = world.getBlockState(item.position) == <blockstate:minecraft:water:level=0>;
        if  north & south & east & west & down & inside {
            return true;
        } else {
            return false;
        }
    }
    /* testing
    function validateStructure(blueprint as MCBlockState[][], corepos as BlockPos, world as MCWorld) as bool {
    //Make sure your structure is padded with air. So it has the same height as width.
        var structureRadius = blueprint[0].length;
        for i in 0 .. (structureRadius - 2) {
            //how to get the appropriate blockstate in the array is the question
            if (world.getBlockState(corepos.south(i)) == blueprint[2+i][1] && world.getBlockState(corepos.south(i).east(i)) == blueprint[2+i][1+i] && world.getBlockState(corepos.south(i).west(i)) == blueprint[2+i][1-i]) {
            
            }
        
        }
    } */
    
}