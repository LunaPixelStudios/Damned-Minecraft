import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IntData;

public expand IItemStack {

    public get tagMap as MapData => (this.getOrCreate as MapData);

    public get effectA as MapData => { 
            if !("dmc_conc_effect_a" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_a", new MapData()); 
            } 
        return (this.tagMap.dmc_conc_effect_a as IData) as MapData;
    }
    public get effectB as MapData => { 
            if !("dmc_conc_effect_b" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_b", new MapData()); 
            } 
        return (this.tagMap.dmc_conc_effect_b as IData) as MapData;
    }
    public get effectC as MapData => { 
            if !("dmc_conc_effect_c" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_c", new MapData()); 
            } 
        return (this.tagMap.dmc_conc_effect_c as IData) as MapData;
    }
    public get dmcOverride as IData? => this.tagMap.dmc_override;
    public get dmcSips as IData? => this.tagMap.dmc_sips;
    public get dmcPotency as IntData => { 
            if !("dmc_potency" in this.tagMap) { 
                this.tagMap.put("dmc_potency", 0); 
            } 
        return (this.tagMap.dmc_potency as IData) as IntData; 
    }
    public get dmcDiscovered as IntData => { 
            if !("dmc_discovered" in this.tagMap) { 
                this.tagMap.put("dmc_discovered", 0); 
            } 
        return (this.tagMap.dmc_discovered as IData) as IntData; 
    }

}