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
