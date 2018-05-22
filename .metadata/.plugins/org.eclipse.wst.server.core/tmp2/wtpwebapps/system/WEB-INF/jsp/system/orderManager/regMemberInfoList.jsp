<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="regMemberInfoList" title="用户列表" 
	<%--class="easyui-datagrid"--%>
		   style="height:99%;" remoteSort="true"
	data-options="singleSelect:true,
	    fitColumns:true, 
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductInvestTools'">
		<thead>
	    <tr>
	        <th data-options="field:'realname'" width="50px">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="80px" >手机号码</th>
	        <th data-options="field:'regdate'" width="120px">注册日期</th>
	        <th data-options="field:'bankName'" width="100px">绑卡银行</th>
	        <th data-options="field:'channelName'" width="80px">注册渠道</th>
	        <th data-options="field:'balance'" sortable="true" styler="styleColor" width="100px">账户余额<span id="balanceSort" style="color: blue;">↓↑</span></th>
	        <th data-options="field:'freeze'" sortable="true" styler="styleColor" width="100px">冻结金额<span id="freezeSort" style="color: blue;">↓↑</span></th>
	        <th data-options="field:'wprincipal'" sortable="true" styler="styleColor" width="100px">待收本金<span id="wprincipalSort" style="color: blue;">↓↑</span></th>
	        <th data-options="field:'totalAmount'" sortable="true" styler="styleColor" width="100px">资产总额<span id="totalAmountSort" style="color: blue;">↓↑</span></th>
	        <th data-options="field:'investAmount'" sortable="true" styler="styleColor" width="100px">累计投资额<span id="investAmountSort" style="color: blue;">↓↑</span></th>
	        <th data-options="field:'keyWord'" width="75px">注册关键字</th>
	        <th data-options="field:'regfrom'" width="75px">注册终端</th>
	        <th data-options="field:'isCrush'" width="75px">是否充值</th>
	        <th data-options="field:'isInvest'" width="75px">是否投资</th>
			<th data-options="field:'level'" width="auto" formatter="formaterVIP">用户等级</th>
			<th data-options="field:'recomRealName'" width="85px">推荐人姓名</th>
			<th data-options="field:'recomMobilePhone'" width="100px">推荐人号码</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInvestTools" style="padding:5px;height:750">
	  	<form id="drProductInvestForm">
	  		用户手机:<input id="searchRegMobilephone" name="mobilephone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchRegRealname" name="realname" class="easyui-textbox"  size="30" style="width:100px"/>
	  		注册日期:<input id="searchRegStartDate" name="startDate" class="easyui-datebox" style="width:100px" />到
	  				<input id="searchRegEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
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
			关键字:<input id="searchRegKeyWord" name="keyWord" class="easyui-textbox" size="50" style="width:100px"/>
			是否投资:<select id="isInvest" class="easyui-combobox" name="isInvest" style="width:200px;">   
					    <option value="">全部</option>   
					    <option value="1">是</option>   
					    <option value="0">否</option>   
					</select> 
			是否充值:<select id="isCrush" class="easyui-combobox" name="isInvest" style="width:200px;">   
					    <option value="">全部</option>   
					    <option value="1">是</option>   
					    <option value="0">否</option>   
					</select> 
			用户等级: <select  id="searchMemberCarryLevel" name="level" style="width:100px;" class="easyui-combobox">
					 	<option value=''>全部</option>
						<c:forEach items="${level }" var="map">
							<option value='${map.key }'>${map.value }</option>
						</c:forEach>
		           </select><br/>
	                      注册终端:<select class="easyui-combogrid" id="regfrom" name="regfrom" style="width:240px;padding-bottom: 3px;" data-options="
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
			资产总额:<input id="searchTotalAmountS" name="minTotalAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchTotalAmountE" name="maxTotalAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>		
			累计投资额:<input id="searchInvestAmountS" name="minInvestAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchInvestAmountE" name="maxInvestAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>			
	    	<a id="search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="export" href="javascript:exportRegMemberInfo();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
	
