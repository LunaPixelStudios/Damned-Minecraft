import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;

public expand IItemStack {

    public get tagMap as MapData => (this.tag as MapData);

    public get effectA as IData => this.tagMap.dmc_conc_effect_a as IData;
    public get effectB as IData => this.tagMap.dmc_conc_effect_b as IData;
    public get effectC as IData => this.tagMap.dmc_conc_effect_c as IData;
    public get dmcOverride as IData => this.tagMap.dmc_override as IData;
    public get dmcSips as IData => this.tagMap.dmc_sips as IData;

}