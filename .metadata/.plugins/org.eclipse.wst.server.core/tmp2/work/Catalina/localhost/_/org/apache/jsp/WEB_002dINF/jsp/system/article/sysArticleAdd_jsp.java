/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2018-03-28 08:26:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.article;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class sysArticleAdd_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/article/../../common/include/util.jsp", Long.valueOf(1521710765619L));
    _jspx_dependants.put("/WEB-INF/jsp/common/include/Taglibs.jsp", Long.valueOf(1521710765618L));
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
      out.write("<html lang=\"zh-CN\">\r\n");
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
      out.write("<link rel=\"stylesheet\" href=\"../js/kindeditor-4.1.5/themes/default/default.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../js/kindeditor-4.1.5/plugins/code/prettify.css\" />\r\n");
      out.write("<script charset=\"utf-8\" src=\"../js/kindeditor-4.1.5/kindeditor.js\"></script>\r\n");
      out.write("<script charset=\"utf-8\" src=\"../js/kindeditor-4.1.5/lang/zh_CN.js\"></script>\r\n");
      out.write("<script charset=\"utf-8\" src=\"../js/kindeditor-4.1.5/plugins/code/prettify.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../js/common/jquery.form.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tKindEditor.ready(function(K) {\r\n");
      out.write("\t\tvar editor1 = K.create('textarea[id=\"content\"]', {\r\n");
      out.write("\t\t\tcssPath : '/js/kindeditor-4.1.5/plugins/code/prettify.css',\r\n");
      out.write("\t\t\tuploadJson : '../article/file_upload.do',\r\n");
      out.write("\t\t\tallowFileManager : true,\r\n");
      out.write("\t\t\titems: [\"source\", \"|\", \"undo\", \"redo\", \"|\", \"preview\", \"print\", \"template\", \"code\", \"cut\", \"copy\", \"paste\", \r\n");
      out.write("\t\t\t\"plainpaste\", \"wordpaste\",\r\n");
      out.write("\"|\", \"justifyleft\", \"justifycenter\", \"justifyright\", \"justifyfull\", \"insertorderedlist\", \"insertunorderedlist\", \r\n");
      out.write("\"indent\", \"outdent\", \"subscript\", \"superscript\", \"clearhtml\", \"quickformat\", \"selectall\", \"|\", \"fullscreen\", \"/\", \r\n");
      out.write("\"formatblock\", \"fontname\", \"fontsize\", \"|\", \"forecolor\", \"hilitecolor\", \"bold\", \"italic\", \"underline\", \"strikethrough\", \r\n");
      out.write("\"lineheight\", \"removeformat\", \"|\", \"image\", \"flash\", \"media\", \"insertfile\", \"table\", \"hr\", \"emoticons\",\r\n");
      out.write(" \"baidumap\", \"pagebreak\", \"anchor\", \"link\", \"unlink\"],\r\n");
      out.write("\t\t\tafterCreate : function() {\r\n");
      out.write("\t\t\t\tvar self = this;\r\n");
      out.write("\t\t\t\tK.ctrl(document, 13, function() {\r\n");
      out.write("\t\t\t\t\tself.sync();\r\n");
      out.write("\t\t\t\t\t//document.forms['example'].submit();\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\tK.ctrl(self.edit.doc, 13, function() {\r\n");
      out.write("\t\t\t\t\tself.sync();\r\n");
      out.write("\t\t\t\t\t//document.forms['example'].submit();\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tafterChange : function() {\r\n");
      out.write("\t\t\t\tthis.sync();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tprettyPrint();\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"easyui-panel\" style=\"width:100%;height:auto;padding:10px;\">\r\n");
      out.write("<form id=\"addArticleForm\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t<div class=\"easyui-panel\" style=\"width:100%;height:auto;padding:10px;\">\r\n");
      out.write("\t<table >\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t标题:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"title\" size=\"50\" class=\"easyui-textbox\" data-options=\"required:true\" />\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t作者:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"writer\" style=\"width:100px;\" class=\"easyui-textbox\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t发布时间:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t<input name=\"createTime\" class=\"easyui-datetimebox\" style=\"width:150px\" data-options=\"required:true\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t栏目:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select id=\"selectPro\" name=\"proId\" style=\"width:100px;\" class=\"easyui-combobox\" validType=\"selectValueRequired['#proId']\" \r\n");
      out.write("\t\t\t\t\tdata-Options=\"onSelect:function(){\r\n");
      out.write("\t\t\t\t\t\t\tvar checkVal = $('#selectPro').combobox('getValue');\r\n");
      out.write("\t\t\t\t\t\tif(checkVal==1||checkVal==3){\r\n");
      out.write("\t\t\t\t\t\t\t$('#summaryContents').validatebox({required:true})\r\n");
      out.write("\t\t\t\t\t\t\t$('#summary').show();\r\n");
      out.write("\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t$('#summaryContents').validatebox({required:false});\r\n");
      out.write("\t\t\t\t\t\t\t$('#summary').hide();\r\n");
      out.write("\t\t\t\t\t\t}}\">\r\n");
      out.write("\t\t\t\t \t<option value='-1'>全部</option>\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t排序:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"sortRank\" class=\"easyui-numberbox\" data-options=\"required:true,min:0,max:9\"  />\r\n");
      out.write("\t\t\t\t<span style=\"color:red;\">填写0-9，数字越大排的越前</span>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t页面标题:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input name=\"metatitle\" class=\"easyui-textbox\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t来源:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"source\"  style=\"width:100px;\" class=\"easyui-textbox\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t标题关键字:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"easyui-textbox\" name=\"keywords\"/>\r\n");
      out.write("\t\t\t\t<span style=\"color:red\">关键字之间请以空格隔开</span>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\t\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t头条:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"ishead\" style=\"width:100px;\" class=\"easyui-combobox\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"1\">是</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"0\" selected=\"selected\">否</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t页面关键字:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t<input name=\"metakyword\" style=\"width:100px;\" class=\"easyui-textbox\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t页面描述:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t<input class=\"easyui-textbox\" name=\"description\" data-options=\"multiline:true\" style=\"height:23px\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<tr>\t\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t关联银行:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td colspan=\"5\">\r\n");
      out.write("\t\t\t\t<select class=\"easyui-combogrid\" name=\"bankName\" style=\"height:38px;width:700px;padding-bottom: 3px;\" data-options=\"\r\n");
      out.write("\t\t\t\t\tpanelWidth: 700,\r\n");
      out.write("\t\t\t\t\tmultiple: true,\r\n");
      out.write("\t\t\t\t\tmultiline:true,\r\n");
      out.write("\t\t\t\t\teditable:false,\r\n");
      out.write("\t\t\t\t\teditable:false,\r\n");
      out.write("\t\t\t\t\tidField: 'bankName',\r\n");
      out.write("\t\t\t\t\ttextField: 'bankName',\r\n");
      out.write("\t\t\t\t\turl: '../article/drAllSysBank.do',\r\n");
      out.write("\t\t\t\t\tmethod: 'get',\r\n");
      out.write("\t\t\t\t\tcolumns: [[\r\n");
      out.write("\t\t\t\t\t\t{field:'id',checkbox:true},\r\n");
      out.write("\t\t\t\t\t\t{field:'bankName',title:'银行名称',width:80},\r\n");
      out.write("\t\t\t\t\t]],\r\n");
      out.write("\t\t\t\t\tfitColumns: true\r\n");
      out.write("\t\t\t\t\">\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"easyui-panel\" style=\"width:100%;height:auto;padding:10px;\">\r\n");
      out.write("\t\t<table cellspacing=\"15px\" >\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" style=\"vertical-align: top;\">\r\n");
      out.write("\t\t\t\t上传图片:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\" style=\"vertical-align: top;\">\t\r\n");
      out.write("\t\t\t\t文章概要:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\t\t\r\n");
      out.write("\t\t\t\t\t<input type=\"file\" id=\"articleAddPicFile\" name=\"articleAddPicFile\" onchange=\"PreviewImage(this)\" />\r\n");
      out.write("\t\t\t\t\t\t<div style=\"color:red;\">图片文件最大5MB，支持.jpg.jpeg的图片格式。</div>\r\n");
      out.write("\t\t\t\t\t<img src=\"\" id=\"showArticleAddPic\"  height=\"160\" width=\"260\" /> \r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\t\r\n");
      out.write("\t\t\t\t\t<textarea cols=\"50\" rows=\"10\" name=\"summaryContents\" id=\"summaryContents\" class=\"easyui-validatebox\" validType=\"restrictNumber\"></textarea>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" style=\"vertical-align: top;\" colspan=\"2\">\t\r\n");
      out.write("\t\t\t\t文本:\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\">\t\r\n");
      out.write("\t\t\t\t<textarea cols=\"100\" rows=\"20\" name=\"content\" id=\"content\"  ></textarea>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<div style=\"text-align:center;padding:30px 60px 10px 0px\">\r\n");
      out.write("\t\t<a id=\"picAddBtn\" href=\"javascript:void(0)\" data-options=\"iconCls:'icon-save'\"\r\n");
      out.write("\t\tclass=\"easyui-linkbutton\" onclick=\"addArticleBtn()\">添加</a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction addArticleBtn(){\r\n");
      out.write("\t\tvar validate = $(\"#addArticleForm\").form(\"validate\");\r\n");
      out.write("\t\tif(!validate){\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#addArticleForm\").ajaxSubmit({\r\n");
      out.write("            type: 'post', // 提交方式 get/post\r\n");
      out.write("            url: '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${apppath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/article/articleAdd.do', // 需要提交的 url\r\n");
      out.write("            success: function(result) { // data 保存提交后返回的数据，一般为 json 数据\r\n");
      out.write("            \tvar resultJson = jQuery.parseJSON(result);\r\n");
      out.write("\t\t\t\tif(resultJson.success){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",resultJson.msg,\"\",function(){\r\n");
      out.write("\t\t\t\t\tvar currTab = parent.$('#main-center').tabs('getTab', \"文章管理\");\r\n");
      out.write("\t\t\t\t\t\tvar content = '<iframe scrolling=\"no\" frameborder=\"0\"  src=\"../article/toArticleList.do\" style=\"width:100%;height:100%;\"></iframe>';  \r\n");
      out.write("\t\t\t\t\t\tparent.$('#main-center').tabs('update', {\r\n");
      out.write("\t\t\t\t\t\t\ttab: currTab,\r\n");
      out.write("\t\t\t\t\t\t\toptions: {\r\n");
      out.write("\t\t\t\t\t\t\t\tcontent: content  // 新内容的URL\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\tparent.$('#main-center').tabs('close','添加文章');\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"提示信息\",resultJson.errorMsg);\r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("            \t$(\"#addArticleForm\").resetForm(); // 提交后重置表单\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        return false; // 阻止表单自动提交事件\r\n");
      out.write("\t};\r\n");
      out.write("\r\n");
      out.write("\t//图片预览\r\n");
      out.write("\tfunction PreviewImage(articleAddPicFile) {\r\n");
      out.write("\t\tif (articleAddPicFile.value == \"\") {  \r\n");
      out.write("\t\t\t$.messager.alert(\"提示信息\",\"请上传图片\");\r\n");
      out.write("\t        return false;  \r\n");
      out.write("\t    }  \r\n");
      out.write("     \tif (!/\\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(articleAddPicFile.value)) {  \r\n");
      out.write("        \t$.messager.alert(\"提示信息\",\"图片类型必须是.gif,jpeg,jpg,png中的一种\");\r\n");
      out.write("            articleAddPicFile.value = \"\";  \r\n");
      out.write("            return false;  \r\n");
      out.write("        }\r\n");
      out.write("\t    if(articleAddPicFile){  \r\n");
      out.write("\t\t\tif (window.navigator.userAgent.indexOf(\"MSIE\")>=1 && !(navigator.userAgent.indexOf(\"MSIE 10.0\") > 0))    {    \r\n");
      out.write("\t\t\t\tarticleAddPicFile.select();\r\n");
      out.write("\t\t\t\tvar imgSrc = document.selection.createRange().text;\r\n");
      out.write("\t\t\t\tvar localImagId = document.getElementById(\"showArticleAddPic\");\r\n");
      out.write("\t\t\t\tlocalImagId.style.filter=\"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)\";\r\n");
      out.write("\t\t\t\tlocalImagId.filters.item(\"DXImageTransform.Microsoft.AlphaImageLoader\").src = imgSrc;\r\n");
      out.write("\t\t\t\tdocument.selection.empty();\r\n");
      out.write("      \t\t}else{ \r\n");
      out.write("                if(articleAddPicFile.files)  \r\n");
      out.write("                {  \r\n");
      out.write("                \t$(\"#showArticleAddPic\").attr(\"src\",window.URL.createObjectURL(articleAddPicFile.files[0]));  \r\n");
      out.write("                }  \r\n");
      out.write("             }\r\n");
      out.write("         }  \r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
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

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/jsp/system/article/sysArticleAdd.jsp(88,5) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/jsp/system/article/sysArticleAdd.jsp(88,5) '${sysProgram}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${sysProgram}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    // /WEB-INF/jsp/system/article/sysArticleAdd.jsp(88,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("vt");
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("<option value='");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vt.proId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("'  >");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vt.proName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t\t\t");
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