import crafttweaker.api.item.IItemStack;

public class tradeObject {

    public var page as IItemStack : get, set;
    public var ingredient as IItemStack : get, set;

    public this(ingredient as IItemStack, page as IItemStack){
        this.ingredient = ingredient;
        this.page = page;
    }

}