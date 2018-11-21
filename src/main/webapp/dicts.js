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
            var self = this;
            $.get(CONFIG.baseUrl + 'dict/list.do', function(arr) {
                self.setData(arr);
                onSuccess && onSuccess(arr);
            });
        },
        setData: function(arr) {
            dicts = {};
            arr.forEach(function(dict) {
                dicts[dict.name] = dict.items;
            });
        },
        itemMap: function(dictName) {
            if (typeof dicts[dictName] == 'undefined')
                return {};
            var map = {};
            dicts[dictName].forEach(function(item) {
                map[item.key] = item.value;
            });
            return map;
        },
        items: function(dictName) {
            if (typeof dicts[dictName] == 'undefined')
                return [];
            var items = [];
            dicts[dictName].forEach(function(item) {
                items.push( {value: item.key, text: item.value} );
            });
            return items;
        }
    };
})();