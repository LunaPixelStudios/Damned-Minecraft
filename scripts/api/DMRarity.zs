import crafttweaker.api.item.Rarity;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;

public class DMRarity {

    public var name as string : get;
    public var primaryColor as int : get;
    public var secondaryColor as int : get;

    public var rarity as Rarity : get;

    public this(name as string, primaryColor as int, secondaryColor as int) {
		this.name = name;
        this.primaryColor = primaryColor;
        this.secondaryColor = secondaryColor;
        this.rarity = Rarity.create(name.toUpperCase(), <formatting:reset>);
	}


}