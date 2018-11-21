package com.xtxk.hb.dict;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Dict {
    private String name;
    private String note;
    
    private List<DictItem> items = new ArrayList<DictItem>();
    private Map<String, String> itemMap = new HashMap<String, String>();

    public void addItem(DictItem item) {
        items.add(item);
        itemMap.put(item.getKey(), item.getValue());
    }

    public String getName() {
        return name;
    }
    
    @JsonIgnore
    public Map<String, String> getItemMap() {
        return itemMap;
    }
    
    @JsonIgnore
    public String value(Object key) {
        return itemMap.get(key.toString());
    }
    
    public List<DictItem> getItems() {
        return items;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
