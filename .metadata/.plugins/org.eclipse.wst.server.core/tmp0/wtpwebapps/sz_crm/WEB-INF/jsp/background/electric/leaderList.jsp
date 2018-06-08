<%@include file="/WEB-INF/jsp/common/Taglibs.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="../../common/util.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/js/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/icon.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<table id="crmLeaderList" title="电销主管"
       class="easyui-datagrid" style="height:99%;width:99.9%" remoteSort="true"
       data-options="singleSelect:false,
	    fitColumns:true, url: '${pageContext.servletContext.contextPath}/background/electric/leaderList.html',
	    method:'post',rownumbers:true, checkbox:true,
	    pagination:true,toolbar:'#drProductInvestTools'">
    <thead>
    <tr>
        <th data-options="field:'id',checkbox:true"></th>
        <th data-options="field:'uid'" width="80px">用户ID</th>
        <th data-options="field:'userName'" width="40px">用户姓名</th>
        <th data-options="field:'mobilePhone'" formatter="formatImg" width="80px">手机号</th>
        <th data-options="field:'mobile'" width="80px">手机号</th>
        <th data-options="field:'referrerName'" width="60px">推荐人姓名</th>
        <th data-options="field:'referrerPhone'" width="60px" formatter="formatRef">推荐人号码</th>
        <th data-options="field:'registertime'" width="100px" formatter="formatDateBoxFull">注册时间</th>
        <th data-options="field:'bankName'" width="80px">绑卡银行</th>
        <th data-options="field:'regfrom'" width="80px" formatter="formatRegfrom">注册终端</th>
        <th data-options="field:'isAllot'" width="80px" formatter="formatAllot">是否分配</th>
        <th data-options="field:'sysUserTo'" width="80px">责任人</th>
        <th data-options="field:'isFollow'" width="80px" formatter="formatFollow">是否沟通</th>
        <th data-options="field:'followCount'" sortable="true" width="50px">沟通次数</th>
        <th data-options="field:'lastFollowTime'" width="100px" formatter="formatDateBoxFull">最后沟通时间</th>
        <th data-options="field:'_operate',align:'center'" width="80px" formatter="formatOper">操作</th>
    </tr>
    </thead>
</table>
<div id="drProductInvestTools" style="padding:5px;height:750">
    <form id="leaderListForm">
        手机号:<input id="searchRegMobilephone" name="mobilephone" class="easyui-textbox" size="30" style="width:100px"/>
        用户姓名:<input id="searchRegRealname" name="userName" class="easyui-textbox" size="30" style="width:100px"/>
        注册日期:<input id="searchRegStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
        <input id="searchRegEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
        预约时间:<input id="searchAdvanceDate" name="advanceDate" class="easyui-datebox" style="width:100px"/>
        是否分配:<select id="isAllot" class="easyui-combobox" name="isAllot" style="width:200px;">
        <option value="">全部</option>
        <option value="1">是</option>
        <option value="0">否</option>
    </select>
        是否投资:<select id="isInvest" class="easyui-combobox" name="isInvest" style="width:200px;">
        <option value="">全部</option>
        <option value="1">是</option>
        <option value="0">否</option>
    </select>
        是否沟通:<select id="isFollow" class="easyui-combobox" name="isFollow" style="width:200px;">
        <option value="">全部</option>
        <option value="1">是</option>
        <option value="2">否</option>
    </select>
        推荐人姓名:<input id="searchDrProductInvestRecomRealName" name="referrerName" class="easyui-textbox" value=""
                     size="30" style="width:100px"/><br/>
        推荐人号码:<input id="searchDrProductInvestRecomMobilePhone" name="referrerPhone" class="easyui-textbox" size="30"
                     style="width:100px"/>
        责任人:<input id="searchSysUser" name="sysUser" class="easyui-textbox" size="30" style="width:100px"/>
        跟进流程状态：<select id="status" class="easyui-combobox" name="status" style="width:200px;">
        <option value="">全部</option>
        <option value="0">未接听</option>
        <option value="1">待联系</option>
        <option value="2">持续跟进</option>
        <option value="3">高意向</option>
        <option value="4">成功</option>
        <option value="5">失败</option>
    </select>
        <a id="search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
        <a id="reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        <a id="branch" href="javascript:void(0)" onclick="allotCustomer()" class="easyui-linkbutton">分配客户</a>
        <a id="subordinate" href="javascript:void(0)" class="easyui-linkbutton" onclick="sysUserBtn()">我的下属</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="memberExport()">导出</a>
    </form>
</div>
<div id="w" class="easyui-dialog" title="分配客户"
     data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true"
     style="width:600px;height:400px;padding:10px;">
</div>
<div id="follow" class="easyui-dialog" title="沟通管理"
     data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true"
     style="width:600px;height:400px;padding:10px;">
