/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-05-28 03:44:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.sys.access;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1523153962924L));
    _jspx_dependants.put("/WEB-INF/jsp/system/sys/access/../../../common/include/util.jsp", Long.valueOf(1523153962925L));
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
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    ");
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
      out.write("<table id=\"sysIpList\" title=\"IP管理\"\r\n");
      out.write("       class=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("       data-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '../access/getAccessControlList.do',\r\n");
      out.write("\t    method:'post',rownumbers:true, \r\n");
      out.write("\t    pagination:true,toolbar:'#access_tools'\">\r\n");
      out.write("    <thead>\r\n");
      out.write("    <tr>\r\n");
      out.write("        <th data-options=\"field:'id'\" hidden=\"true\">主键</th>\r\n");
      out.write("        <th data-options=\"field:'ip'\" width=\"10%\">IP地址</th>\r\n");
      out.write("         <th data-options=\"field:'name'\" width=\"10%\">创建人</th>\r\n");
      out.write("        <th data-options=\"field:'addTime'\" formatter=\"formatDateBoxFull\" width=\"20%\">创建时间</th>\r\n");
      out.write("        <th data-options=\"field:'remark'\" width=\"25%\">备注</th>\r\n");
      out.write("        <th data-options=\"field:'_operate', align:'center'\" width=\"10%\" formatter=\"formatOper\">操作</th>\r\n");
      out.write("    </tr>\r\n");
      out.write("    </thead>\r\n");
      out.write("</table>\r\n");
      out.write("<div id=\"access_tools\" style=\"padding:5px;height:20px \">\r\n");
      out.write("    <form id=\"selectSysIpForm\">\r\n");
      out.write("    \tIP地址:<input id=\"searchInfoByIp\" name=\"ip\" class=\"easyui-textbox\" size=\"15\"\r\n");
      out.write("                    style=\"width:200px\"/>\r\n");
      out.write("        &nbsp;&nbsp;\r\n");
      out.write("        <a id=\"searchActivityBtn\" href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("        <a id=\"resetDrProductInfo\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">重置</a>\r\n");
      out.write("        &nbsp;&nbsp;\r\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" onclick=\"addSysIPDialog()\">新增IP</a>\r\n");
      out.write("    </form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!-- 新增IP -->\r\n");
      out.write("\t<div id=\"addSysIPDialog\" class=\"easyui-dialog\" title=\"新增IP\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addSysIpBtn'\"\r\n");
      out.write("\t\tstyle=\"width:450px;height:250px;padding:40px;\">\r\n");
      out.write("\t\t<form id=\"addSysIPForm\">\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<!-- <input type=\"text\" name=\"type\" hidden=\"hidden\" value=\"1\" readonly=\"readonly\"/> -->\r\n");
      out.write("\t\t\t\t<tr style=\"height: 8px;\">\r\n");
      out.write("\t\t\t\t\t<td  style=\"width:70px\">IP地址:</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"ip\" class=\"easyui-textbox\" data-options=\"required:true\"/></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr style=\"height: 8px;\">\r\n");
      out.write("\t\t\t\t<td style=\"width:70px\">备注:</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"remark\" class=\"easyui-textbox\" data-options=\"required:false\" />\r\n");
      out.write("\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t<div id=\"#addSysIpBtn\" align=\"center\" style=\"margin-top:10px;\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" onclick=\"addSysIp()\">添加</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchActivityBtn').click(function(){\r\n");
      out.write(" \t\t$('#sysIpList').datagrid({\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\tip:$('#searchInfoByIp').val(),\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}); \r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t//删除ip操作\r\n");
      out.write("\tfunction delSysIp(index){\r\n");
      out.write("\t\t$('#sysIpList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#sysIpList').datagrid('getSelected'); \r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t     \turl: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/access/delSysIp.do?id=\"+row.id+\"&ip=\"+row.ip,\r\n");
      out.write("\t     \tdataType:\"json\",  \r\n");
      out.write("\t       \tsuccess:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.msg);\r\n");
      out.write("\t\t\t\t\t$(\"#sysIpList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#addSysIPDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t   \t});\r\n");
      out.write("\t}\r\n");
      out.write("    //添加基本操作链接\r\n");
      out.write("    function formatOper(val, row, index) {\r\n");
      out.write("        return '<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"delSysIp('+index+')\">删除</a>';\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\t//跳转到IP添加页面\r\n");
      out.write("\tfunction addSysIPDialog(){  \r\n");
      out.write("\t\t$(\"#addSysIPForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#addSysIPDialog\").dialog(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\t//添加ip操作\r\n");
      out.write("\tfunction addSysIp(){\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("         \turl: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/access/addSysIp.do\",\r\n");
      out.write("           \ttype: 'POST',\r\n");
      out.write("           \tdata:$(\"#addSysIPForm\").serialize(),  \r\n");
      out.write("           \tsuccess:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.msg);\r\n");
      out.write("\t\t\t\t\t$(\"#sysIpList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#addSysIPDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("       \t});\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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