<script type="text/javascript">
	//查询按钮
	$('#search').click(function(sort,order){
		var cids = $('#cid').combogrid('getValues')+"";
		var regfrom = $('#regfrom').combogrid('getValues')+"";
 		$('#regMemberInfoList').datagrid({
 			url: '../regMemberInfo/regMemberInfoList.do',
			queryParams: {
// 				sort:sort,
				minInvestAmount:$('#searchInvestAmountS').val(),
				maxInvestAmount:$('#searchInvestAmountE').val(),
				minTotalAmount:$('#searchTotalAmountS').val(),
				maxTotalAmount:$('#searchTotalAmountE').val(),
				startDate:$('#searchRegStartDate').combobox('getValue'),
				endDate:$('#searchRegEndDate').combobox('getValue'),
				mobilephone:$('#searchRegMobilephone').val(),
				realname:$('#searchRegRealname').val(),
				cids:cids,
				regfrom:regfrom,
				isInvest:$('#isInvest').combo("getValue")+"",
				isCrush:$('#isCrush').combo("getValue")+"",
				keyWord:$('#searchRegKeyWord').val(),
				level:$('#searchMemberCarryLevel').combo("getValue")
			}
		});

 		if($('#searchInvestAmountS').val() =='' &&
            $('#searchInvestAmountE').val() =='' &&
            $('#searchTotalAmountS').val() =='' &&
            $('#searchTotalAmountE').val() =='' &&
            cids =='' &&
            regfrom =='' &&
            $('#searchRegMobilephone').val() =='' &&
            $('#searchRegRealname').val() =='' &&
            $('#isInvest').combo("getValue") =='' &&
            $('#isCrush').combo("getValue") =='' &&
            $('#searchRegKeyWord').val() =='' &&
            $('#searchMemberCarryLevel').combo("getValue") ==''
		){
           var startDate = $('#searchRegStartDate').combobox('getValue');
           var endDate = $('#searchRegEndDate').combobox('getValue');
            var url = "../regMemberInfo/getTitleParam.do";
            if(startDate !='' || endDate!= ''){
                url = url + "?startDate="+startDate+"&endDate="+endDate;

            }
            $.getJSON(url,
                function(data){
                    if(data.channel != 1) {
                        $('#regMemberInfoList').datagrid({
                            title:
                            '用户列表 | 平台用户：<font  color=\'red\'>' + data.totalPeople + '</font>人' +
                            '	投资：<font  color=\'red\'>' + data.totalInvest + '</font>人' +
                            '	未投资：<font  color=\'red\'>' + (data.totalPeople - data.totalInvest) + '</font>人' +
                            '	(未绑卡未投资：<font  color=\'red\'>' + (data.totalPeople - data.totalInvest - data.haveCardAndUninvest) + '</font>人' +
                            '，已绑卡未投资：<font  color=\'red\'>' + data.haveCardAndUninvest + '</font>人)' +
                            '	渠道：<font  color=\'red\'>' + data.totalChannel + '</font>个(除七彩格子外)  '
                        });
                    }
                });
		}else {
            $('#regMemberInfoList').datagrid({title:'用户列表'});
		}

	});
	
	//导出
	function exportRegMemberInfo(){
		window.location.href="../regMemberInfo/exportRegMemberInfo.do?realname="+encodeURIComponent(encodeURIComponent($('#searchRegRealname').val()))+
						"&isInvest="+$('#isInvest').combo("getValue")+""+
						"&mobilephone="+$('#searchRegMobilephone').val()+
						"&startDate="+$('#searchRegStartDate').combobox('getValue')+
						"&endDate="+$('#searchRegEndDate').combobox('getValue')+
						"&cids="+$('#cid').combogrid('getValues')+
						"&keyWord="+$('#searchRegKeyWord').val()+""+
						"&isCrush="+$('#isCrush').combo("getValue")+""+
						"&minInvestAmount="+$('#searchInvestAmountS').val()+""+
						"&maxInvestAmount="+$('#searchInvestAmountE').val()+""+
						"&minTotalAmount="+$('#searchTotalAmountS').val()+""+
						"&maxTotalAmount="+$('#searchTotalAmountE').val()+""+
						"&regfrom="+$('#regfrom').combogrid('getValues');
	}
	
	//是否是VIP
	function formaterVIP(value,row,index){
		if(row.level == "1"){
			return 'VIP';
		}else{
			return '普通用户';
		}
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
        $.getJSON("../regMemberInfo/getTitleParam.do?startDate="+currentdate, function(data){
            if(data.channel != 1){
                $('#regMemberInfoList').datagrid({title:
                    '用户列表 | 平台用户：<font  color=\'red\'>'+data.totalPeople+'</font>人'+
                    '	投资：<font  color=\'red\'>'+data.totalInvest+'</font>人'+
                    '	未投资：<font  color=\'red\'>'+(data.totalPeople-data.totalInvest)+'</font>人'+
                    '	(未绑卡未投资：<font  color=\'red\'>'+(data.totalPeople-data.totalInvest-data.haveCardAndUninvest)+'</font>人'+
                    '，已绑卡未投资：<font  color=\'red\'>'+data.haveCardAndUninvest+'</font>人)'+
                    '	渠道：<font  color=\'red\'>'+data.totalChannel+'</font>个(除七彩格子外)  '
                });
			}
        });

        $('#searchRegStartDate').datebox('setValue', currentdate);
        $('#searchRegEndDate').datebox('setValue', currentdate);

        $('#regMemberInfoList').datagrid({
            url: '../regMemberInfo/regMemberInfoList.do',
            queryParams: {
                startDate:currentdate,
                endDate:currentdate
            }
        });
    }


</script>
</body>
</html>