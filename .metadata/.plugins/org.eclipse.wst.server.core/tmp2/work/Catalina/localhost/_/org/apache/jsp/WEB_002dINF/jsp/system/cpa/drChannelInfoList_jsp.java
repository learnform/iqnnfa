/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-04-19 07:48:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.cpa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class drChannelInfoList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1523153962924L));
    _jspx_dependants.put("/WEB-INF/jsp/system/cpa/../../common/include/util.jsp", Long.valueOf(1523153962925L));
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
      out.write("<script type=\"text/javascript\" src=\"../js/common/jquery.form.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table id=\"drChannelInfoList\" title=\"渠道列表\" \r\n");
      out.write("\tclass=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '../channel/drChannelInfoList.do',\r\n");
      out.write("\t    method:'post',rownumbers:true, \r\n");
      out.write("\t    pagination:true,toolbar:'#drChannelInfoTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("\t    \t<th data-options=\"field:'id'\" hidden=\"true\">序号</th>\r\n");
      out.write("\t    \t<th data-options=\"field:'code'\" width=\"10%\">渠道号</th>\r\n");
      out.write("\t        <th data-options=\"field:'name'\" width=\"10%\">渠道名称</th>\r\n");
      out.write("\t        <th data-options=\"field:'alias'\" width=\"10%\">渠道别名</th>\r\n");
      out.write("\t        <th data-options=\"field:'isParticipation'\" width=\"10%\" formatter=\"formatIsParticipation\">是否参与活动</th>\r\n");
      out.write("\t        <th data-options=\"field:'status'\" width=\"5%\" formatter=\"formatStatus\">渠道状态</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'addUserName'\" width=\"10%\">添加人</th>\r\n");
      out.write("\t        <th data-options=\"field:'addDate'\" width=\"10%\" formatter=\"formatDateBoxFull\">添加时间</th>\r\n");
      out.write("\t        <th data-options=\"field:'updUserName'\" width=\"10%\">修改人</th>\r\n");
      out.write("\t        <th data-options=\"field:'updDate'\" width=\"10%\" formatter=\"formatDateBoxFull\">修改时间</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'_operate',align:'center'\" width=\"20%\" formatter=\"formatOper\">基本操作</th>\r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"drChannelInfoTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"drChannelInfoForm\">\r\n");
      out.write("\t  \t\t渠道编号:<input id=\"searchDrChannelInfoCode\" name=\"code\" class=\"easyui-textbox\"  size=\"15\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t渠道名称:<input id=\"searchDrChannelInfoName\" name=\"name\" class=\"easyui-textbox\"  size=\"15\" style=\"width:100px\"/>\r\n");
      out.write("\t    \t<a id=\"searchDrChannelInfo\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    \t<a id=\"resetDrChannelInfo\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">重置</a>\r\n");
      out.write("\t    \t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" onclick=\"addDrChannelInfoBtn()\">渠道新增</a>\t\r\n");
      out.write("\t    </form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"addDrChannelInfoDialog\" class=\"easyui-dialog\" title=\"渠道添加\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrChannelInfoBtn'\" style=\"width:400px;height:190px;padding:5px;\">\r\n");
      out.write("\t\t<form id=\"addDrChannelInfoForm\">\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道号：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"code\"  class=\"easyui-textbox\"  data-options=\"required:true,validType:'noChinese'\" />\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道名称：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\t\t\r\n");
      out.write("\t\t\t\t\t\t<input class=\"easyui-textbox\" name=\"name\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道别名：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\t\t\r\n");
      out.write("\t\t\t\t\t\t<input class=\"easyui-textbox\" name=\"alias\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>是否参与推荐首投返利：</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select id=\"addIsParticipation\" name=\"isParticipation\" style=\"width:150px;\" class=\"easyui-combobox\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value='0'>参与</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value='1'>不参与</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t<div id=\"addDrChannelInfoBtn\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"addDrChannelInfo()\">添加</a>\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeDialog()\">取消</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"updateDrChannelInfoDialog\" class=\"easyui-dialog\" title=\"渠道修改\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#updateDrChannelInfoBtn'\" style=\"width:400px;height:190px;padding:5px;\">\r\n");
      out.write("\t\t<form id=\"updateDrChannelInfoForm\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"drChannelInfoId\"  name=\"id\"/>\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道号：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"drChannelInfoCode\" type=\"text\" name=\"code\" class=\"easyui-textbox\" data-options=\"required:true\" disabled=\"disabled\" />\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道名称：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\t\t\r\n");
      out.write("\t\t\t\t\t\t<input id=\"drChannelInfoName\" class=\"easyui-textbox\" name=\"name\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t渠道别名：\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\t\t\r\n");
      out.write("\t\t\t\t\t\t<input id=\"drChannelInfoAlias\" class=\"easyui-textbox\" name=\"alias\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>是否参与推荐首投返利：</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select id=\"updateIsParticipation\" name=\"isParticipation\" style=\"width:150px;\" class=\"easyui-combobox\">\r\n");
      out.write("\t\t\t\t\t\t\t<option  value='0'>参与</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option  value='1'>不参与</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t<div id=\"updateDrChannelInfoBtn\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"updateDrChannelInfo()\">修改</a>\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeDialog()\">取消</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"uploadFileDialog\" class=\"easyui-dialog\" title=\"导入关键字\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#uploadFileDialogBtn'\" style=\"width:400px;height:160px;padding:5px;\">\r\n");
      out.write("\t\t<form id=\"uploadFileDialogForm\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"uploadFileDialogId\"  name=\"id\"/>\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"uploadFile\" type=\"file\" name=\"file\" onchange=\"verifyFile(this)\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t<div id=\"uploadFileDialogBtn\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"uploadChannelKeyWord()\">上传</a>\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeDialog()\">取消</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"drChannelKeyWordsTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"drChannelKeyWordsForm\">\r\n");
      out.write("\t  \t\t<input type=\"hidden\" id=\"drChannelKeyWordCode\"  name=\"code\"/>\r\n");
      out.write("\t  \t\t关键字:<input id=\"searchKeyWord\" name=\"keyword\" class=\"easyui-textbox\"  size=\"15\" style=\"width:100px\"/>\r\n");
      out.write("\t    \t<a id=\"searchDrChannelKeyWord\" href=\"javascript:searcheKeyWordsListBtn()\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    </form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"keyWordListDialog\" class=\"easyui-dialog\" title=\"查看关键字\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false\" style=\"width:80%;height:70%;padding:5px;\">\r\n");
      out.write("\t\t<table id=\"drChannelKeyWordsList\"\r\n");
      out.write("\t\t\tclass=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("\t\t\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t\t\t    fitColumns:true,\r\n");
      out.write("\t\t\t    method:'post',rownumbers:true, \r\n");
      out.write("\t\t\t    pagination:true,toolbar:'#drChannelKeyWordsTools'\">\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t    \t<th data-options=\"field:'id'\" hidden=\"true\">序号</th>\r\n");
      out.write("\t\t\t    \t<th data-options=\"field:'code'\" width=\"15%\">渠道号</th>\r\n");
      out.write("\t\t\t        <th data-options=\"field:'keyword'\" width=\"15%\">关键字</th>\r\n");
      out.write("\t\t\t        <th data-options=\"field:'kCode'\" width=\"15%\">关键字号</th>\r\n");
      out.write("\t\t\t        <th data-options=\"field:'status'\" width=\"5%\" formatter=\"formatStatus\">状态</th>\r\n");
      out.write("\t\t\t       \t<th data-options=\"field:'name'\" width=\"10%\">添加人</th>\r\n");
      out.write("\t\t\t        <th data-options=\"field:'addTime'\" width=\"12%\" formatter=\"formatDateBoxFull\">添加时间</th>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    </thead>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//重置按钮\r\n");
      out.write("\t$('#resetDrChannelInfo').click(function(){\r\n");
      out.write("\t\t$(\"#drChannelInfoForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#drChannelInfoList\").datagrid(\"load\", {});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchDrChannelInfo').click(function(){\r\n");
      out.write(" \t\t$('#drChannelInfoList').datagrid({\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\tcode: $('#searchDrChannelInfoCode').val(),\r\n");
      out.write("\t\t\t\tname: $('#searchDrChannelInfoName').val(),\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}); \r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//添加基本操作链接\r\n");
      out.write("\tfunction formatOper(val,row,index){  \r\n");
      out.write("\t\treturn\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"updateDrChannelInfoBtn('+index+')\">修改</a>&nbsp;&nbsp;&nbsp;'+\r\n");
      out.write("\t\t\t\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"uploadFile('+index+')\">导入关键字</a>&nbsp;&nbsp;&nbsp;'+\r\n");
      out.write("\t\t\t\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"keyWordsListBtn('+index+')\">查看关键字</a>';\r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\t//跳转添加页面\r\n");
      out.write("\tfunction addDrChannelInfoBtn(){  \r\n");
      out.write("\t\t$(\"#addDrChannelInfoForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#addDrChannelInfoDialog\").dialog(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//添加渠道\r\n");
      out.write("\tfunction addDrChannelInfo(){  \r\n");
      out.write("\t\tvar validate = $(\"#addDrChannelInfoForm\").form(\"validate\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!validate){\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("   \t\t$.ajax({\r\n");
      out.write("          \turl: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/addDrChannelInfo.do\",\r\n");
      out.write("            type: 'POST',\r\n");
      out.write("            data:$(\"#addDrChannelInfoForm\").serialize(),  \r\n");
      out.write("            success:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.msg);\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#addDrChannelInfoDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("        });\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//关闭添加渠道窗口\r\n");
      out.write("\tfunction closeDialog(){  \r\n");
      out.write("\t\t$(\"#drChannelInfoList\").datagrid(\"reload\");\r\n");
      out.write("\t\t$(\"#updateDrChannelInfoDialog\").dialog(\"close\");\r\n");
      out.write("\t\t$(\"#uploadFileDialog\").dialog(\"close\");\r\n");
      out.write("\t\t$(\"#addDrChannelInfoDialog\").dialog(\"close\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//打开dialog\r\n");
      out.write("\tfunction updateDrChannelInfoBtn(index){  \r\n");
      out.write("\t\t$('#drChannelInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drChannelInfoList').datagrid('getSelected'); \r\n");
      out.write("\t\tvar url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/queryDrChannelInfo.do?id=\"+row.id;\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: url,\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoId\").val(result.map.drChannelInfo.id);\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoCode\").textbox('setValue',result.map.drChannelInfo.code);\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoName\").textbox('setValue',result.map.drChannelInfo.name);\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoAlias\").textbox('setValue',result.map.drChannelInfo.alias);\t\r\n");
      out.write("\t\t\t\t\t$(\"#updateIsParticipation\").combobox('setValue',result.map.drChannelInfo.isParticipation);\r\n");
      out.write("\t\t\t\t\t$(\"#updateDrChannelInfoDialog\").dialog(\"open\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t  \t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//修改渠道\r\n");
      out.write("\tfunction updateDrChannelInfo(){  \r\n");
      out.write("\t\tvar validate = $(\"#updateDrChannelInfoForm\").form(\"validate\");\r\n");
      out.write("\t\tif(!validate){\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("   \t\t$.ajax({\r\n");
      out.write("          \turl: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/updateDrChannelInfo.do\",\r\n");
      out.write("            type: 'POST',\r\n");
      out.write("            data:$(\"#updateDrChannelInfoForm\").serialize(),  \r\n");
      out.write("            success:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.msg);\r\n");
      out.write("\t\t\t\t\t$(\"#drChannelInfoList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#updateDrChannelInfoDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("        });\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t //更新是否参与推荐首投返利活动\r\n");
      out.write("\tfunction updateDrChannelInfoIsParticipation(index){\r\n");
      out.write("\t\t$('#drChannelInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drChannelInfoList').datagrid('getSelected'); \r\n");
      out.write("\t\t$.messager.confirm('操作提示', '你确定更改吗？', function(r){\r\n");
      out.write("\t\t\tif(r){\r\n");
      out.write("\t\t\t\tvar url = \"../channel/updateDrChannelInfoIsParticipation.do?id=\"+row.id+\"&isParticipation=\"+row.isParticipation;\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\turl: url,\r\n");
      out.write("\t\t\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\t\t\tsuccess:function(){\r\n");
      out.write("\t\t\t\t\t\t$('#drChannelInfoList').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"操作提示\", \"操作成功\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t  \t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\t//文件上传dialog\r\n");
      out.write("\tfunction uploadFile(index){\r\n");
      out.write("\t\t$(\"#uploadFileDialogForm\").form(\"reset\");\r\n");
      out.write("\t\t$('#drChannelInfoList').datagrid('selectRow',index);\r\n");
      out.write("\t\tvar row = $('#drChannelInfoList').datagrid('getSelected');\r\n");
      out.write("\t\t$(\"#uploadFileDialogId\").val(row.id);\r\n");
      out.write("\t\t$(\"#uploadFileDialog\").dialog(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\t//验证文件\r\n");
      out.write("\tfunction verifyFile(obj) {\r\n");
      out.write("\t\tif (obj.value == \"\") {  \r\n");
      out.write("\t\t\t$.messager.alert(\"提示信息\",\"请上传文件\");\r\n");
      out.write("\t        return false;  \r\n");
      out.write("\t    } \r\n");
      out.write("        if (! /\\.(xls)$/.test(obj.value)) {  \r\n");
      out.write("        \t$.messager.alert(\"提示信息\",\"文件类型必须是.xls\");\r\n");
      out.write("            obj.value = \"\";  \r\n");
      out.write("            return false;  \r\n");
      out.write("        }\r\n");
      out.write("    \treturn true;  \r\n");
      out.write("\t}\r\n");
      out.write("\t//导入关键字\r\n");
      out.write("\tfunction uploadChannelKeyWord(){\r\n");
      out.write("\t\t$(\"#uploadFileDialogForm\").ajaxSubmit({\r\n");
      out.write("\t\t\turl:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/uploadChannelKeyWord.do\",\r\n");
      out.write("\t\t\ttype:\"POST\",\r\n");
      out.write("\t\t\tdata:$(\"#uploadFileDialogForm\").serialize(),\r\n");
      out.write("\t\t\tsuccess: function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.msg);\r\n");
      out.write("\t\t\t\t\t$(\"#uploadFileDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//关键字查询\r\n");
      out.write("\tfunction keyWordsListBtn(index){\r\n");
      out.write("\t\t$(\"#drChannelKeyWordsForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#keyWordListDialog\").dialog(\"open\");\r\n");
      out.write("\t\t$('#drChannelInfoList').datagrid('selectRow',index);\r\n");
      out.write("\t\tvar row = $('#drChannelInfoList').datagrid('getSelected');\r\n");
      out.write("\t\t$(\"#drChannelKeyWordCode\").val(row.code);\r\n");
      out.write("\t\t$('#drChannelKeyWordsList').datagrid({\r\n");
      out.write("\t\t    url: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/queryChannelKeyword.do\",\r\n");
      out.write("\t\t    queryParams:{\r\n");
      out.write("\t\t        code:$(\"#drChannelKeyWordCode\").val()\r\n");
      out.write("\t\t    }\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction searcheKeyWordsListBtn(){\r\n");
      out.write("\t\t$(\"#drChannelKeyWordsList\").datagrid({\r\n");
      out.write("\t\t    url: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/queryChannelKeyword.do\",\r\n");
      out.write("\t\t    queryParams:{\r\n");
      out.write("\t\t        code:$(\"#drChannelKeyWordCode\").val(),\r\n");
      out.write("\t\t        keyword:$(\"#searchKeyWord\").val()\r\n");
      out.write("\t\t    }\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//更改渠道状态\r\n");
      out.write("\tfunction updateDrChannelInfoStatus(index){\r\n");
      out.write("\t\t$('#drChannelInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drChannelInfoList').datagrid('getSelected'); \r\n");
      out.write("\t\t$.messager.confirm('操作提示', '你确定更改吗？', function(r){\r\n");
      out.write("\t\t\tif(r){\r\n");
      out.write("\t\t\t\tvar url = \"../channel/updateDrChannelInfoStatus.do?id=\"+row.id+\"&status=\"+row.status;\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\turl: url,\r\n");
      out.write("\t\t\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\t\t\tsuccess:function(){\r\n");
      out.write("\t\t\t\t\t\t$('#drChannelInfoList').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"操作提示\", \"操作成功\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t  \t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t//更改关键字状态\r\n");
      out.write("\tfunction updateDrChannelKeyWordStatus(id,status){\r\n");
      out.write("\t\t$.messager.confirm('操作提示', '你确定更改吗？', function(r){\r\n");
      out.write("\t\t\tif(r){\r\n");
      out.write("\t\t\t\tvar url = \"../channel/updateKeyWordStatus.do?id=\"+id+\"&status=\"+status;\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\turl: url,\r\n");
      out.write("\t\t\t\t\ttype:\"post\",\r\n");
      out.write("\t\t\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\t\t\tsuccess:function(result){\t\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"操作提示\", result.msg);\r\n");
      out.write("\t\t\t\t\t\t$(\"#drChannelKeyWordsList\").datagrid({\r\n");
      out.write("\t\t\t\t\t\t    url: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/channel/queryChannelKeyword.do\",\r\n");
      out.write("\t\t\t\t\t\t    queryParams:{\r\n");
      out.write("\t\t\t\t\t\t        code:$(\"#drChannelKeyWordCode\").val(),\r\n");
      out.write("\t\t\t\t\t\t        keyword:$(\"#searchKeyWord\").val()\r\n");
      out.write("\t\t\t\t\t\t    }\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t  \t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\t//添加状态链接\r\n");
      out.write("\tfunction formatStatus(value,row,index){\r\n");
      out.write("\t\tif(row.status == \"1\"){\r\n");
      out.write("\t\t\tif(row.keyword==null||row.keyword==\"\"||typeof(row.keyword)==\"undefind\"){\r\n");
      out.write("\t\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelInfoStatus('+index+')\">已生效</a>';\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelKeyWordStatus('+row.id+',0)\">有效</a>';\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tif(row.keyword==null||row.keyword==\"\"||typeof(row.keyword)==\"undefind\"){\r\n");
      out.write("\t\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelInfoStatus('+index+')\">已失效</a>';\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelKeyWordStatus('+row.id+',1)\">失效</a>';\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction formatIsParticipation(value,row,index){\r\n");
      out.write("\t\tif(value == \"1\"){\r\n");
      out.write("\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelInfoIsParticipation('+index+')\">不参与</a>';\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn '<a href=\"#\" onclick=\"updateDrChannelInfoIsParticipation('+index+')\">参与</a>';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t} \r\n");
      out.write("\t$.extend(\r\n");
      out.write("\t\t\t$.fn.validatebox.defaults.rules,\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tnoChinese : {\r\n");
      out.write("\t\t\t\t\tvalidator : function(value) {\r\n");
      out.write("\t\t\t\t\t\treturn /^[^\\u4e00-\\u9fa5]{0,}$/.test(value);\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\tmessage : '不能输入汉字！'\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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