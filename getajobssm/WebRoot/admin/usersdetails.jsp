<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>查看信息</title>
  <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/menu.css" rel="stylesheet" type="text/css" />
    

<script src="/getajobssm/webui/jquery/jquery-1.9.0.js"
	type="text/javascript"></script>
<link href="/getajobssm/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="/getajobssm/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<link
	href="/getajobssm/webui/artDialog/skins/green.css"
	rel="stylesheet" type="text/css" />

<script
	src="/getajobssm/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="/getajobssm/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="/getajobssm/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="/getajobssm/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script src="/getajobssm/admin/js/combo.js"
	type="text/javascript"></script>


</head>
<body>
			<div class="search-title">
				<h2>查看用户信息</h2>
				<div class="description"></div>
			</div>
			<table cellpadding="0" width="100%" cellspacing="1" class="grid">
				<tr>
					<td width="8%" align="right" class="title">用户名:</td>
					<td width="30%">${admin.username}</td>
					<td width="*" colspan="2" rowspan="6"><img id="imgXiangpian" width="200px" height="200px"
						src="<%=path %>/upload/${admin.filename}" />
					</td>
				</tr>
				
				<tr>
					<td width="8%" align="right" class="title">真名:</td>
					<td width="30%">${admin.realname}</td>
				</tr>
				
			   <tr>
					<td align="right" class="title">性别:</td>
					<td>${admin.sex}</td>
				</tr>
				<tr>
					<td align="right" class="title">电话:</td>
					<td>${admin.tel}</td>
				</tr>
				<tr>
					<td align="right" class="title">绑定邮箱:</td>
					<td>${admin.email}</td>
				</tr>
				<tr>
					<td align="right" class="title">地址:</td>
					<td>${admin.addr}</td>
				</tr>
				<tr>
					<td align="right" class="title">创建时间:</td>
					<td>${admin.savetime}</td>
				</tr>
				
			</table>



</body>
</html>