</div>
<script type="text/javascript">
    $(function () {
        $('#crmLeaderList').datagrid("hideColumn", "mobile");
    });

    //导出
    function memberExport() {
        location.href = "${pageContext.servletContext.contextPath}/background/electric/exportMember.html?mobilePhone=" + $('#searchRegMobilephone').val() + "&userName=" + $('#searchRegRealname').val() +
            "&referrerName=" + $('#searchDrProductInvestRecomRealName').val() + "&isAllot=" + $('#isAllot').combo("getValue") +
            "&advanceDate=" + $('#searchAdvanceDate').combobox('getValue') +
            "&startDate=" + $('#searchRegStartDate').combobox('getValue') +
            "&endDate=" + $('#searchRegEndDate').combobox('getValue') +
            "&referrerPhone=" + $('#searchDrProductInvestRecomMobilePhone').val() +
            "&isInvest=" + $('#isInvest').combo("getValue") +
            "&isFollow=" + $('#isFollow').combo("getValue") +
            "&sysUser=" + $('#searchSysUser').val()
        ;
    }

    //查询按钮
    $('#search').click(function (sort, order) {
        $('#crmLeaderList').datagrid({
            url: '../electric/leaderList.html',
            queryParams: {
                mobilePhone: $('#searchRegMobilephone').val(),
                userName: $('#searchRegRealname').val(),
                startDate: $('#searchRegStartDate').combobox('getValue'),
                endDate: $('#searchRegEndDate').combobox('getValue'),
                advanceDate: $('#searchAdvanceDate').combobox('getValue'),
                referrerName: $('#searchDrProductInvestRecomRealName').val(),
                referrerPhone: $('#searchDrProductInvestRecomMobilePhone').val(),
                isAllot: $('#isAllot').combo("getValue") + "",
                isInvest: $('#isInvest').combo("getValue") + "",
                isFollow: $('#isFollow').combo("getValue") + "",
                status: $('#status').combo("getValue") + "",
                sysUser: $('#searchSysUser').val()
            }
        });
    });

    function formatImg(val, row, index) {
        var mobile = row.mobilePhone.substr(0, 3) + '***' + row.mobilePhone.substr(7);
        return mobile + '<a href="#" onclick="clickPhone(' + index + ')"><img style="width:20px; height:20px" src="../../images/phone.png"></a>';
    }

    function formatRef(val, row, index) {
        var mobile = row.referrerPhone;
        if (mobile != null && mobile != '') {
            mobile = mobile.substr(0, 3) + '***' + mobile.substr(7);
        }
        return mobile;
    }

    //我的下属
    function sysUserBtn() {
        window.location.href = "${pageContext.servletContext.contextPath}/background/electric/toMyStaffList.html";
    }

    //分配客户
    function allotCustomer() {
        var checkedItems = $('#crmLeaderList').datagrid('getChecked');
        if (checkedItems == "") {
            $.messager.alert("操作提示", "请选择要分配的用户！");
            return;
        }
        var ids = [];
        var unIds = [];
        $.each(checkedItems, function (index, item) {
            // if(item.isAllot==0){
            ids.push(item.uid);
            // }else{
            // 	unIds.push(item.uid);
            // }
        });

        $("#w").window({
            title: "分配客户",
            width: $(this).width() * 0.5,
            height: $(this).height() * 0.5,
            href: '../electric/toCustomer.html?ids=' + ids
        });
        $("#w").window("open").window("center");
    }

    function allotCustomerSingle(index) {
        $('#crmLeaderList').datagrid('selectRow', index);// 关键在这里
        var row = $('#crmLeaderList').datagrid('getSelected');
        var uid = row.uid;
        $("#w").window({
            title: "分配客户",
            width: $(this).width() * 0.5,
            height: $(this).height() * 0.6,
            href: '../electric/toCustomer.html?ids=' + uid
        });
        $("#w").window("open").window("center");
    }

    //跟进
    function clickPhone(index) {
        $('#crmLeaderList').datagrid('selectRow', index);// 关键在这里
        var row = $('#crmLeaderList').datagrid('getSelected');
        var userName = row.userName;
        var mobilePhone = row.mobilePhone;
        var mobile = row.mobilePhone;
        $("#follow").window({
            title: "沟通管理",
            width: $(this).width() * 0.5,
            height: $(this).height() * 0.6,
            maximizable: true,
            href: '../electric/toFollowListLeader.html?uid=' + row.uid + '&userName=' + userName + '&mobilePhone=' + mobilePhone + '&mobile=' + mobile
        });
        $("#follow").window("open").window("center");
    }

    //重置
    $('#reset').click(function () {
        $("#leaderListForm").form("reset");
        $("#crmLeaderList").datagrid("load", {});
    });

    //分配转换显示
    function formatAllot(val, row, index) {
        var val = row.name;
        if (val != null && val != "") {
            return '是';
        }
        else {
            return '否';
        }
    }

    function formatFollow(val, row, index) {
        var val = row.followCount;
        if (val >= 1) {
            return '是';
        }
        else {
            return '否';
        }
    }

    function formatRegfrom(val, row, index) {
        if (val == 0) {
            return 'pc';
        }
        else if (val == 1) {
            return 'IOS';
        }
        else if (val == 2) {
            return 'android';
        }
        else if (val == 3) {
            return '微信';
        }
        else if (val == 4) {
            return 'WAP';
        }
    }

    //添加基本操作链接
    function formatOper(val, row, index) {
        return '<a href="#" class="btn l-btn l-btn-small"  onclick="clickPhone(' + index + ')">沟通</a>&nbsp;&nbsp;&nbsp;<a href="#" class="btn l-btn l-btn-small"  onclick="allotCustomerSingle(' + index + ')">分配客户</a>';
    }
</script>
</body>
</html>