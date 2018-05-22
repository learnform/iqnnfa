<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/include/Taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
	<table id="receiveRecordList" title="福袋活动领奖页"
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:false,
	    fitColumns:true, url: '../activity/getLuckyBagList.do',
	    method:'post',rownumbers:true,
	    pagination:true,toolbar:'#receiveRecordListTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	        <th data-options="field:'realname'" width="8%">奖品领取人姓名</th>
			<th data-options="field:'mobilePhone'" width="8%">奖品领取人手机</th>
	       	<th data-options="field:'name'" width="15%">奖品名称</th>
			<th data-options="field:'add_time'" width="15%" formatter="formatDateBoxFull">领取时间</th>
			<th data-options="field:'status'" formatter="formaterStatus">是否发放</th>
			<th data-options="field:'text3'">京东e卡信息</th>
			<th data-options="field:'remark'" width="10%">备注</th>
	    </tr>
	    </thead>
	</table>
	<div id="receiveRecordListTools" style="padding:5px;height:750">
	  	<form id="receiveRecordForm">
			奖品领取人姓名:<input id="searchRealName" name="realname" class="easyui-textbox"  size="15" style="width:200px"/>
			奖品领取人手机号:<input id="searchRealphone" name="searchRealphone" class="easyui-textbox" size="15" style="width:200px"/>
			领取时间:<input id="searchStartTime" name="searchStartTime" class="easyui-datebox" style="width:100px"/>到
			<input id="searchEndTime" name="searchEndTime" class="easyui-datebox" style="width:100px"/>
			是否已经发放:<select id="searchStatus" class="easyui-combobox" name="searchStatus" style="width:100px;">
										<option value="">—请选择—</option>
										<option value="2">未发放</option>
										<option value="1">已发放</option>
									</select>
			是否已经导入:<select id="searchStatus2" class="easyui-combobox" name="searchStatus" style="width:100px;">
			<option value="">—请选择—</option>
			<option value="2">否</option>
			<option value="1">是</option>
		</select>
			<a id="importExcel" href="javascript:importExcelBtn()" class="easyui-linkbutton" iconCls="icon-search">导入</a>
			<a id="outptExcel" href="javascript:outptExcelBtn();" class="easyui-linkbutton" iconCls="icon-redo">导出未导入e卡的用户</a>
			<a id="sendECard" href="javascript:sendECardBtn()" class="easyui-linkbutton" iconCls="icon-ok">一键发放</a>
			<a id="searchReceiveRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetReceiveRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
		</form>
	</div>


	<div id="uploadFileDialog" class="easyui-dialog" title="导入表格"
		 data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#uploadFileDialogBtn'" style="width:400px;height:160px;padding:5px;">
		<form id="uploadFileDialogForm" enctype="multipart/form-data">
			<input type="hidden" id="uploadFileParentId"  name="parentId"/>
			<table align="center">
				<tr>
					<td>
						<input id="uploadFile" type="file" name="file" onchange="verifyFile(this)"/>
					</td>
				</tr>

			</table>
		</form>
		<div id="uploadFileDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="uploadLuckyBagDetail()">上传</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a>
		</div>
	</div>

<script type="text/javascript">


	//重置按钮
	$('#resetReceiveRecord').click(function(){
		$("#receiveRecordForm").form("reset");
		$("#receiveRecordList").datagrid("load", {});
	});

	function importExcelBtn() {
        $('uploadFileDialog').form("reset");
        $("#uploadFileDialog").dialog("open");
    }

	//查询按钮
	$('#searchReceiveRecord').click(function(){
 		$('#receiveRecordList').datagrid({
			queryParams: {
                realname: $('#searchRealName').val(),
                mobilePhone: $('#searchRealphone').val(),
                startDate:$('#searchStartTime').datebox('getValue'),
                endDate:$('#searchEndTime').datebox('getValue'),
				status:$('#searchStatus').combogrid('getValues')+"",
                status2:$('#searchStatus2').combogrid('getValues')+""
			}
		});
	});

    //导入
    function uploadLuckyBagDetail(){
        $("#uploadFileDialogForm").ajaxSubmit({
            url:"../activity/uploadLuckyBagDetail.do",
            type:"POST",
            data:$("#uploadFileDialogForm").serialize(),
            success: function(result){
                if(result.success){
                    $.messager.alert("提示信息",result.msg);
                    $("#receiveRecordList").datagrid("reload");
                    $("#uploadFileDialog").dialog("close");
                }else{
                    $.messager.alert("提示信息",result.errorMsg);
                }
            }
        });
    }

    //验证文件
    function verifyFile(obj) {
        if (obj.value == "") {
            $.messager.alert("提示信息","请上传文件");
            return false;
        }
        if (! /\.(xls)$/.test(obj.value)) {
            $.messager.alert("提示信息","文件类型必须是.xls");
            obj.value = "";
            return false;
        }
        return true;
    }

    //关闭添加渠道窗口
    function closeDialog(){
        $("#uploadFileDialog").dialog("close");
    }

    //导出
    function outptExcelBtn(){
        window.location.href="../activity/exportLuckyBag.do?realname="+$('#searchRealName').val()+
            "&mobilePhone="+$('#searchRealphone').val()+
            "&startDate="+$('#searchStartTime').datebox('getValue')+
            "&endDate="+$('#searchEndTime').datebox('getValue');
    }
    //一键发放
	function sendECardBtn() {
        if(confirm("确定发放给选定客户?")){
            var rows = $('#receiveRecordList').datagrid('getSelections');
            var ids = [];
            for(var i=0;i<rows.length;i++){
                if(rows[i].text3 != undefined && rows[i].text3 != '' && rows[i].status == 2){
                    ids.push(rows[i].id);
                }
			}
            if(ids.length==0){
                $.messager.alert("提示信息",'请选择有效的未发放用户！');
                return;
            }
            $.ajax({
				url: "../activity/batchUpdateStatus.do",
				type: 'POST',
				data:{"ids":ids},
                traditional: true,
				success:function(result){
					if(result.success){
						$.messager.alert("提示信息",result.msg);
                        $('#receiveRecordList').datagrid('reload');
                    }else{
						$.messager.alert("提示信息",result.errorMsg);
                        $('#receiveRecordList').datagrid('reload');
                    }
				}
			});
        }
    }

    function formaterStatus(value,row,index){
        if(row.status=="1"){
            return '已发放';
        }else if(row.status=="2"){
            return '未发放';
        }
    }

</script>
</body>
</html>

