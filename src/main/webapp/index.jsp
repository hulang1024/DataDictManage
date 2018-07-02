<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="easyui-layout">
    <div data-options="title: '字典', region: 'west', split: true, collapsible: true" style="width: 40%;">
		<div id="tbrDict">
		    <form id="frmQueryDict">
				<table class="form">
				   <tr>
		                <td class="form">名称</td>
		                <td class="form">
		                    <input class="easyui-textbox" name="dictName" type="text" style="width:160px">
		                </td>
			            <td class="form">
			            	<a id="query" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			            </td>
                        <td class="form">
                            <a id="cleanCache" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">刷新缓存</a>
                        </td>
					</tr>
				</table>
		    </form>
		</div>
		<table id="dgDict" toolbar="#tbrDict">
		    <thead>
		        <tr>
		            <th data-options="field:'name', width:'40%', halign: 'center', align:'left'">名称</th>
                    <th data-options="field:'note', width:'57%', halign: 'center', align:'left'">解释</th>
		            </tr>
		    </thead>
		</table>
	</div>
	
	<div data-options="title: '字典项', region: 'center', split: true" style="width: 60%;">
		<table id="dgDictItem" class="easyui-datagrid" toolbar="">
		    <thead>
		        <tr>
		            <th data-options="field:'key', width:'20%', align: 'center'">键</th>
		            <th data-options="field:'value', width:'50%', halign: 'center', align:'left'">值</th>
		            <th data-options="field:'note', width:'28%', halign: 'center', align:'left'">备注</th>
		        	</tr>
		    </thead>
		</table>
    </div>
</div>
<script src="${jsPath}dicts.js"></script>
<script>
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
    pagination:true,
    pagePosition:'bottom',
    pageNumber:1,
    pageSize:30,
    pageList:[20,30,50,100],
    singleSelect:true,
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