/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-04-11 07:18:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.sys.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class userList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/sys/user/../../../common/include/util.jsp", Long.valueOf(1523153962925L));
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

      out.write('﻿');

    response.setHeader("Content-Type","text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    pageContext.setAttribute("pageEncoding","utf-8");
    
	String apppath = request.getContextPath();
	request.setAttribute("apppath", apppath);
	
	Date d = new Date();
	String tabid = "tabid"+d.getTime();
	request.setAttribute("tabid", tabid);

      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html lang=\"zh-CN\">\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"utf-8\">\r\n");
      out.write("\t");
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
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$(\"#");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" #userList\").datagrid({\r\n");
      out.write("\t\t\ttitle:\"用户列表\",\r\n");
      out.write("\t\t\twidth:\"100%\",\r\n");
      out.write("\t\t\tsingleSelect:true,\r\n");
      out.write("\t\t\tfitColumns:true,\r\n");
      out.write("\t\t\turl:'../user/userList.do',\r\n");
      out.write("\t\t\tcolumns:[[\r\n");
      out.write("\t\t\t\t{title:\"userKy\",field:\"userKy\",hidden:true},\r\n");
      out.write("\t\t\t\t{title:\"登陆ID\",field:\"loginId\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"专属ID\",field:\"recommCodes\",width:$(this).width() * 0.05,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"姓名\",field:\"name\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"手机\",field:\"mobile\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"用户角色\",field:\"roleName\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"邮箱\",field:\"email\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"地址\",field:\"address\",width:$(this).width() * 0.1,align:\"left\"},\r\n");
      out.write("\t\t\t\t{title:\"注册时间\",field:\"registertime\",width:$(this).width() * 0.15,align:\"left\",\r\n");
      out.write("\t\t\t\t\tformatter:function(value,rows){\r\n");
      out.write("\t\t\t\t\t\treturn new Date(parseInt(rows.registertime)).toLocaleString().substr(0,20);     \r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\t{title:\"状态\",field:\"status\",width:$(this).width() * 0.05,align:\"left\",\r\n");
      out.write("\t\t\t\t\tformatter:function(value,rows){\r\n");
      out.write("\t\t\t\t\t\tif(rows.status==\"1\"){\r\n");
      out.write("\t\t\t\t\t\t\treturn \"正常\";\r\n");
      out.write("\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\treturn \"禁用\";\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}},\r\n");
      out.write("\t\t\t]],\r\n");
      out.write("\t\t\tpagination:true,\r\n");
      out.write("\t\t\trownumbers:true,\r\n");
      out.write("\t\t\ttoolbar:\"#tb\"\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction searchForm(){\r\n");
      out.write("\t\tvar o = {};\r\n");
      out.write("\t\t $.each($(\"#queryForm\").form().serializeArray(), function(index) {\r\n");
      out.write("\t\t\t\tif (o[this['name']]) {\r\n");
      out.write("\t\t\t\t\to[this['name']] = o[this['name']] + \",\" + this['value'];\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\to[this['name']] = this['value'];\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t $(\"#");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" #userList\").datagrid('load', o);\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction edit(){\r\n");
      out.write("\t\tvar dg = $(\"#");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" #userList\");\r\n");
      out.write("\t\tvar row  = dg.datagrid(\"getSelected\");\r\n");
      out.write("\t\tif(row == null || row ==undefined){\r\n");
      out.write("\t\t\t$.messager.alert(\"提示\",\"请选择需要编辑的行！\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#window\").window({\r\n");
      out.write("\t\t\ttitle:\"用户修改\",\r\n");
      out.write("\t\t\thref:\"../user/tomodify.do?userKy=\"+row.userKy+\"&tabid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#window\").window(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction add(){\r\n");
      out.write("\t\t$(\"#window\").window({\r\n");
      out.write("\t\t\ttitle:\"用户添加\",\r\n");
      out.write("\t\t\thref:\"../user/toAdd.do?tabid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#window\").window(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction closeWindow(){\r\n");
      out.write("\t\t$(\"#window\").window(\"close\");\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"width:100%;height:100%\">\r\n");
      out.write("<div id=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tabid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" style=\"width:99.9%;height:99%;\">\r\n");
      out.write("\t<table id=\"userList\" style=\"width:99.9%;height:99%;\"></table>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"tb\" style=\"padding:5px;height:auto\">\r\n");
      out.write("\t\t<div style=\"margin-bottom:5px\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" plain=\"true\" onclick=\"add()\">添加</a>\r\n");
      out.write("\t\t\t<a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-edit\" plain=\"true\" onclick=\"edit()\">编辑</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div>\r\n");
      out.write("\t\t\t<form id=\"queryForm\">\r\n");
      out.write("\t\t\t姓名: <input class=\"easyui-textbox\" name=\"name\" style=\"width:150px\">\r\n");
      out.write("\t\t\t登陆ID: <input class=\"easyui-textbox\" name=\"loginId\" style=\"width:150px\">\r\n");
      out.write("\t\t\t状态: \r\n");
      out.write("\t\t\t<select name=\"status\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t<option value=\"\">全部</option>\r\n");
      out.write("\t\t\t\t<option value=\"1\">可用</option>\r\n");
      out.write("\t\t\t\t<option value=\"0\">禁用</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t\t<a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\" onclick=\"searchForm()\">查询</a>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"window\" class=\"easyui-window\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false\" style=\"width:300px;height:350px;padding:10px;\">\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
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
