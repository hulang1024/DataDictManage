package com.xtxk.hb.dict;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class DictItem {
    private String dictName;
    private String key;
    private String value;
    private String note;
    private Integer sort;

    @JsonIgnore
    public String getDictName() {
        return dictName;
    }
    public void setDictName(String dictName) {
        this.dictName = dictName;
    }
    
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public Integer getSort() {
        return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
    }
    

}
