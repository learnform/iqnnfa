<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../../common/include/util.jsp" %>
</head>
<body>
<table id="tbMain" title="基本运营统计" style="height:99%;width:99.9%"
       data-options="singleSelect:true,
	    fitColumns:true,
	    url: '',
	    method:'post',rownumbers:true,
	    pagination:true,toolbar:'#searchTools'">
    <thead>
    <tr>
        <th data-options="field:'uid'" width="10%">客户编号</th>
        <th data-options="field:'provinceName'" width="15%">户籍</th>
        <th data-options="field:'ageGroup'" width="15%">年龄段</th>
        <th data-options="field:'sexName'" width="10%" >性别</th>
        <th data-options="field:'investAmount'" width="20%">历史累计投资总额</th>
        <th data-options="field:'investCount'" width="10%">累计投资次数</th>
        <th data-options="field:'channelName'" width="10%">注册渠道</th>
        <th data-options="field:'isRefer'" formatter="formatIsRefer" width="10%">是否被推荐</th>
    </tr>
    </thead>
</table>
<div id="searchTools" style="padding:5px;">
    <form id="searchForm">
        查询时间段:<input id="startDt" name="startDate" class="easyui-datebox" style="width:100px"/>
        至<input id="endDt" name="endDate" class="easyui-datebox" style="width:100px"/>
        <a id="searchData" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
        <a id="resetParams" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="exportData()">导出</a>
    </form>
</div>
<script type="text/javascript">
    //重置按钮
    $('#resetParams').click(function(){
        $("#searchForm").form("reset");

        $('#startDt').datebox('setValue', '2017-03-30');
        $('#endDt').datebox('setValue', formatterDate(new Date()));

        $("#tbMain").datagrid("load",
            {
            startDt: $('#startDt').datebox('getValue'),
            endDt: $('#endDt').datebox('getValue'),
            });
    });

    //查询按钮
    $('#searchData').click(function(){
        $('#tbMain').datagrid({
            queryParams: {
                startDt: $('#startDt').datebox('getValue'),
                endDt: $('#endDt').datebox('getValue'),
            }
        });
    });

    function exportData(){
        location.href="${apppath}/channel/exportUserInvestAnalys.do?startDt="+$('#startDt').datebox('getValue')+
            "&endDt="+$('#endDt').datebox('getValue');
    };

    function formatIsRefer(val,row){
            if(val == 0){
                return "否";
            }else if (val ==1){
                return "是";
            }else{
                return "";
            }
    };



    $(function(){

        $('#startDt').datebox('setValue', '2017-03-30');
        $('#endDt').datebox('setValue', formatterDate(new Date()));

        $('#tbMain').datagrid({
//            singleSelect:true,
//            fitColumns:true,
            url:'../channel/userInvestAnalyse.do',
//            method:'post',
//            rownumbers:true,
//            pagination:true,
//            toolbar:'#searchTools',
            queryParams: {
                startDt: $('#startDt').datebox('getValue'),
                endDt: $('#endDt').datebox('getValue'),
            }
        });

//        var opts = $("#tbMain").datagrid("options");
//        opts.url = "../channel/userInvestAnalyse.do";
//
//        $("#tbMain").datagrid("load",
//            {
//                startDt: $('#startDt').datebox('getValue'),
//                endDt: $('#endDt').datebox('getValue'),
//            });

    });

    function formatterDate(date){
        var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
        var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
            + (date.getMonth() + 1);
        return date.getFullYear() + '-' + month + '-' + day;
    }
</script>
</body>
</html>

