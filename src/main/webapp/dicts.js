var DictMan = (function() {
    var dicts = {};
    return {
        cleanCache: function(onDone) {
            var self = this;
            $.get(CONFIG.baseUrl + 'dict/cleanCache.do', function() {
                self.fetch();
                onDone && onDone();
            });
        },
        fetch: function(onSuccess) {
            $.get(CONFIG.baseUrl + 'dict/maps.do', function(dictMaps) {
                dicts = dictMaps;
                onSuccess && onSuccess(dictMaps);
            });
        },
        itemMap: function(dictName) {
            if (typeof dicts[dictName] == 'undefined')
                return {};
            return dicts[dictName].itemMap;
        },
        items: function(dictName) {
            if (typeof dicts[dictName] == 'undefined')
                return [];
            var itemMap = dicts[dictName].itemMap;
            var items = [];
            for (var key in itemMap) {
                items.push( {value: key, text: itemMap[key]} );
            }
            return items;
        }
    };
})();

/* 以下为旧接口,以后不要使用，逐渐过渡到新方式 */
function Dict(dictItems) {
    if (dictItems.length) {
        this.items = dictItems;
    } else {
        this.items = [];
        for (var p in dictItems) {
            this.items.push(new DictItem(p, dictItems[p]));
        }
    }
}

Dict.prototype.toMap = function() {
    return _.reduce(this.items, function(m, o){
        m[o.value] = o.text;
        return m;
    }, new Object());
}
Dict.prototype.clone = function() {
    return new Dict(this.items);
}
Dict.prototype.include = function(values) {
    var items = this.items.filter(function(item) {
        return values.indexOf(item.value) != -1;
    });
    return new Dict(items);
}
Dict.prototype.getText = function(value) {
    for (var i = 0; i < this.items.length; i++) {
        var item = this.items[i];
        if (item.value == value)
            return item.text;
    }
    return '';
}
/**
@class 字典项
@param value 值
@param text 值描述文本
 */
function DictItem(value, text) {
    this.value = value;
    this.text = text;
}