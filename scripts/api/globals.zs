#priority 401

import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.entity.MCEntity;

public class globals{
    public static positionCommand(pos as MCVector3d) as string {
        return (pos.x as string) + " " + (pos.y as string) + " " + (pos.z as string);
    }
    public static positionTarget(pos as BlockPos) as string {
        return "x=" + (pos.x as string) + ",y=" + (pos.y as string) + ",z=" + (pos.z as string);
    }
    public static positionTarget(pos as BlockPos, distance as string) as string {
        return positionTarget(pos) + ",distance=" + distance;
    }
    public static positionTargetMax(pos as BlockPos, distance as double) as string {
        return positionTarget(pos, ".." + (distance as string));
    }
    public static positionTargetMin(pos as BlockPos, distance as double) as string {
        return positionTarget(pos, (distance as string) + "..");
    }
    public static positionCommandBP(pos as BlockPos) as string {
        return (pos.x as string) + " " + (pos.y as string) + " " + (pos.z as string);
    }

    public static positionCommand(entity as MCEntity) as string {
        return positionCommandBP(entity.position);
    }
    public static positionTarget(entity as MCEntity) as string {
        return positionTarget(entity.position);
    }
    public static positionTarget(entity as MCEntity, distance as string) as string {
        return positionTarget(entity.position, distance);
    }
    public static positionTargetMax(entity as MCEntity, distance as double) as string {
        return positionTargetMax(entity.position, distance);
    }
    public static positionTargetMin(entity as MCEntity, distance as double) as string {
        return positionTargetMin(entity.position, distance);
    }

    public static var rarities = {
        "Currency": new DMRarity("Currency", 0xA7C4F2, 0x8296B5),
        "Uncommon": new DMRarity("Uncommon",0x55FF55, 0x3AAD3A),
        "Rare": new DMRarity("Rare", 0x5555FF, 0x3A3AAD),
        "Exotic": new DMRarity("Exotic", 0x3FFA7, 0xC9163),
        "Trophy": new DMRarity("Trophy", 0xB580FF, 0x765A9E),
        "Ancient": new DMRarity("Ancient", 0xFF0037, 0xAB2642),
        /*"Relics": new DMRarity("Relics", 0xFFFF78, 0xC9C967),*/
        /*"Anointment": new DMRarity("Anointment", 0xE7F06E, 0xC5CC6A),*/
        "Healing": new DMRarity("Healing", 0xFF0000, 0xAA0000),
        "Gunslinger": new DMRarity("Gunslinger", 0xD3C1A3, 0xADA089),
        "Heirloom": new DMRarity("Heirloom", 0xFF6F00, 0xE3721B)
    } as DMRarity[string]; 

}