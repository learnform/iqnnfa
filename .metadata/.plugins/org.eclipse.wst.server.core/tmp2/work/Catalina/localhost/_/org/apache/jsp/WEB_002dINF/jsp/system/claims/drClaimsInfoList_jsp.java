/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-05-03 05:42:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.claims;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class drClaimsInfoList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/claims/../../common/include/util.jsp", Long.valueOf(1523153962925L));
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
      out.write("<script type=\"text/javascript\" src=\"../js/common/jquery.form.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table id=\"drClaimsInfoList\" title=\"债权管理\" \r\n");
      out.write("\tclass=\"easyui-datagrid\" style=\"height:99%;width:99.9%\"\r\n");
      out.write("\tdata-options=\"singleSelect:true,\r\n");
      out.write("\t    fitColumns:true, url: '../claims/drClaimsLoanList.do',\r\n");
      out.write("\t    method:'post',rownumbers:true, \r\n");
      out.write("\t    pagination:true,toolbar:'#drClaimsInfoTools'\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t    <tr>\r\n");
      out.write("\t    \t<th data-options=\"field:'id'\" hidden=\"true\">序号</th>\r\n");
      out.write("\t    \t<th data-options=\"field:'status'\" hidden=\"true\">状态</th>  \t\r\n");
      out.write("\t    \t<th data-options=\"field:'no'\" width=\"10%\">借款合同编号</th>\r\n");
      out.write("\t        <th data-options=\"field:'name'\" width=\"10%\">产品名称</th>\r\n");
      out.write("\t       \t<th data-options=\"field:'companyName'\" width=\"15%\">企业名称</th>\r\n");
      out.write("\t        <th data-options=\"field:'loanAmount'\" width=\"10%\" styler=\"styleColor\" formatter=\"formatAmount\">借款金额(元)</th>\r\n");
      out.write("\t        <th data-options=\"field:'receiveInterest'\" width=\"10%\" styler=\"styleColor\" formatter=\"formatAmount\">应收利息(元)</th>\r\n");
      out.write("\t        <th data-options=\"field:'serviceCharge'\" width=\"10%\" styler=\"styleColor\" formatter=\"formatAmount\">服务费(元)</th>\t        \r\n");
      out.write("\t        <th data-options=\"field:'addDate'\" width=\"10%\" formatter=\"formatDateBoxFull\">新增日期</th>\r\n");
      out.write("\t        <th data-options=\"field:'statusName'\" width=\"5%\">当前状态</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'_operate',align:'center'\" width=\"10%\" formatter=\"formatOper\">基本操作</th>\r\n");
      out.write("\t    </tr>\r\n");
      out.write("\t    </thead>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div id=\"drClaimsInfoTools\" style=\"padding:5px;height:750\">\r\n");
      out.write("\t  \t<form id=\"drClaimsInfoForm\">\r\n");
      out.write("\t  \t\t合同编号:<input id=\"searchClaimsLoanNo\" name=\"no\" class=\"easyui-textbox\"  size=\"15\" style=\"width:200px\"/>\r\n");
      out.write("\t  \t\t产品名称:<input id=\"searchClaimsLoanName\" name=\"name\" class=\"easyui-textbox\"  size=\"15\" style=\"width:150px\"/>\r\n");
      out.write("\t  \t\t企业名称:<input id=\"searchClaimsLoanCompanyName\" name=\"companyName\" class=\"easyui-textbox\"  size=\"15\" style=\"width:150px\"/>\r\n");
      out.write("\t  \t\t录入日期:<input id=\"searchClaimsLoanStartDate\" name=\"startDate\" class=\"easyui-datebox\" style=\"width:100px\"/>到\r\n");
      out.write("\t  \t\t\t\t<input id=\"searchClaimsLoanEndDate\" name=\"endDate\" class=\"easyui-datebox\" style=\"width:100px\"/>\r\n");
      out.write("\t  \t\t当前状态: <select  id=\"searchClaimsLoanStatus\" name=\"status\" style=\"width:100px;\" class=\"easyui-combobox\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>全部</option>\r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("</select>\r\n");
      out.write("\t    \t<a id=\"searchClaimsLoan\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\">查询</a>\r\n");
      out.write("\t    \t<a id=\"resetClaimsLoan\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-reload\">重置</a>\r\n");
      out.write("\t    \t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" onclick=\"addDrClaimsInfoBtn()\">债权新增</a>\t\r\n");
      out.write("\t    </form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"addDrClaimsInfoAdvanceDialog\" class=\"easyui-dialog\" title=\"放款提示\"\r\n");
      out.write("\t\tdata-options=\"iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrClaimsInfoAdvanceDialogBtn'\" style=\"width:300px;height:200px;padding:5px;\">\r\n");
      out.write("\t\t<form id=\"addDrClaimsInfoAdvanceForm\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"addDrClaimsInfoAdvanceId\"  name=\"id\"/>\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\">放款日期：</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"addStartDate\" name=\"startDate\" type=\"text\" class=\"easyui-datebox\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\">服务费：</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"addServiceCharge\" name=\"serviceCharge\" type=\"text\" class=\"easyui-numberbox\" data-options=\"required:true,min:0,max:100000000,precision:2\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t<div id=\"addDrClaimsInfoAdvanceDialogBtn\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"addDrClaimsInfoAdvance()\">确定</a>\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeAddDrClaimsInfoAdvanceDialog()\">取消</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t//重置按钮\r\n");
      out.write("\t$('#resetClaimsLoan').click(function(){\r\n");
      out.write("\t\t$(\"#drClaimsInfoForm\").form(\"reset\");\r\n");
      out.write("\t\t$(\"#drClaimsInfoList\").datagrid(\"load\", {});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//查询按钮\r\n");
      out.write("\t$('#searchClaimsLoan').click(function(){\r\n");
      out.write(" \t\t$('#drClaimsInfoList').datagrid({\r\n");
      out.write("\t\t\tqueryParams: {\r\n");
      out.write("\t\t\t\tno: $('#searchClaimsLoanNo').val(),\r\n");
      out.write("\t\t\t\tname: $('#searchClaimsLoanName').val(),\r\n");
      out.write("\t\t\t\tcompanyName: $('#searchClaimsLoanCompanyName').val(),\r\n");
      out.write("\t\t\t\tstartDate: $('#searchClaimsLoanStartDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\tendDate: $('#searchClaimsLoanEndDate').datebox('getValue'),\r\n");
      out.write("\t\t\t\tstatus: $('#searchClaimsLoanStatus').combobox('getValue'),\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}); \r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//添加基本操作链接\r\n");
      out.write("\tfunction formatOper(val,row,index){  \r\n");
      out.write("\t\tif(row.status==\"1\" || row.status==\"3\"){\r\n");
      out.write("\t\t\treturn\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"toShowClaimsInfoBtn('+index+')\">查看</a>'+\"   \"+\r\n");
      out.write("\t\t\t\t\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"updateDrClaimsInfoBtn('+index+')\">修改</a>';\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t}else if((row.status==\"2\" || row.status==\"4\" || row.status==\"5\") && row.receiveInterest == null){\r\n");
      out.write("\t\t\treturn\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"toShowClaimsInfoBtn('+index+')\">查看</a>'+\"   \"+\r\n");
      out.write("\t\t\t\t\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"addDrClaimsInfoAdvanceBtn('+index+')\">放款</a>';\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn\t'<a href=\"#\" class=\"btn l-btn l-btn-small\" onclick=\"toShowClaimsInfoBtn('+index+')\">查看</a>';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\t//跳转到债权添加页面\r\n");
      out.write("\tfunction addDrClaimsInfoBtn(){\r\n");
      out.write("\t\tvar mainTab = parent.$('#main-center');\r\n");
      out.write("\t\tvar detailTab = {\r\n");
      out.write("\t\t\t\ttitle : \"债权新增\",\r\n");
      out.write("\t\t\t\tcontent:\"<iframe width='100%' height='100%' frameborder='0' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/claims/toAddClaimsInfo.do' ></iframe>\",\r\n");
      out.write("\t\t\t\tclosable : true\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\tmainTab.tabs(\"add\",detailTab);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//跳转到债权修改页面\r\n");
      out.write("\tfunction updateDrClaimsInfoBtn(index){\r\n");
      out.write("\t\t$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drClaimsInfoList').datagrid('getSelected'); \r\n");
      out.write("\t    $.ajax({\r\n");
      out.write("\t\t\turl: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/claims/isOperate.do?id=\"+row.id+\"&operate=update\",\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\tvar mainTab = parent.$('#main-center');\r\n");
      out.write("\t\t\t\t\tvar detailTab = {\r\n");
      out.write("\t\t\t\t\t\t\ttitle : \"债权修改\",\r\n");
      out.write("\t\t\t\t\t\t\tcontent:\"<iframe width='100%' height='100%' frameborder='0' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/claims/toUpdateClaimsInfo.do?lid=\"+row.id+\"'></iframe>\",\r\n");
      out.write("\t\t\t\t\t\t\tclosable : true\r\n");
      out.write("\t\t\t\t\t};\r\n");
      out.write("\t\t\t\t\tmainTab.tabs(\"add\",detailTab);\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg,function(){\r\n");
      out.write("\t\t\t\t\t\t$('#drClaimsInfoList').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write(" \t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//跳转到债权显示页面\r\n");
      out.write("\tfunction toShowClaimsInfoBtn(index){\r\n");
      out.write("\t\t$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drClaimsInfoList').datagrid('getSelected'); \r\n");
      out.write("\t\tvar mainTab = parent.$('#main-center');\r\n");
      out.write("\t\tvar detailTab = {\r\n");
      out.write("\t\t\t\ttitle : \"债权显示\",\r\n");
      out.write("\t\t\t\tcontent:\"<iframe width='100%' height='100%' frameborder='0' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/claims/toShowClaimsInfo.do?lid=\"+row.id+\"'></iframe>\",\r\n");
      out.write("\t\t\t\tclosable : true\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\tmainTab.tabs(\"add\",detailTab);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//放款操作\r\n");
      out.write("\tfunction addDrClaimsInfoAdvanceBtn(index){\r\n");
      out.write("\t\t$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 \r\n");
      out.write("\t    var row = $('#drClaimsInfoList').datagrid('getSelected'); \r\n");
      out.write("\t    $('#addDrClaimsInfoAdvanceId').val(row.id);\r\n");
      out.write("\t\t$(\"#addDrClaimsInfoAdvanceDialog\").dialog(\"open\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//放款操作\r\n");
      out.write("\tfunction addDrClaimsInfoAdvance(index){\r\n");
      out.write("\t\tvar validate = $(\"#addDrClaimsInfoAdvanceForm\").form(\"validate\");\r\n");
      out.write("\t\tif(!validate){\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/claims/addDrClaimsInfoAdvance.do\";\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: url,\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tdata:$(\"#addDrClaimsInfoAdvanceForm\").serialize(),\r\n");
      out.write("\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\tif(result.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"操作提示\", result.msg);\r\n");
      out.write("\t\t\t\t\t$('#drClaimsInfoList').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t$(\"#addDrClaimsInfoAdvanceDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t\t$('#addDrClaimsInfoAdvanceForm').form('clear');\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",result.errorMsg);\r\n");
      out.write("\t\t\t\t\t$('#drClaimsInfoList').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t$(\"#addDrClaimsInfoAdvanceDialog\").dialog(\"close\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t  \t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//关闭Dialog\r\n");
      out.write("\tfunction closeAddDrClaimsInfoAdvanceDialog(){  \r\n");
      out.write("\t\t$(\"#drClaimsInfoList\").datagrid(\"reload\");\r\n");
      out.write("\t\t$(\"#addDrClaimsInfoAdvanceDialog\").dialog(\"close\");\r\n");
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

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/jsp/system/claims/drClaimsInfoList.jsp(42,6) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/jsp/system/claims/drClaimsInfoList.jsp(42,6) '${status }'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${status }",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    // /WEB-INF/jsp/system/claims/drClaimsInfoList.jsp(42,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("map");
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("<option value='");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.key }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write('\'');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${map.value }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t\t\t\t");
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
}
