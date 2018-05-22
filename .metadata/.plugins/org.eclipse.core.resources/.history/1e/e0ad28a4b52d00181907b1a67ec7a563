<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<script type="text/javascript"src="${apppath }/js/common/echarts.common.min.js"></script>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
<script type="text/javascript">
	//重置按钮
	function resert(){	
		$('#searchDrProductStartDate').datebox('setValue','');
		$('#searchDrProductEndDate').datebox('setValue','');
	};
	// 查询按钮
	function searchPost(){
		if($('#searchDrProductStartDate').datebox("getValue") == "" && $('#searchDrProductEndDate').datebox("getValue") != "" ){
			$.messager.alert('Warning','请填写开始日期!');
			return ;
		}
				
		if( $('#searchDrProductEndDate').datebox("getValue") == "" && $('#searchDrProductStartDate').datebox("getValue") != "" ){
			$.messager.alert('Warning','请填写结束日期！');
			return ;
		}
		
		if($('#searchDrProductStartDate').datebox("getValue") == "" && $('#searchDrProductEndDate').datebox("getValue") == ""){
			$.messager.alert('Warning','请填写开始和结束日期！');
			return ;
		}
		
		bb();
		searchTable();
	}
	
	window.onload=bb;
	
	//查询 列表的请求
	function searchTable(){
 		$('#productInvestList').datagrid({
			queryParams: {
				startDate:$('#searchDrProductStartDate').datebox('getValue'),
				endDate:$('#searchDrProductEndDate').datebox('getValue')
			}
		}); 
	}

	//折线图的请求方法
	function   bb(){
		 //提交查询表单
		var dateArr="";
		var totalArr="";
		var maxParm = 0;
		$("#auditDrProductInfoForm").ajaxSubmit({
				url:"../statistics/productRepaymentTotal.do",
				type:"POST",
				data:$("#auditDrProductInfoForm").serialize(), 
	      		success:function(data){
 					if(data.success){
 						maxParm = data.map.max;
						dateArr = data.map.statisticsDateList;
						totalArr = data.map.totalList;
						paint(dateArr,totalArr,maxParm);
				
							
					}else{
						$.messager.alert("提示信息",data.errorMsg);
					}            	
				}
	        });
	}
	
	function formatStatis(value,row,index){
		var statisticdDate = "'"+row.statisticdDate+ "'";
		value = parseFloat(value).toLocaleString();
		if(row.statisticdDate == "本页总计" || row.statisticdDate =="总计"){
			return value;
		}else{
			return '<a href="javascript:void(0)" onclick="javascrip:toProductForStatisticsList('+statisticdDate+')">'+value+'</a>';
		}
		
	}
	
	function toProductForStatisticsList(statisticdDate){
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : statisticdDate,
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/invest/toProductForStatisticsList.do?statisticsDate="+statisticdDate+"' ></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}

	//画图
	function paint(dateArr,totalArr,maxParm){
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		
		option = null;
		option = {
		    title: {
		        text: '',
		        subtext: ''
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#283b56'
		            }
		        }
		    },
		    legend: {
		        data:['总额', '总额']
		    },
		    toolbox: {
		        show: true,
		        feature: {
		            dataView: {readOnly: false},
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    dataZoom: {
		        show: false,
		        start: 0,
		        end: 100
		    },
		    xAxis: [
		        {
		            type: 'category',
		            boundaryGap: true,
		            data: (function (){
		                var res = dateArr;
		                return res;
		            })()
		        },
		        {
		        	type: 'category',
		            boundaryGap: true,
		            data: (function (){
		                var res = dateArr;
		                return res;
		            })()
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            scale: true,
		            name: '',
		            max: maxParm,
		            min: 0,
		            boundaryGap: [0.2, 0.2]
		        } ,
		        {
		            type: 'value',
		            scale: true,
		            name: '',
		            max: maxParm,
		            min: 0,
		            boundaryGap: [0.2, 0.2]
		        } 
		    ],
		    series: [
		        {
		            name:'总额',
		            type:'bar',
		            xAxisIndex: 1,
		            yAxisIndex: 1,
		            data:(function (){
		                var res = totalArr;
		                return res;
		            })()
		        },
		        {
		            name:'总额',
		            type:'line',
		            data:(function (){
		                var res = totalArr;
		                return res;
		            })()
		        }
		    ]
		};
		
		app.count = totalArr.length;
		
		if (option && typeof option === "object") {
		    myChart.setOption(option, true);
		} 
	}
	
	//导出
	function exportData(){
		window.location.href="../statistics/export.do?startDate="+$('#searchDrProductStartDate').datebox("getValue")+
						"&endDate="+$('#searchDrProductEndDate').datebox("getValue");
	}
	
	
</script>
<body style="height: 100%; margin: 0">

	
	<!-- <div id="container2"> -->
		<!-- <table class="table table-hover" style="border:1px solid #9db3c5">  --> 
           <!-- <tbody id="partList">                                               
           </tbody> -->
        
      <!--  </table>  -->
 <!--    </div> -->
 	<div id="container"  style="height: 40%"></div>
 	<table id="productInvestList" 
			class="easyui-datagrid" style="width:99.9%;height:59.9%;"
			data-options="singleSelect:true,
	    	fitColumns:true, 
	    	url: '../statistics/productRepaymentTotalForPage.do',
	    	method:'post',rownumbers:true,showFooter: true,
	    	pagination:true,toolbar:'#auditDrProductInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'statisticdDate'" >日期</th>
	    	<th data-options="field:'repaymentTotal'" width="15%" formatter="formatAmount">还款本金</th>
	        <th data-options="field:'interestTotal'" width="10%" formatter="formatAmount">还款利息</th>
	        <th data-options="field:'total',formatter:formatStatis" >合计</th>
	    </tr>
	    </thead>
	</table> 
	<div id="auditDrProductInfoTools" style="padding:5px;height:750">
	  	<form id="auditDrProductInfoForm">
	  	查询时间段:<input id="searchDrProductStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  			<input id="searchDrProductEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  			<input type="button" id="searchAuditDrProductInfo" onclick="searchPost()" value="查询"/>
	  			<!-- <a id="search" href="javascript:searchTable()" class="easyui-linkbutton" iconCls="icon-search">查询</a> -->
		    	<a id="resetAuditDrProductInfo" href="javascript:resert()" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
		    	<a id="exportDrProductInvest" href="javascript:exportData();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div> 
	
</body>
</html>