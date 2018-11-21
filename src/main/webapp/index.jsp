<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
<div class="easyui-layout">
    <div data-options="title: '字典', region: 'west', split: true, collapsible: true" style="width: 40%;">
		<div id="tbrDict">
		    <form id="frmQueryDict">
				<table class="form">
				   <tr>
		                <td>常量名</td>
		                <td>
		                    <input class="easyui-textbox" name="dictName" type="text" style="width:160px">
		                </td>
			            <td>
			            	<a id="query" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			            </td>
                        <td>
                            <a id="cleanCache" class="easyui-linkbutton" data-options="iconCls:'icon-refresh'">刷新缓存</a>
                        </td>
					</tr>
				</table>
		    </form>
		</div>
		<table id="dgDict" toolbar="#tbrDict">
		    <thead>
		        <tr>
		            <th data-options="field:'name', width:'40%', halign: 'center', align:'left', formatter: formatters.name">常量名</th>
                    <th data-options="field:'note', width:'57%', halign: 'center', align:'left'">注释</th>
		            </tr>
		    </thead>
		</table>
	</div>
	
	<div data-options="title: '字典项', region: 'center', split: true" style="width: 60%;">
		<table id="dgDictItem" class="easyui-datagrid">
		    <thead>
		        <tr>
		            <th data-options="field:'key', width:'20%', align: 'center'">数据键</th>
		            <th data-options="field:'value', width:'50%', halign: 'center', align:'left'">信息值</th>
		            <th data-options="field:'note', width:'20%', halign: 'center', align:'left'">说明</th>
		        	</tr>
		    </thead>
		</table>
    </div>
</div>
<script src="${jsPath}dicts.js"></script>
<script>
var formatters= {
    name: function(v) {
        return '<span style="font-style: italic;">' + v + '</span>';
    }
}
$('#tbrDict #query').click(function(){
    $('#dgDict').datagrid('load', $('#frmQueryDict').serializeObject()); 
});
$('#tbrDict #cleanCache').click(function(){
    DictMan.cleanCache(function() {
        showOpResultMessage({success: true});
    });
});

$('#dgDict').datagrid({
    url:CONFIG.baseUrl + 'dict/page.do',
    pageSize:30,
    pageList:[20,30,50,100],
    fit: true,
    idField: 'name',
    onLoadSuccess: function(dicts) {
        if (dicts.rows.length == 1) {
            $(this).datagrid('selectRow', 0);
        }
    },
    onSelect: function(index, dict) {
        $('#dgDictItem').datagrid({
            url: CONFIG.baseUrl + 'dict/items.do',
            queryParams: {dictName: dict.name}
        });
    }
});
</script>