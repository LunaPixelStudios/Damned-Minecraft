import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;

public expand IItemStack {

    public get tagMap as MapData => (this.tag as MapData);

    public get effectA as IData => { 
            if !("dmc_conc_effect_a" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_a", new MapData()); 
            } 
        return this.tagMap.dmc_conc_effect_a; 
    }
    public get effectB as IData => { 
            if !("dmc_conc_effect_b" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_b", new MapData()); 
            } 
        return this.tagMap.dmc_conc_effect_b;
    }
    public get effectC as IData => { 
            if !("dmc_conc_effect_c" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_c", new MapData()); 
            } 
        return this.tagMap.dmc_conc_effect_c;
    }
    public get dmcOverride as IData => this.tagMap.dmc_override as IData;
    public get dmcSips as IData => this.tagMap.dmc_sips as IData;
    public get dmcPotency as IData => this.tagMap.dmc_potency as IData;
    public get dmcDiscovered as IData => { 
            if !("dmc_discovered" in this.tagMap) { 
                this.tagMap.put("dmc_discovered", new MapData()); 
            } 
        return this.tagMap.dmc_discovered; 
    }

}