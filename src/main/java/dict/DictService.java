package com.xtxk.hb.dict;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.xtxk.hb.framework.dao.DaoSupport;
import com.xtxk.hb.framework.utils.ApplicationContextUtils;

/**
 * 数据字典
 * @author hulang
 * @sice 2018年6月7日
 */
@Service
public class DictService extends DaoSupport {
    private static Map<String, Dict> dictsMap = null;

    /*
    @PostConstruct
    public static void init() {
        getAll();
    }*/
    
    public static void cleanCache() {
        dictsMap = null;
        getAllDictsMap();
    }
    
    public static Dict dict(String dictName) {
        if (dictsMap == null) {
            getAllDictsMap();
        }
        return dictsMap.get(dictName);
    }
    
    public static Map<String, Dict> getAllDictsMap() {
        if (dictsMap != null) {
            return dictsMap;
        }
        
        DictDao dictDao = ApplicationContextUtils.getBean(DictDao.class);
        
        dictsMap = new HashMap<String, Dict>();

        List<Dict> dicts = dictDao.getAllDicts();
        for (Dict dict : dicts) {
            dictsMap.put(dict.getName(), dict);
        }
        
        List<DictItem> dictItems = dictDao.getAllDictItems();
        for (DictItem dictItem : dictItems) {
            dictsMap.get(dictItem.getDictName()).addItem(dictItem);
        }

        return dictsMap;
    }
}
