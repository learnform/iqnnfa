<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
<table id="drInvestOrderList" title="订单管理"
	<%--class="easyui-datagrid"--%>
	   style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#drProductInvestTools'">
		<thead>
	    <tr>
<!-- 	        <th data-options="field:'uid'" width="4%">用户ID</th> -->
	        <th data-options="field:'investTime'" width="8%">订单时间</th>
	        <th data-options="field:'realname'" width="4%">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="5%" >手机号码</th>
	        <th data-options="field:'chanelName'" width="5%">注册渠道</th>
	       <!--  <th data-options="field:'recomRealName'" width="5%">推荐人姓名</th>
	        <th data-options="field:'recomMobilePhone'" width="5%">推荐人号码</th> -->
	        <th data-options="field:'fullName'" width="8%">产品名称</th>
	        <th data-options="field:'deadline'" width="5%">项目周期(天)</th>
	        <th data-options="field:'amount'" width="5%" styler="styleColor" formatter="formatAmount">订单金额</th>
	        <th data-options="field:'interest'" width="5%" styler="styleColor" formatter="formatAmount">预计收益</th>
	        <th data-options="field:'faAmount1'" width="5%" styler="styleColor" formatter="formatAmount">红包返现</th>
			<th data-options="field:'isFirst'" width="6%">是否首投</th>
			<th data-options="field:'raisedRates'" width="4%">加息利率</th>
	      <!--   <th data-options="field:'multiple'" width="4%" styler="styleColor">翻倍倍数</th> -->
<!-- 	        <th data-options="field:'method'" width="4%">投资类型</th> -->
	        <th data-options="field:'resultDate'" width="6%">计息日期</th>
	        <th data-options="field:'shouldTime'" width="6%">还款日期</th>
	        <th data-options="field:'joinType'" width="4%">投资终端</th>
	        <th data-options="field:'statusName'" width="5%">投资状态</th>
	        <th data-options="field:'usedTime'" width="8%">活动兑换日期</th>
	        <th data-options="field:'faAmount2'" width="5%">活动金额</th>
	        <th data-options="field:'typeName'" width="4%">活动类型</th>
	        <th data-options="field:'faStatus'" width="4%">活动状态</th>
	       <!--  <th data-options="field:'options'" width="5%">专属理财师</th> -->
	        <th data-options="field:'regdate'" width="8%">注册日期</th>
	        <!-- <th data-options="field:'chanelName'" width="5%">注册渠道</th> -->
	         <th data-options="field:'recomRealName'" width="5%">推荐人姓名</th>
	        <th data-options="field:'recomMobilePhone'" width="5%">推荐人号码</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInvestTools" style="padding:5px;height:750">
	  	<form id="drProductInvestForm">
	  		产品名称:<input id="searchDrProductInvestFullName" name="fullName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		用户手机:<input id="searchDrProductInvestMobilephone" name="mobilephone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchDrProductInvestRealname" name="realname" class="easyui-textbox"  size="30" style="width:100px"/>
	  		订单日期:<input id="searchDrProductInvestStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  			  <input id="searchDrProductInvestEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		还款日期:<input id="searchDrProductInvestStartShouldTime" name="startShouldTime" class="easyui-datebox" style="width:100px"/>到
	  			  <input id="searchDrProductInvestEndShouldTime" name="endShouldTime" class="easyui-datebox" style="width:100px"/>
