/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-04-11 07:25:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.finance;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class drCompanyFundsLogList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/finance/../../common/include/util.jsp", Long.valueOf(1523153962925L));
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1523153962924L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
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
      out.write("\t<table id=\"companyFundsLogList\" title=\"平台收支记录 <span style='color: #0015FF;'>收入合计</span>：<span id='companyFundsLogIncome' style='color: red;'></span>\r\n");
      out.write("\t\t<span style='color: #0015FF;'>支出合计</span>：<span id='companyFundsLogPay' style='color: red;'></span> \r\n");
      out.write("\t\t<span style='color: #0015FF;'>剩余合计</span>：<span id='companyFundsLogSum' style='color: red;'></span>\" \r\n");
      out.write("\tclass=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '../companyFundsLog/companyFundsLogList.do',\r\n");
      out.write("\t    method:'post',rownumbers:true,\r\n");
      out.write("\t    pagination:true,toolbar:'#companyFundsLogTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("\t        <th data-options=\"field:'pcode'\" width=\"10%\">产品编号</th>\r\n");
      out.write("\t        <th data-options=\"field:'fundTypeName'\" width=\"10%\" >交易类型</th>\t     \r\n");
      out.write("\t       \t<th data-options=\"field:'typeName'\" >收入/支出</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'amount'\" width=\"10%\" styler=\"styleColor\" formatter=\"formatAmount\">金额</th>\t      \t\r\n");
      out.write("\t        <th data-options=\"field:'realName'\" width=\"8%\">用户姓名</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'phone'\" width=\"10%\">用户手机号</th>\r\n");
      out.write("\t        <th data-options=\"field:'remark'\" width=\"25%\">备注</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'addTime'\"  width=\"15%\" formatter=\"formatDateBoxFull\">交易时间</th>\r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"companyFundsLogTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"companyFundsLogForm\">\r\n");
      out.write("\t  \t\t产品编号:<input id=\"searchCompanyFundsLogLcoding\" name=\"pcode\" class=\"easyui-textbox\"  size=\"15\" style=\"width:200px\"/>\r\n");
      out.write("\t  \t\t交易时间:<input id=\"searchCompanyFundsLogStartDate\" name=\"startDate\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t至<input id=\"searchCompanyFundsLogEndDate\" name=\"endDate\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t收支类型: <select  id=\"searchCompanyFundsLogType\" name=\"type\" style=\"width:100px;\" class=\"easyui-combobox\">\r\n");
      out.write("\t\t\t\t \t<option value=''>全部</option>\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("</select> \t\r\n");
      out.write("\t    \t<a id=\"searchCompanyFundsLogBtn\" href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    \t<a id=resetCompanyFundsLogBtn href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">重置</a>\r\n");
      out.write("\t\t\t<a id=exportCompanyFundsLogBtn href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">导出</a>\r\n");
      out.write("\t    \t<br>\r\n");
      out.write("\t    \t<label><input type=\"checkbox\" value=\"\"/> 全部 </label>\r\n");
      out.write("\t  \t\t");
      if (_jspx_meth_c_005fforEach_005f1(_jspx_page_context))
        return;
      out.write("</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//统计:平台收支合计,支出合计,剩余合计 \r\n");
      out.write(" \t$(document).ready(function () {\r\n");
      out.write("\t\t$('#companyFundsLogList').datagrid({ \r\n");
      out.write("\t\t    onBeforeLoad: function (d) {\r\n");
      out.write("\t\t\t    $.ajax({\r\n");
      out.write("\t\t\t\turl:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/companyFundsLog/companyFundsLogSum.do\",\r\n");
      out.write("\t\t\t\ttype:\"POST\",\r\n");
      out.write("\t\t\t\tdata:$(\"#companyFundsLogForm\").serialize(),  \r\n");
      out.write("\t\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\t\t$(\"#companyFundsLogIncome\").text(result.companyFundsLogIncome);\r\n");
      out.write("\t\t\t\t\t$(\"#companyFundsLogPay\").text(result.companyFundsLogPay);\r\n");
      out.write("\t\t\t\t\t$(\"#companyFundsLogSum\").text(accSub(result.companyFundsLogIncome,result.companyFundsLogPay));\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t} \r\n");
      out.write("    \t});\r\n");
      out.write("\t}); \r\n");
      out.write("\t//重置按钮\r\n");
      out.write("\t$('#resetCompanyFundsLogBtn').click(function(){\r\n");
      out.write("\t\t$(\"#companyFundsLogForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#companyFundsLogList\").datagrid(\"load\", {});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("    //导出按钮\r\n");
      out.write("    $('#exportCompanyFundsLogBtn').click(function(){\r\n");
      out.write("        location.href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/companyFundsLog/exportCompanyFundsLog.do?pcode=\"+$('#searchCompanyFundsLogLcoding').val()+\r\n");
      out.write("        \"&startDate=\"+$('#searchCompanyFundsLogStartDate').combobox('getValue')+\r\n");
      out.write("        \"&endDate=\"+$('#searchCompanyFundsLogEndDate').combobox('getValue')+\r\n");
      out.write("\t\t\"&type=\"+$('#searchCompanyFundsLogType').combogrid('getValues')+\r\n");
      out.write("\t\t\"&fundTypes=\"+companyFundsLogCBAll();\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchCompanyFundsLogBtn').click(function(){\r\n");
      out.write("\t\t$('#companyFundsLogList').datagrid({\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\tstartDate: $('#searchCompanyFundsLogStartDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\tendDate: $('#searchCompanyFundsLogEndDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\tpcode: $('#searchCompanyFundsLogLcoding').val(),\r\n");
      out.write("\t\t\t\ttype: $('#searchCompanyFundsLogType').combobox(\"getValue\"),\r\n");
      out.write("\t\t\t\tfundTypes:companyFundsLogCBAll(),\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write(" \t\t\r\n");
      out.write("\t\t}); \r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction companyFundsLogCBAll(){//输出选中的值\r\n");
      out.write("\t\tvar checks=\"\";  \r\n");
      out.write("\t\t$('input[name=\"fundTypes\"]:checked').each(function(){\r\n");
      out.write("        \tchecks +=$(this).val()+\",\";\r\n");
      out.write("\t\t});  \r\n");
      out.write("\t\treturn checks;  \r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$(\"#companyAmount\").bind(\"keyup\",function(){\r\n");
      out.write("\t\t\tvar balance = $(\"#companyBalance\").val();\r\n");
      out.write("\t\t\tvar money=$(\"#companyAmount\").val();\r\n");
      out.write("\t\t\tvar totalAmount = (parseFloat(balance)+parseFloat(money));\r\n");
      out.write("\t\t\ttotalAmount = Math.round(totalAmount*100)/100;\r\n");
      out.write("\t\t\t$(\"#companySumAmount\").val(totalAmount);\r\n");
      out.write("\t\t\t$(\"#companyAmountCapital\").html(cmycurd(money));\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
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

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(38,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("map");
    // /WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(38,5) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(38,5) '${fundtype}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${fundtype}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("<option value='");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.key}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write('\'');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.value}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t        ");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f1.setParent(null);
    // /WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(47,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f1.setVar("map");
    // /WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(47,5) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f1.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/jsp/system/finance/drCompanyFundsLogList.jsp(47,5) '${companyFundsType}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${companyFundsType}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int[] _jspx_push_body_count_c_005fforEach_005f1 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f1 = _jspx_th_c_005fforEach_005f1.doStartTag();
      if (_jspx_eval_c_005fforEach_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("<label>\r\n");
          out.write("\t\t\t\t<input type=\"checkbox\" name=\"fundTypes\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.key}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("\" id=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.key}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("\" />");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.value}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</label>\r\n");
          out.write("\t\t    ");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f1.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f1);
    }
    return false;
  }
}
