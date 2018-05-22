<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="userAnalysisList" title="基本运营统计"
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../userAnalysis/userAnalysisList.do',
	    method:'post',rownumbers:true,
	    pagination:true,toolbar:'#userAnalysisTools'">
		<thead>
	    <tr>
	        <th data-options="field:'newUser'" width="9%">新增注册用户</th>
	        <th data-options="field:'totalUser'" width="9%" >累计注册用户</th>	     
	       	<th data-options="field:'newInvestUser'" width="9%">新增投资用户</th>
	       	<th data-options="field:'totalInvestUser'" width="9%">累计投资用户</th>	      	
	        <th data-options="field:'newInvestAmount'" width="9%" styler="styleColor" formatter="formatAmount">新增投资额</th>
	       	<th data-options="field:'totalInvestAmount'" width="9%" styler="styleColor" formatter="formatAmount">累计投资额</th>
	        <th data-options="field:'pendRepaymentAmount'" width="9%" styler="styleColor" formatter="formatAmount">待还款金额</th>
	        <th data-options="field:'crush'" width="9%" styler="styleColor" formatter="formatAmount">充值总额</th>
	        <th data-options="field:'carry'" width="9%" styler="styleColor" formatter="formatAmount">提现总额</th>
	        <th data-options="field:'remainAmount'" width="9%" styler="styleColor" formatter="formatAmount">平台存留</th>
	        <th data-options="field:'avgInvestAmount'" width="10%" styler="styleColor" formatter="formatAmount">用户平均投资额</th>		        
	    </tr>
	    
	    </thead>
	</table>
	<div id="userAnalysisTools" style="padding:5px;height:750">
	  	<form id="userAnalysisForm">
	  		查询时间段:<input id="searchUserAnalysisStartDate" name="startDate" class="easyui-datebox start" style="width:100px"/>
	  		至<input id="searchUserAnalysisEndDate" name="endDate" class="easyui-datebox end" style="width:100px"/>
	  		
	  		<input type="radio"  name="timeType" value="2" onclick="changeDate('2')">最近一周</input>
	  		<input type="radio"  name="timeType" value="1" onclick="changeDate('1')">最近一个月 </input>
	  		<input type="radio"  name="timeType" value="3" onclick="changeDate('3')">最近三个月</input>
	  		
	    	<a id="searchUserAnalysisBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetUserAnalysisBtn" href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    </form>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetUserAnalysisBtn').click(function(){
		$("#userAnalysisForm").form("reset");
		$("#userAnalysisList").datagrid("load", {});
	});
	//查询按钮
	$('#searchUserAnalysisBtn').click(function(){
 		$('#userAnalysisList').datagrid({
			queryParams: {
				startDate: $('#searchUserAnalysisStartDate').datebox('getValue'),
				endDate: $('#searchUserAnalysisEndDate').datebox('getValue'),
				timeType:$("input[name='timeType']:checked").val()
			}
		}); 
	});
	function changeDate(type){
		var today = getNowFormatDate();
		var strtDateParam;
		var endDateParam;
		switch(type){
		case '1' :strtDateParam = getPreMonth(today,1);break;
		case '3' :strtDateParam = getPreMonth(today,3);break;
		case '2' :strtDateParam = getBeforeDate(7);break;
		}
		endDateParam = today;
		 $('.textbox:eq(0) input').val(strtDateParam);
		 $('.textbox:eq(1) input').val(endDateParam);
	}
	//获取前几个月
	function getPreMonth(date,count) {
	    var arr = date.split('-');
	    var year = arr[0]; //获取当前日期的年份
	    var month = arr[1]; //获取当前日期的月份
	    var day = arr[2]; //获取当前日期的日
	    var days = new Date(year, month, 0);
	    days = days.getDate(); //获取当前日期中月的天数
	    var year2 = year;
	    var month2 = parseInt(month) - count;
	    if (month2 == 0) {
	        year2 = parseInt(year2) - count;
	        month2 = 12;
	    }
	    var day2 = day;
	    var days2 = new Date(year2, month2, 0);
	    days2 = days2.getDate();
	    if (day2 > days2) {
	        day2 = days2;
	    }
	    if (month2 < 10) {
	        month2 = '0' + month2;
	    }
	    var t2 = year2 + '-' + month2 + '-' + day2;
	    return t2;
	}
	//获取当前日期
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
	    return currentdate;
	}
	
	function getBeforeDate(n){
	    var n = n;
	    var d = new Date();
	    var year = d.getFullYear();
	    var mon=d.getMonth()+1;
	    var day=d.getDate();
	    if(day <= n){
           if(mon>1) {
              mon=mon-1;
           }
          else {
            year = year-1;
            mon = 12;
           }
	     }
          d.setDate(d.getDate()-n);
          year = d.getFullYear();
          mon=d.getMonth()+1;
          day=d.getDate();
	      s = year+"-"+(mon<10?('0'+mon):mon)+"-"+(day<10?('0'+day):day);
	      return s;
	}
</script>
</body>
</html>