<!-- 	  		投资类型: <select  id="searchDrProductInvestMethod" name="method" style="width:100px;" class="easyui-combobox"> -->
<!-- 				 	<option value=''>全部</option> -->
<%-- 					<c:forEach var="map" items="${method}"> --%>
<%-- 						<option value='${map.key}'>${map.value}</option> --%>
<%-- 			        </c:forEach> --%>
<!-- 	           		</select> -->
	  		渠道名称:<select class="easyui-combogrid" id="cid" name="cid" style="width:240px;padding-bottom: 3px;" data-options="
							panelWidth: 240,
							multiple: true,
							multiline:true,
							editable:false,
							idField: 'id',
							textField: 'name',
							url: '../channel/drAllChannelInfoList.do',
							method: 'get',
							columns: [[
								{field:'id',checkbox:true},
								{field:'code',title:'渠道号',width:80},
								{field:'name',title:'渠道名称',width:80},
							]],
							fitColumns: true
						">
					</select>
			项目周期:<input id="searchDrProductInvestDeadlineS" name="deadlineStart" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchDrProductInvestDeadlineE" name="deadlineEnd" class="easyui-textbox" value="" size="30" style="width:100px"/><br/>
			订单金额:<input id="searchDrProductInvestAmountS" name="minAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchDrProductInvestAmountE" name="maxAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>
			投资终端:<select class="easyui-combogrid" id="joinType" name="joinType" style="width:240px;padding-bottom: 3px;" data-options="
							panelWidth: 240,
							multiple: true,
							multiline:true,
							editable:false,
							idField: 'id',
							textField: 'name',
							url: '../terminal/drTerminalList.do',
							method: 'get',
							columns: [[
								{field:'id',checkbox:true},
								{field:'name',title:'终端名称',width:80},
							]],
							fitColumns: true
						">
					</select>
			推荐人姓名:<input id="searchDrProductInvestRecomRealName" name="recomRealName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		推荐人号码:<input id="searchDrProductInvestRecomMobilePhone" name="recomMobilePhone" class="easyui-textbox"  size="30" style="width:100px"/>
			是否首投:<select id="searchIsFirst" class="easyui-combobox" name="searchIsFirst" style="width:100px;">
								<option value="">—请选择—</option>
								<option value="2">非首投</option>
								<option value="1">首投</option>
							</select>
	    	<a id="searchInvestOrder" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="exportDrProductInvest" href="javascript:exportInvestOrder();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
