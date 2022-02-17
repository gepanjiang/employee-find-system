<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@page import="com.util.Info"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘修改</title>
     <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script src="/getajobssm/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    
    
    <script  type="text/javascript" src="/getajobssm/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/messages_cn.js" ></script>
    <link href="/getajobssm/webui/artDialog/skins/green.css" rel="stylesheet" type="text/css" />

    <script src="/getajobssm/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/getajobssm/webui/jqueryui/themes/base/jquery.ui.all.css"
			type="text/css"></link>
	<script type="text/javascript" src="/getajobssm/webui/jqueryui/ui/jquery-ui.js"></script>
	<script type="text/javascript" src="/getajobssm/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script src="/getajobssm/layer/layer.js" type="text/javascript"></script>
    
</head>
<body>
           <div class="search-title">
                <h2>
                                                修改招聘管理
                </h2>
                <div class="description">
                </div>
            </div>
           	<form name="usersform" method="post" action="workUpdate.do" id="usersForm">
           	<input type="hidden" name="id" value="${work.id}"/>
					<table class="grid" cellspacing="1" width="100%">
					    <tr>
							<td width="15%" align="right">
								图片:
							</td>
							<td width="35%">
								<input name='filename' value="${work.filename}" type='text' class="input-txt" validate="{required:true,messages:{required:'请选择头像'}}"    id='url'  size='50' value='' />&nbsp;<input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/>
								<div id="errmsg" style="display: none;font-weight: "></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								标题:
							</td>
							<td>
								<input type="text" name="title" required  value="${work.title}"
									class="input-txt"  id="txtTitle" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								招聘人数:
							</td>
							<td>
								<input type="number" name="pnum" required  value="${work.pnum}"
									class="input-txt"  id="txtPnum" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								职位:
							</td>
							<td>
								<input type="text" name="ziwei" required  value="${work.ziwei}"
									class="input-txt"  id="txtZiwei" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								薪资待遇:
							</td>
							<td>
								<input type="number" name="salary"  required  value="${work.salary}"
									class="input-txt"  id="txtSalary" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								学历要求:
							</td>
							<td>
								<input type="text" name="xueli" required  value="${work.xueli}"
									class="input-txt"  id="txtXueli" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								招聘负责人:
							</td>
							<td>
								<input type="text" name="name" required  value="${work.name}"
									class="input-txt"  id="txtName" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								联系电话:
							</td>
							<td>
								<input type="text" name="tel" required  value="${work.tel}"
									class="input-txt"  id="txtTel" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								备注:
							</td>
							<td>
								<textarea style="width:700px;height:300px;" name="content" id="content">${work.content}</textarea>
							</td>
						</tr>
						
						
					</table>
					<div class="ui-button">
					  <input type="submit" value="提交" id="Button1" class="ui-button-text" />
					</div>
					
				</form>
     
<script type="text/javascript">

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script> 
<script type="text/javascript">
function up(tt)
{
layer.open({
  type: 2,
  title: '上传文件',
  shadeClose: true,
  shade: false,
  maxmin: true, //开启最大化最小化按钮
  area: ['450px', '200px'],
  content: '<%=path%>/upload.jsp?Result='+tt
});
}
</script>

<link rel="stylesheet" href="../themes/default/default.css" />
<link rel="stylesheet" href="../plugins/code/prettify.css" />
<script charset="utf-8" src="../plugins/code/prettify.js"></script>
<script charset="utf-8" src="/getajobssm/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="/getajobssm/kindeditor/lang/zh-CN.js"></script>
<script>
KindEditor.ready(function(K) {
window.editor = K.create('#content');
});
</script>
<script>
KindEditor.ready(function(K) {
K.create('textarea[name="content"]', {
uploadJson : '/getajobssm/kindeditor/jsp/upload_json.jsp',
fileManagerJson : '/getajobssm/kindeditor/jsp/file_manager_json.jsp',
allowFileManager : true,
allowImageUpload : true, 
autoHeightMode : true,
afterCreate : function() {this.loadPlugin('autoheight');},
afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
});
});
</script>
</body>
</html>