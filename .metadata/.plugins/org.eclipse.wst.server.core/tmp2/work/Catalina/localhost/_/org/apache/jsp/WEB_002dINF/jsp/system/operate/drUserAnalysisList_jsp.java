/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-04-03 07:40:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.operate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class drUserAnalysisList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/operate/../../common/include/util.jsp", Long.valueOf(1521710765619L));
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1521710765618L));
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
      out.write("\t<table id=\"userAnalysisList\" title=\"基本运营统计\"\r\n");
      out.write("\tclass=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '../userAnalysis/userAnalysisList.do',\r\n");
      out.write("\t    method:'post',rownumbers:true,\r\n");
      out.write("\t    pagination:true,toolbar:'#userAnalysisTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("\t        <th data-options=\"field:'newUser'\" width=\"9%\">新增注册用户</th>\r\n");
      out.write("\t        <th data-options=\"field:'totalUser'\" width=\"9%\" >累计注册用户</th>\t     \r\n");
      out.write("\t       \t<th data-options=\"field:'newInvestUser'\" width=\"9%\">新增投资用户</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'totalInvestUser'\" width=\"9%\">累计投资用户</th>\t      \t\r\n");
      out.write("\t        <th data-options=\"field:'newInvestAmount'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">新增投资额</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'totalInvestAmount'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">累计投资额</th>\r\n");
      out.write("\t        <th data-options=\"field:'pendRepaymentAmount'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">待还款金额</th>\r\n");
      out.write("\t        <th data-options=\"field:'crush'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">充值总额</th>\r\n");
      out.write("\t        <th data-options=\"field:'carry'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">提现总额</th>\r\n");
      out.write("\t        <th data-options=\"field:'remainAmount'\" width=\"9%\" styler=\"styleColor\" formatter=\"formatAmount\">平台存留</th>\r\n");
      out.write("\t        <th data-options=\"field:'avgInvestAmount'\" width=\"10%\" styler=\"styleColor\" formatter=\"formatAmount\">用户平均投资额</th>\t\t        \r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    \r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"userAnalysisTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"userAnalysisForm\">\r\n");
      out.write("\t  \t\t查询时间段:<input id=\"searchUserAnalysisStartDate\" name=\"startDate\" class=\"easyui-datebox start\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t至<input id=\"searchUserAnalysisEndDate\" name=\"endDate\" class=\"easyui-datebox end\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t  \t\t<input type=\"radio\"  name=\"timeType\" value=\"2\" onclick=\"changeDate('2')\">最近一周</input>\r\n");
      out.write("\t  \t\t<input type=\"radio\"  name=\"timeType\" value=\"1\" onclick=\"changeDate('1')\">最近一个月 </input>\r\n");
      out.write("\t  \t\t<input type=\"radio\"  name=\"timeType\" value=\"3\" onclick=\"changeDate('3')\">最近三个月</input>\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t    \t<a id=\"searchUserAnalysisBtn\" href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    \t<a id=\"resetUserAnalysisBtn\" href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">重置</a>\r\n");
      out.write("\t    </form>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//重置按钮\r\n");
      out.write("\t$('#resetUserAnalysisBtn').click(function(){\r\n");
      out.write("\t\t$(\"#userAnalysisForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#userAnalysisList\").datagrid(\"load\", {});\r\n");
      out.write("\t});\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchUserAnalysisBtn').click(function(){\r\n");
      out.write(" \t\t$('#userAnalysisList').datagrid({\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\tstartDate: $('#searchUserAnalysisStartDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\tendDate: $('#searchUserAnalysisEndDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\ttimeType:$(\"input[name='timeType']:checked\").val()\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}); \r\n");
      out.write("\t});\r\n");
      out.write("\tfunction changeDate(type){\r\n");
      out.write("\t\tvar today = getNowFormatDate();\r\n");
      out.write("\t\tvar strtDateParam;\r\n");
      out.write("\t\tvar endDateParam;\r\n");
      out.write("\t\tswitch(type){\r\n");
      out.write("\t\tcase '1' :strtDateParam = getPreMonth(today,1);break;\r\n");
      out.write("\t\tcase '3' :strtDateParam = getPreMonth(today,3);break;\r\n");
      out.write("\t\tcase '2' :strtDateParam = getBeforeDate(7);break;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tendDateParam = today;\r\n");
      out.write("\t\t $('.textbox:eq(0) input').val(strtDateParam);\r\n");
      out.write("\t\t $('.textbox:eq(1) input').val(endDateParam);\r\n");
      out.write("\t}\r\n");
      out.write("\t//获取前几个月\r\n");
      out.write("\tfunction getPreMonth(date,count) {\r\n");
      out.write("\t    var arr = date.split('-');\r\n");
      out.write("\t    var year = arr[0]; //获取当前日期的年份\r\n");
      out.write("\t    var month = arr[1]; //获取当前日期的月份\r\n");
      out.write("\t    var day = arr[2]; //获取当前日期的日\r\n");
      out.write("\t    var days = new Date(year, month, 0);\r\n");
      out.write("\t    days = days.getDate(); //获取当前日期中月的天数\r\n");
      out.write("\t    var year2 = year;\r\n");
      out.write("\t    var month2 = parseInt(month) - count;\r\n");
      out.write("\t    if (month2 == 0) {\r\n");
      out.write("\t        year2 = parseInt(year2) - count;\r\n");
      out.write("\t        month2 = 12;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    var day2 = day;\r\n");
      out.write("\t    var days2 = new Date(year2, month2, 0);\r\n");
      out.write("\t    days2 = days2.getDate();\r\n");
      out.write("\t    if (day2 > days2) {\r\n");
      out.write("\t        day2 = days2;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    if (month2 < 10) {\r\n");
      out.write("\t        month2 = '0' + month2;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    var t2 = year2 + '-' + month2 + '-' + day2;\r\n");
      out.write("\t    return t2;\r\n");
      out.write("\t}\r\n");
      out.write("\t//获取当前日期\r\n");
      out.write("\tfunction getNowFormatDate() {\r\n");
      out.write("\t    var date = new Date();\r\n");
      out.write("\t    var seperator1 = \"-\";\r\n");
      out.write("\t    var seperator2 = \":\";\r\n");
      out.write("\t    var month = date.getMonth() + 1;\r\n");
      out.write("\t    var strDate = date.getDate();\r\n");
      out.write("\t    if (month >= 1 && month <= 9) {\r\n");
      out.write("\t        month = \"0\" + month;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    if (strDate >= 0 && strDate <= 9) {\r\n");
      out.write("\t        strDate = \"0\" + strDate;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;\r\n");
      out.write("\t    return currentdate;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getBeforeDate(n){\r\n");
      out.write("\t    var n = n;\r\n");
      out.write("\t    var d = new Date();\r\n");
      out.write("\t    var year = d.getFullYear();\r\n");
      out.write("\t    var mon=d.getMonth()+1;\r\n");
      out.write("\t    var day=d.getDate();\r\n");
      out.write("\t    if(day <= n){\r\n");
      out.write("           if(mon>1) {\r\n");
      out.write("              mon=mon-1;\r\n");
      out.write("           }\r\n");
      out.write("          else {\r\n");
      out.write("            year = year-1;\r\n");
      out.write("            mon = 12;\r\n");
      out.write("           }\r\n");
      out.write("\t     }\r\n");
      out.write("          d.setDate(d.getDate()-n);\r\n");
      out.write("          year = d.getFullYear();\r\n");
      out.write("          mon=d.getMonth()+1;\r\n");
      out.write("          day=d.getDate();\r\n");
      out.write("\t      s = year+\"-\"+(mon<10?('0'+mon):mon)+\"-\"+(day<10?('0'+day):day);\r\n");
      out.write("\t      return s;\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
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
