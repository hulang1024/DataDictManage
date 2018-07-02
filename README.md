# DataDictManage
数据字典解决方案。

## 用法
1. 创建数据库([sql](src/sql/))。
2. 复制所有源码到工程。

### Java API
```java
//初始化字典（一般在应用启动时调用）
DictService.init();
//清空缓存 (当需要同步字典数据库变化)
DictService.cleanCache();
//获取所有字典组成的Map<String, Dict>
DictService.getAllDictsMap();
//根据字典名获取字典
Dict dict = DictService.dict("user.type");
String value = userTypeDict.value(1);
```
### JS API
```js
//从服务器获取数据初始化
DictMan.fetch();
//清空缓存（重新fetch）
DictMan.fetch();
//根据字典名获取Map形式的字典
DictMan.itemMap("user.type")
//根据字典名获取数组形式的字典
DictMan.items("user.type")
```
