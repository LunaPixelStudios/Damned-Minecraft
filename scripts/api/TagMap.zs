import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IntData;
import crafttweaker.api.data.StringData;

public expand IItemStack {

    public get tagMap as MapData => (this.getOrCreate as MapData);

    public get effectA as StringData => { 
            if !("dmc_conc_effect_a" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_a", new StringData("")); 
            } 
        return (this.tagMap.dmc_conc_effect_a as IData) as StringData;
    }
    public get effectB as StringData => { 
            if !("dmc_conc_effect_b" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_b", new StringData("")); 
            } 
        return (this.tagMap.dmc_conc_effect_b as IData) as StringData;
    }
    public get effectC as StringData => { 
            if !("dmc_conc_effect_c" in this.tagMap) { 
                this.tagMap.put("dmc_conc_effect_c", new StringData("")); 
            } 
        return (this.tagMap.dmc_conc_effect_c as IData) as StringData;
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