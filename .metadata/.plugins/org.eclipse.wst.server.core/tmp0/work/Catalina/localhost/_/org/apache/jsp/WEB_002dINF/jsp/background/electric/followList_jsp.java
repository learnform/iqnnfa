/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-05-30 08:12:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.background.electric;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class followList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/jsp/background/electric/../../common/util.jsp", Long.valueOf(1527667097148L));
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ResourceBundle res = ResourceBundle.getBundle("env");

      out.write("\r\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/validatebox.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/common.js\"></script>");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/themes/default/easyui.css\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyUI/themes/icon.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery.form.js\"></script>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"ztth_load\"></div>\r\n");
      out.write("\t<div align=\"center\">用户姓名：<span id=\"userName\"></span>\r\n");
      out.write("\t&nbsp;&nbsp;&nbsp;手机号：<input type=\"text\" id=\"field\" style=\"width: 40px;\" onchange=\"fieldPhone()\"/><span id=\"mobilePhone\"></span>\r\n");
      out.write("\t<input type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${mobilePhone}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" id = \"phone\"/>\r\n");
      out.write("\t<input type=\"hidden\" id=\"huid\" name=\"uid\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${uid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("\t<input type=\"hidden\" id = \"callerId\"/>\r\n");
      out.write("\t</div><br>\r\n");
      out.write("\t<table id=\"crmstaffList\" title=\"电销专员\" \r\n");
      out.write("\tclass=\"easyui-datagrid\" style=\"height:60%;\" remoteSort=\"true\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/background/electric/followList.html?uid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${uid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',\r\n");
      out.write("\t    method:'post',rownumbers:true, \r\n");
      out.write("\t    pagination:true,toolbar:'#followTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("<!-- \t    \t<th data-options=\"checkbox:true\"></th> -->\r\n");
      out.write("\t    \t<th data-options=\"field:'uid'\" width=\"50px\">序号</th> \r\n");
      out.write("\t        <th data-options=\"field:'note'\"  width=\"150px\">沟通记录</th>\r\n");
      out.write("\t        <th data-options=\"field:'statusTo'\"  width=\"100px\">跟进状态</th>\r\n");
      out.write("\t        <th data-options=\"field:'userRealname'\"  width=\"100px\">责任人</th>\r\n");
      out.write("\t        <th data-options=\"field:'advanceDate'\"  width=\"100px\" formatter=\"formatDateBox\">预约时间</th>\r\n");
      out.write("\t        <th data-options=\"field:'addTime'\"  width=\"100px\"  formatter=\"formatDateBoxFull\">记录时间</th>\r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"add\" class=\"easyui-dialog\" title=\"新增沟通记录\" data-options=\"iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true\" style=\"width:400px;height:200px;padding:10px;\">\r\n");
      out.write("\t\t<form id=\"staffListForm\" method=\"post\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"right\">跟进流程状态：</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<select id=\"sta\" name=\"status\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"0\">未接听</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">待联系</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">持续跟进</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"3\">高意向</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"4\">成功</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"5\">失败</option>\r\n");
      out.write("\t\t\t\t\t\t </select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"right\">预约时间：</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"left\"><input id=\"advanceDate\" name=\"advanceDate\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"right\">记录：</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\"><textarea id=\"note\" name=\"note\" style=\"width: 200px;height: 50px;\"></textarea>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"uid\" id=\"uid\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td colspan=\"2\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"saveFollow()\">保存</a>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"followTools\" style=\"padding:5px;\">\r\n");
      out.write("\t\t\t\t<a id=\"search\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"clickAdd()\" iconCls=\"icon-add\">新增</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("<script>\r\n");
      out.write("function formatDateBox(value) {  \r\n");
      out.write("    if (value == null || value == '') {  \r\n");
      out.write("        return '';  \r\n");
      out.write("    }  \r\n");
      out.write("    var dt = parseToDate(value);  \r\n");
      out.write("    return dt.format(\"yyyy-MM-dd\");  \r\n");
      out.write("}  \r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction saveFollow(){\r\n");
      out.write("\t\t\tvar uid = $(\"#huid\").val();\r\n");
      out.write("\t\t\tvar note = $(\"#note\").val();\r\n");
      out.write("\t\t\tvar status=   $(\"#sta option:selected\").val();\r\n");
      out.write("\t\t\tvar advanceDate = $('#advanceDate').combobox('getValue');\r\n");
      out.write("\t\t\tvar parameter={\r\n");
      out.write("\t\t\t\t\tuid:uid,\r\n");
      out.write("\t\t\t\t\tnote:note,\r\n");
      out.write("\t\t\t\t\tadvanceDate:advanceDate,\r\n");
      out.write("\t\t\t\t\tstatus:status\r\n");
      out.write("\t    \t    };\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/background/electric/add.html?\",\r\n");
      out.write("\t\t\t\ttype:\"POST\",\r\n");
      out.write("\t\t\t\tdata:parameter,\r\n");
      out.write("\t\t\t\tsuccess:function(isFlag){\r\n");
      out.write("\t\t\t\t\tif(isFlag==0){\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"提示信息\",\"新增跟进记录成功！\",\"\",function(){\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#add\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#w\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"提示信息\",\"新增跟进记录失败！\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(function(){\r\n");
      out.write("\t\t\tvar userName=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("\t\t\tif(userName==null||userName==\"undefined\"||userName==\"null\"){\r\n");
      out.write("\t\t\t\tuserName=\"未知\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t$(\"#userName\").text(userName);\r\n");
      out.write("\t \t\t$(\"#mobilePhone\").text('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${mobile}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("');\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction clickAdd(){\r\n");
      out.write("\t\t\t$(\"#uid\").val($(\"#huid\").val());\r\n");
      out.write("\t\t\t$('#add').dialog('open');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction fieldPhone(){\r\n");
      out.write("\t\t\t$(\"#phone\").val($(\"#field\").val()+$(\"#phone\").val());\r\n");
      out.write("\t\t\t $('#ztth_load').load('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/ztth_wincall.jsp');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar userId=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("\t\t//角色key\r\n");
      out.write("\t\tvar roleKey=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${roleKey}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("\t\t//上级\r\n");
      out.write("\t\tvar leaderId=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${leaderUid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("\t\tvar callerID;\r\n");
      out.write("// \t\tif(userId == 1){\r\n");
      out.write("\r\n");
      out.write("// \t\t}\r\n");
      out.write("\t\tif(userId == 6 || leaderId == 6){\r\n");
      out.write("\t\t\tcallerID= ");
      out.print(res.getString("system.leader.callerID1"));
      out.write(";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(userId == 7 || leaderId == 7){\r\n");
      out.write("\t\t\tcallerID= ");
      out.print(res.getString("system.leader.callerID2"));
      out.write(";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#callerId\").val(callerID);\r\n");
      out.write("\t    var ag_num_value = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${agNum}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"; //动态设置变量ag_num_value(坐席工号);\r\n");
      out.write("\t    var ag_phone_value = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${agentPhone}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"; //动态设置变量ag_phone_value(分机号码)\r\n");
      out.write("\t    $('#ztth_load').load('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.servletContext.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/ztth_wincall.jsp');\r\n");
      out.write("\t</script>\r\n");
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