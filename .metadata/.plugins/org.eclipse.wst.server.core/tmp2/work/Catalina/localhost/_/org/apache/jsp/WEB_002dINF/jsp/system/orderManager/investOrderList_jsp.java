/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-04-08 02:55:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.orderManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class investOrderList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/orderManager/../../common/include/util.jsp", Long.valueOf(1523153962925L));
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1523153962924L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;


    response.setHeader("Content-Type","text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    pageContext.setAttribute("pageEncoding","utf-8");
    
	String apppath = request.getContextPath();
	request.setAttribute("apppath", apppath);
	
	Date d = new Date();
	String tabid = "tabid"+d.getTime();
	request.setAttribute("tabid", tabid);

      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/themes/default/easyui.css\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/themes/icon.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/validatebox.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/common/common.js\"></script>");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<table id=\"drInvestOrderList\" title=\"订单管理\"\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\t   style=\"height:99%;\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true,\r\n");
      out.write("\t    method:'post',rownumbers:true,showFooter: true,\r\n");
      out.write("\t    pagination:true,toolbar:'#drProductInvestTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("<!-- \t        <th data-options=\"field:'uid'\" width=\"4%\">用户ID</th> -->\r\n");
      out.write("\t        <th data-options=\"field:'investTime'\" width=\"8%\">订单时间</th>\r\n");
      out.write("\t        <th data-options=\"field:'realname'\" width=\"4%\">用户姓名</th>\r\n");
      out.write("\t        <th data-options=\"field:'mobilePhone'\" width=\"5%\" >手机号码</th>\r\n");
      out.write("\t        <th data-options=\"field:'chanelName'\" width=\"5%\">注册渠道</th>\r\n");
      out.write("\t       <!--  <th data-options=\"field:'recomRealName'\" width=\"5%\">推荐人姓名</th>\r\n");
      out.write("\t        <th data-options=\"field:'recomMobilePhone'\" width=\"5%\">推荐人号码</th> -->\r\n");
      out.write("\t        <th data-options=\"field:'fullName'\" width=\"8%\">产品名称</th>\r\n");
      out.write("\t        <th data-options=\"field:'deadline'\" width=\"5%\">项目周期(天)</th>\r\n");
      out.write("\t        <th data-options=\"field:'amount'\" width=\"5%\" styler=\"styleColor\" formatter=\"formatAmount\">订单金额</th>\r\n");
      out.write("\t        <th data-options=\"field:'interest'\" width=\"5%\" styler=\"styleColor\" formatter=\"formatAmount\">预计收益</th>\r\n");
      out.write("\t        <th data-options=\"field:'faAmount1'\" width=\"5%\" styler=\"styleColor\" formatter=\"formatAmount\">红包返现</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'isFirst'\" width=\"6%\">是否首投</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'raisedRates'\" width=\"4%\">加息利率</th>\r\n");
      out.write("\t      <!--   <th data-options=\"field:'multiple'\" width=\"4%\" styler=\"styleColor\">翻倍倍数</th> -->\r\n");
      out.write("<!-- \t        <th data-options=\"field:'method'\" width=\"4%\">投资类型</th> -->\r\n");
      out.write("\t        <th data-options=\"field:'resultDate'\" width=\"6%\">计息日期</th>\r\n");
      out.write("\t        <th data-options=\"field:'shouldTime'\" width=\"6%\">还款日期</th>\r\n");
      out.write("\t        <th data-options=\"field:'joinType'\" width=\"4%\">投资终端</th>\r\n");
      out.write("\t        <th data-options=\"field:'statusName'\" width=\"5%\">投资状态</th>\r\n");
      out.write("\t        <th data-options=\"field:'usedTime'\" width=\"8%\">活动兑换日期</th>\r\n");
      out.write("\t        <th data-options=\"field:'faAmount2'\" width=\"5%\">活动金额</th>\r\n");
      out.write("\t        <th data-options=\"field:'typeName'\" width=\"4%\">活动类型</th>\r\n");
      out.write("\t        <th data-options=\"field:'faStatus'\" width=\"4%\">活动状态</th>\r\n");
      out.write("\t       <!--  <th data-options=\"field:'options'\" width=\"5%\">专属理财师</th> -->\r\n");
      out.write("\t        <th data-options=\"field:'regdate'\" width=\"8%\">注册日期</th>\r\n");
      out.write("\t        <!-- <th data-options=\"field:'chanelName'\" width=\"5%\">注册渠道</th> -->\r\n");
      out.write("\t         <th data-options=\"field:'recomRealName'\" width=\"5%\">推荐人姓名</th>\r\n");
      out.write("\t        <th data-options=\"field:'recomMobilePhone'\" width=\"5%\">推荐人号码</th>\r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"drProductInvestTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"drProductInvestForm\">\r\n");
      out.write("\t  \t\t产品名称:<input id=\"searchDrProductInvestFullName\" name=\"fullName\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t用户手机:<input id=\"searchDrProductInvestMobilephone\" name=\"mobilephone\" class=\"easyui-textbox\"  size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t用户姓名:<input id=\"searchDrProductInvestRealname\" name=\"realname\" class=\"easyui-textbox\"  size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t订单日期:<input id=\"searchDrProductInvestStartDate\" name=\"startDate\" class=\"easyui-datebox\" style=\"width:100px\"/>到\r\n");
      out.write("\t  \t\t\t  <input id=\"searchDrProductInvestEndDate\" name=\"endDate\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t还款日期:<input id=\"searchDrProductInvestStartShouldTime\" name=\"startShouldTime\" class=\"easyui-datebox\" style=\"width:100px\"/>到\r\n");
      out.write("\t  \t\t\t  <input id=\"searchDrProductInvestEndShouldTime\" name=\"endShouldTime\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("<!-- \t  \t\t投资类型: <select  id=\"searchDrProductInvestMethod\" name=\"method\" style=\"width:100px;\" class=\"easyui-combobox\"> -->\r\n");
      out.write("<!-- \t\t\t\t \t<option value=''>全部</option> -->\r\n");
      out.write("<!-- \t           \t\t</select> -->\r\n");
      out.write("\t  \t\t渠道名称:<select class=\"easyui-combogrid\" id=\"cid\" name=\"cid\" style=\"width:240px;padding-bottom: 3px;\" data-options=\"\r\n");
      out.write("\t\t\t\t\t\t\tpanelWidth: 240,\r\n");
      out.write("\t\t\t\t\t\t\tmultiple: true,\r\n");
      out.write("\t\t\t\t\t\t\tmultiline:true,\r\n");
      out.write("\t\t\t\t\t\t\teditable:false,\r\n");
      out.write("\t\t\t\t\t\t\tidField: 'id',\r\n");
      out.write("\t\t\t\t\t\t\ttextField: 'name',\r\n");
      out.write("\t\t\t\t\t\t\turl: '../channel/drAllChannelInfoList.do',\r\n");
      out.write("\t\t\t\t\t\t\tmethod: 'get',\r\n");
      out.write("\t\t\t\t\t\t\tcolumns: [[\r\n");
      out.write("\t\t\t\t\t\t\t\t{field:'id',checkbox:true},\r\n");
      out.write("\t\t\t\t\t\t\t\t{field:'code',title:'渠道号',width:80},\r\n");
      out.write("\t\t\t\t\t\t\t\t{field:'name',title:'渠道名称',width:80},\r\n");
      out.write("\t\t\t\t\t\t\t]],\r\n");
      out.write("\t\t\t\t\t\t\tfitColumns: true\r\n");
      out.write("\t\t\t\t\t\t\">\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t项目周期:<input id=\"searchDrProductInvestDeadlineS\" name=\"deadlineStart\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/>&nbsp;至\r\n");
      out.write("\t\t\t\t\t<input id=\"searchDrProductInvestDeadlineE\" name=\"deadlineEnd\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/><br/>\r\n");
      out.write("\t\t\t订单金额:<input id=\"searchDrProductInvestAmountS\" name=\"minAmount\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/>&nbsp;至\r\n");
      out.write("\t\t\t\t\t<input id=\"searchDrProductInvestAmountE\" name=\"maxAmount\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t\t\t投资终端:<select class=\"easyui-combogrid\" id=\"joinType\" name=\"joinType\" style=\"width:240px;padding-bottom: 3px;\" data-options=\"\r\n");
      out.write("\t\t\t\t\t\t\tpanelWidth: 240,\r\n");
      out.write("\t\t\t\t\t\t\tmultiple: true,\r\n");
      out.write("\t\t\t\t\t\t\tmultiline:true,\r\n");
      out.write("\t\t\t\t\t\t\teditable:false,\r\n");
      out.write("\t\t\t\t\t\t\tidField: 'id',\r\n");
      out.write("\t\t\t\t\t\t\ttextField: 'name',\r\n");
      out.write("\t\t\t\t\t\t\turl: '../terminal/drTerminalList.do',\r\n");
      out.write("\t\t\t\t\t\t\tmethod: 'get',\r\n");
      out.write("\t\t\t\t\t\t\tcolumns: [[\r\n");
      out.write("\t\t\t\t\t\t\t\t{field:'id',checkbox:true},\r\n");
      out.write("\t\t\t\t\t\t\t\t{field:'name',title:'终端名称',width:80},\r\n");
      out.write("\t\t\t\t\t\t\t]],\r\n");
      out.write("\t\t\t\t\t\t\tfitColumns: true\r\n");
      out.write("\t\t\t\t\t\t\">\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t推荐人姓名:<input id=\"searchDrProductInvestRecomRealName\" name=\"recomRealName\" class=\"easyui-textbox\" value=\"\" size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t推荐人号码:<input id=\"searchDrProductInvestRecomMobilePhone\" name=\"recomMobilePhone\" class=\"easyui-textbox\"  size=\"30\" style=\"width:100px\"/>\r\n");
      out.write("\t\t\t是否首投:<select id=\"searchIsFirst\" class=\"easyui-combobox\" name=\"searchIsFirst\" style=\"width:100px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"\">—请选择—</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"2\">非首投</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"1\">首投</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t    \t<a id=\"searchInvestOrder\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    \t<a id=\"exportDrProductInvest\" href=\"javascript:exportInvestOrder();\" class=\"easyui-linkbutton\" iconCls=\"icon-redo\">导出</a>\r\n");
      out.write("\t    </form>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchInvestOrder').click(function(){\r\n");
      out.write("\t\tvar cids = $('#cid').combogrid('getValues')+\"\";\r\n");
      out.write("\t\tvar joinTypes = $('#joinType').combogrid('getValues')+\"\";\r\n");
      out.write("        var isFirst = $('#searchIsFirst').combogrid('getValues')+\"\";\r\n");
      out.write(" \t\t$('#drInvestOrderList').datagrid({\r\n");
      out.write(" \t\t\turl: '../investOrder/investOrderList.do',\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\trecomRealName:$('#searchDrProductInvestRecomRealName').val(),\r\n");
      out.write("\t\t\t\trecomMobilePhone:$('#searchDrProductInvestRecomMobilePhone').val(),\r\n");
      out.write("\t\t\t\tminAmount:$('#searchDrProductInvestAmountS').val(),\r\n");
      out.write("\t\t\t\tmaxAmount:$('#searchDrProductInvestAmountE').val(),\r\n");
      out.write("\t\t\t\tdeadlineStart:$('#searchDrProductInvestDeadlineS').val(),\r\n");
      out.write("\t\t\t\tdeadlineEnd:$('#searchDrProductInvestDeadlineE').val(),\r\n");
      out.write("\t\t\t\trealname:$('#searchDrProductInvestRealname').val(),\r\n");
      out.write("\t\t\t\tfullName:$('#searchDrProductInvestFullName').val(),\r\n");
      out.write("\t\t\t\tmobilephone:$('#searchDrProductInvestMobilephone').val(),\r\n");
      out.write("\t\t\t\tstartDate:$('#searchDrProductInvestStartDate').combobox('getValue'),\r\n");
      out.write("\t\t\t\tendDate:$('#searchDrProductInvestEndDate').combobox('getValue'),\r\n");
      out.write("\t\t\t\tstartShouldTime:$('#searchDrProductInvestStartShouldTime').combobox('getValue'),\r\n");
      out.write("\t\t\t\tendShouldTime:$('#searchDrProductInvestEndShouldTime').combobox('getValue'),\r\n");
      out.write("\t\t\t\tcids:cids,\r\n");
      out.write("\t\t\t\tjoinTypes:joinTypes,\r\n");
      out.write("                isFirst:isFirst\r\n");
      out.write("// \t\t\t\tmethod: $('#searchDrProductInvestMethod').combobox(\"getValue\")\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \t\tif($('#searchDrProductInvestRecomRealName').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestRecomMobilePhone').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestAmountS').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestAmountE').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestDeadlineS').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestDeadlineE').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestRealname').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestFullName').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestMobilephone').val() =='' &&\r\n");
      out.write("            $('#searchDrProductInvestStartShouldTime').combobox('getValue') =='' &&\r\n");
      out.write("            $('#searchDrProductInvestEndShouldTime').combobox('getValue') =='' &&\r\n");
      out.write("            $('#cid').combogrid('getValues')  =='' &&\r\n");
      out.write("            $('#joinType').combogrid('getValues') ==''&&\r\n");
      out.write("            isFirst == ''\r\n");
      out.write("        ){\r\n");
      out.write("            var startDate = $('#searchDrProductInvestStartDate').combobox('getValue');\r\n");
      out.write("            var endDate =$('#searchDrProductInvestEndDate').combobox('getValue');\r\n");
      out.write("            var url = \"../investOrder/getTitleParam.do\";\r\n");
      out.write("            if(startDate !='' || endDate!= ''){\r\n");
      out.write("                url = url + \"?startDate=\"+startDate+\"&endDate=\"+endDate;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("            $.getJSON(url,\r\n");
      out.write("                function(data){\r\n");
      out.write("                    if(data.channel != 1) {\r\n");
      out.write("                        $('#drInvestOrderList').datagrid({\r\n");
      out.write("                            title:\r\n");
      out.write("                            '订单管理 | 金额：<font  color=\\'red\\'>' + data.totalAmount + '</font>万元' +\r\n");
      out.write("                            '\t投资人数：<font  color=\\'red\\'>' + data.totalPeople + '</font>人' +\r\n");
      out.write("                            '\t记录：<font  color=\\'red\\'>' + data.totalNum + '</font>条 |  ' +\r\n");
      out.write("                            '首投金额：<font  color=\\'red\\'>' + data.firstAmount + '</font>万元' +\r\n");
      out.write("                            '\t首投人数：<font  color=\\'red\\'>' + data.firstPeople + '</font>人' +\r\n");
      out.write("                            '\t首投记录：<font  color=\\'red\\'>' + data.firstNum + '</font>条 |  ' +\r\n");
      out.write("                            '复投金额：<font  color=\\'red\\'>' + data.afterAmount + '</font>万元' +\r\n");
      out.write("                            '\t复投人数：<font  color=\\'red\\'>' + data.afterPeople + '</font>人' +\r\n");
      out.write("                            '\t复投记录：<font  color=\\'red\\'>' + data.afterNum + '</font>条'\r\n");
      out.write("                        });\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("\t\t}else {\r\n");
      out.write("            $('#drInvestOrderList').datagrid({title:'订单管理'});\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("\t//导出\r\n");
      out.write("\tfunction exportInvestOrder(){\r\n");
      out.write("\t\twindow.location.href=\"../investOrder/exportInvestOrderInfo.do?realname=\"+encodeURIComponent(encodeURIComponent($('#searchDrProductInvestRealname').val()))+\r\n");
      out.write("\t\t\t\t\t\t\"&fullName=\"+encodeURIComponent(encodeURIComponent($('#searchDrProductInvestFullName').val()))+\r\n");
      out.write("\t\t\t\t\t\t\"&mobilephone=\"+$('#searchDrProductInvestMobilephone').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&startDate=\"+$('#searchDrProductInvestStartDate').combobox('getValue')+\r\n");
      out.write("\t\t\t\t\t\t\"&endDate=\"+$('#searchDrProductInvestEndDate').combobox('getValue')+\r\n");
      out.write("\t\t\t\t\t\t\"&cids=\"+$('#cid').combogrid('getValues')+\r\n");
      out.write("\t\t\t\t\t\t\"&startShouldTime=\"+$('#searchDrProductInvestStartShouldTime').combobox('getValue')+\r\n");
      out.write("\t\t\t\t\t\t\"&endShouldTime=\"+$('#searchDrProductInvestEndShouldTime').combobox('getValue')+\r\n");
      out.write("// \t\t\t\t\t\t\"&method=\"+$('#searchDrProductInvestMethod').combobox(\"getValue\")+\r\n");
      out.write("\t\t\t\t\t\t\"&deadlineStart=\"+$('#searchDrProductInvestDeadlineS').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&deadlineEnd=\"+$('#searchDrProductInvestDeadlineE').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&minAmount=\"+$('#searchDrProductInvestAmountS').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&maxAmount=\"+$('#searchDrProductInvestAmountE').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&joinTypes=\"+$('#joinType').combogrid('getValues')+\r\n");
      out.write("\t\t\t\t\t\t\"&recomRealName=\"+$('#searchDrProductInvestRecomRealName').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&recomMobilePhone=\"+$('#searchDrProductInvestRecomMobilePhone').val()+\r\n");
      out.write("\t\t\t\t\t\t\"&isFirst=\"+$('#searchIsFirst').combogrid('getValues')+\"\";\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    window.onload=function(){\r\n");
      out.write("        var date = new Date();\r\n");
      out.write("        var month = date.getMonth() + 1;\r\n");
      out.write("        var strDate = date.getDate();\r\n");
      out.write("        if (month >= 1 && month <= 9) {\r\n");
      out.write("            month = \"0\" + month;\r\n");
      out.write("        }\r\n");
      out.write("        if (strDate >= 0 && strDate <= 9) {\r\n");
      out.write("            strDate = \"0\" + strDate;\r\n");
      out.write("        }\r\n");
      out.write("        var currentdate = date.getFullYear() +\"-\"+ month  +\"-\"+ strDate;\r\n");
      out.write("\r\n");
      out.write("        $.getJSON(\"../investOrder/getTitleParam.do?startDate=\"+currentdate, function(data){\r\n");
      out.write("            if(data.channel != 1) {\r\n");
      out.write("                $('#drInvestOrderList').datagrid({\r\n");
      out.write("                    title:\r\n");
      out.write("                    '订单管理 | 金额：<font  color=\\'red\\'>' + data.totalAmount + '</font>万元' +\r\n");
      out.write("                    '\t投资人数：<font  color=\\'red\\'>' + data.totalPeople + '</font>人' +\r\n");
      out.write("                    '\t记录：<font  color=\\'red\\'>' + data.totalNum + '</font>条 |  ' +\r\n");
      out.write("                    '首投金额：<font  color=\\'red\\'>' + data.firstAmount + '</font>万元' +\r\n");
      out.write("                    '\t首投人数：<font  color=\\'red\\'>' + data.firstPeople + '</font>人' +\r\n");
      out.write("                    '\t首投记录：<font  color=\\'red\\'>' + data.firstNum + '</font>条 |  ' +\r\n");
      out.write("                    '复投金额：<font  color=\\'red\\'>' + data.afterAmount + '</font>万元' +\r\n");
      out.write("                    '\t复投人数：<font  color=\\'red\\'>' + data.afterPeople + '</font>人' +\r\n");
      out.write("                    '\t复投记录：<font  color=\\'red\\'>' + data.afterNum + '</font>条'\r\n");
      out.write("                });\r\n");
      out.write("            }\r\n");
      out.write("\t\t});\r\n");
      out.write("        $('#searchDrProductInvestStartDate').datebox('setValue', currentdate);\r\n");
      out.write("        $('#searchDrProductInvestEndDate').datebox('setValue', currentdate);\r\n");
      out.write("\r\n");
      out.write("        $('#drInvestOrderList').datagrid({\r\n");
      out.write("            url: '../investOrder/investOrderList.do',\r\n");
      out.write("            queryParams: {\r\n");
      out.write("                startDate:currentdate,\r\n");
      out.write("                endDate:currentdate\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
