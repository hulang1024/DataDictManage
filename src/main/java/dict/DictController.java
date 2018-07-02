package com.xtxk.hb.dict;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtxk.hb.framework.model.Page;
import com.xtxk.hb.framework.model.PageInfo;
import com.xtxk.hb.security.dao.DictionaryDao;
import com.xtxk.hb.security.model.Dictionary;

@RequestMapping("/dict")
@Controller
public class DictController {
    @Autowired
    private DictDao dictDao;
    
    @RequestMapping("/page")
    @ResponseBody
    public Page<Dict> page(@RequestParam Map<String, String> params, PageInfo pparams) {
        return dictDao.page(params, pparams);
    }
    
    @RequestMapping("/items")
    @ResponseBody
    public List<DictItem> items(String dictName) {
        return dictDao.itemsByDictName(dictName);
    }
    
    @RequestMapping("/maps")
    @ResponseBody
    public Map<String, Dict> getAll() {
        return DictService.getAllDictsMap();
    }
    
    @RequestMapping("/cleanCache")
    @ResponseBody
    public boolean cleanCache() {
        DictService.cleanCache();
        return true;
    }
    
    /* 以下是旧接口,被引用,只能保留 */
    @Autowired
    private DictionaryDao ddictDao;
    
    @RequestMapping("/listByPid")
    @ResponseBody
    List<Dictionary> listByPid(String pid) {
        return ddictDao.listDictionaryByType(pid);
    }
}
