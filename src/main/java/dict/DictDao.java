package com.xtxk.hb.dict;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xtxk.hb.framework.dao.DaoSupport;
import com.xtxk.hb.framework.model.Page;
import com.xtxk.hb.framework.model.PageInfo;
import com.xtxk.hb.framework.utils.Params;

@Repository
public class DictDao extends DaoSupport {
    public List<Dict> getAllDicts() {
        return list(Dict.class, "selectDicts", null).getRows();
    }
    
    public List<DictItem> getAllDictItems() {
        return list(DictItem.class, "selectDictItems", null).getRows();
    }
    
    public Page<Dict> page(Map<String, String> params, PageInfo pparams) {
        return list(Dict.class, "selectDicts", params, pparams);
    }
    
    public List<DictItem> itemsByDictName(String dictName) {
        return list(DictItem.class, "selectDictItems", new Params().i("dictName", dictName)).getRows();
    }
}