<script type="text/javascript">
	//查询按钮
	$('#searchInvestOrder').click(function(){
		var cids = $('#cid').combogrid('getValues')+"";
		var joinTypes = $('#joinType').combogrid('getValues')+"";
        var isFirst = $('#searchIsFirst').combogrid('getValues')+"";
 		$('#drInvestOrderList').datagrid({
 			url: '../investOrder/investOrderList.do',
			queryParams: {
				recomRealName:$('#searchDrProductInvestRecomRealName').val(),
				recomMobilePhone:$('#searchDrProductInvestRecomMobilePhone').val(),
				minAmount:$('#searchDrProductInvestAmountS').val(),
				maxAmount:$('#searchDrProductInvestAmountE').val(),
				deadlineStart:$('#searchDrProductInvestDeadlineS').val(),
				deadlineEnd:$('#searchDrProductInvestDeadlineE').val(),
				realname:$('#searchDrProductInvestRealname').val(),
				fullName:$('#searchDrProductInvestFullName').val(),
				mobilephone:$('#searchDrProductInvestMobilephone').val(),
				startDate:$('#searchDrProductInvestStartDate').combobox('getValue'),
				endDate:$('#searchDrProductInvestEndDate').combobox('getValue'),
				startShouldTime:$('#searchDrProductInvestStartShouldTime').combobox('getValue'),
				endShouldTime:$('#searchDrProductInvestEndShouldTime').combobox('getValue'),
				cids:cids,
				joinTypes:joinTypes,
                isFirst:isFirst
// 				method: $('#searchDrProductInvestMethod').combobox("getValue")
			}
		});


 		if($('#searchDrProductInvestRecomRealName').val() =='' &&
            $('#searchDrProductInvestRecomMobilePhone').val() =='' &&
            $('#searchDrProductInvestAmountS').val() =='' &&
            $('#searchDrProductInvestAmountE').val() =='' &&
            $('#searchDrProductInvestDeadlineS').val() =='' &&
            $('#searchDrProductInvestDeadlineE').val() =='' &&
            $('#searchDrProductInvestRealname').val() =='' &&
            $('#searchDrProductInvestFullName').val() =='' &&
            $('#searchDrProductInvestMobilephone').val() =='' &&
            $('#searchDrProductInvestStartShouldTime').combobox('getValue') =='' &&
            $('#searchDrProductInvestEndShouldTime').combobox('getValue') =='' &&
            $('#cid').combogrid('getValues')  =='' &&
            $('#joinType').combogrid('getValues') ==''&&
            isFirst == ''
        ){
            var startDate = $('#searchDrProductInvestStartDate').combobox('getValue');
            var endDate =$('#searchDrProductInvestEndDate').combobox('getValue');
            var url = "../investOrder/getTitleParam.do";
            if(startDate !='' || endDate!= ''){
                url = url + "?startDate="+startDate+"&endDate="+endDate;
			}
            $.getJSON(url,
                function(data){
                    if(data.channel != 1) {
                        $('#drInvestOrderList').datagrid({
                            title:
                            '订单管理 | 金额：<font  color=\'red\'>' + data.totalAmount + '</font>万元' +
                            '	投资人数：<font  color=\'red\'>' + data.totalPeople + '</font>人' +
                            '	记录：<font  color=\'red\'>' + data.totalNum + '</font>条 |  ' +
                            '首投金额：<font  color=\'red\'>' + data.firstAmount + '</font>万元' +
                            '	首投人数：<font  color=\'red\'>' + data.firstPeople + '</font>人' +
                            '	首投记录：<font  color=\'red\'>' + data.firstNum + '</font>条 |  ' +
                            '复投金额：<font  color=\'red\'>' + data.afterAmount + '</font>万元' +
                            '	复投人数：<font  color=\'red\'>' + data.afterPeople + '</font>人' +
                            '	复投记录：<font  color=\'red\'>' + data.afterNum + '</font>条'
                        });
                    }
                });
		}else {
            $('#drInvestOrderList').datagrid({title:'订单管理'});
		}

	});
	//导出
	function exportInvestOrder(){
		window.location.href="../investOrder/exportInvestOrderInfo.do?realname="+encodeURIComponent(encodeURIComponent($('#searchDrProductInvestRealname').val()))+
						"&fullName="+encodeURIComponent(encodeURIComponent($('#searchDrProductInvestFullName').val()))+
						"&mobilephone="+$('#searchDrProductInvestMobilephone').val()+
						"&startDate="+$('#searchDrProductInvestStartDate').combobox('getValue')+
						"&endDate="+$('#searchDrProductInvestEndDate').combobox('getValue')+
						"&cids="+$('#cid').combogrid('getValues')+
						"&startShouldTime="+$('#searchDrProductInvestStartShouldTime').combobox('getValue')+
						"&endShouldTime="+$('#searchDrProductInvestEndShouldTime').combobox('getValue')+
// 						"&method="+$('#searchDrProductInvestMethod').combobox("getValue")+
						"&deadlineStart="+$('#searchDrProductInvestDeadlineS').val()+
						"&deadlineEnd="+$('#searchDrProductInvestDeadlineE').val()+
						"&minAmount="+$('#searchDrProductInvestAmountS').val()+
						"&maxAmount="+$('#searchDrProductInvestAmountE').val()+
						"&joinTypes="+$('#joinType').combogrid('getValues')+
						"&recomRealName="+$('#searchDrProductInvestRecomRealName').val()+
						"&recomMobilePhone="+$('#searchDrProductInvestRecomMobilePhone').val()+
						"&isFirst="+$('#searchIsFirst').combogrid('getValues')+"";
	}


    window.onload=function(){
        var date = new Date();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() +"-"+ month  +"-"+ strDate;

        $.getJSON("../investOrder/getTitleParam.do?startDate="+currentdate, function(data){
            if(data.channel != 1) {
                $('#drInvestOrderList').datagrid({
                    title:
                    '订单管理 | 金额：<font  color=\'red\'>' + data.totalAmount + '</font>万元' +
                    '	投资人数：<font  color=\'red\'>' + data.totalPeople + '</font>人' +
                    '	记录：<font  color=\'red\'>' + data.totalNum + '</font>条 |  ' +
                    '首投金额：<font  color=\'red\'>' + data.firstAmount + '</font>万元' +
                    '	首投人数：<font  color=\'red\'>' + data.firstPeople + '</font>人' +
                    '	首投记录：<font  color=\'red\'>' + data.firstNum + '</font>条 |  ' +
                    '复投金额：<font  color=\'red\'>' + data.afterAmount + '</font>万元' +
                    '	复投人数：<font  color=\'red\'>' + data.afterPeople + '</font>人' +
                    '	复投记录：<font  color=\'red\'>' + data.afterNum + '</font>条'
                });
            }
		});
        $('#searchDrProductInvestStartDate').datebox('setValue', currentdate);
        $('#searchDrProductInvestEndDate').datebox('setValue', currentdate);

        $('#drInvestOrderList').datagrid({
            url: '../investOrder/investOrderList.do',
            queryParams: {
                startDate:currentdate,
                endDate:currentdate
            }
        });
	}

</script>
</body>
</html>