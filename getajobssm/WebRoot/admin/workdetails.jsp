<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@page import="com.util.Info"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘信息查看</title>
        <script charset="utf-8" src="/getajobssm/kindeditor/kindeditor.js"></script>
	    <script charset="utf-8" src="/getajobssm/kindeditor/Kind.js"></script>
        <script charset="utf-8" src="/getajobssm/kindeditor/lang/zh-CN.js"></script>
     <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script src="/getajobssm/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    
    
    <script  type="text/javascript" src="/getajobssm/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/messages_cn.js" ></script>
	    
    
    <link href="/getajobssm/uploadifyv3.1/uploadify.css"
			rel="stylesheet" type="text/css" />
	<script src="/getajobssm/uploadifyv3.1/jquery.uploadify-3.1.js"
			type="text/javascript"></script>
    <link href="/getajobssm/webui/artDialog/skins/green.css" rel="stylesheet" type="text/css" />

    <script src="/getajobssm/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/getajobssm/webui/jqueryui/themes/base/jquery.ui.all.css"
			type="text/css"></link>
	<script type="text/javascript" src="/getajobssm/webui/jqueryui/ui/jquery-ui.js"></script>
	<script type="text/javascript" src="/getajobssm/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    
</head>
<body>
           <div class="search-title">
                <h2>
                                                招聘信息查看
                </h2>
                <div class="description">
                </div>
            </div>
           	<form name="usersform" method="post" action="noticeAdd.action" id="usersForm">
					<table class="grid" cellspacing="1" width="100%" >
						<tr>
							<td width="15%" align="right">
								标题:
							</td>
							<td width="35%">
							${work.title}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								招聘人数:
							</td>
							<td width="35%">
							${work.pnum}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
							职位:
							</td>
							<td width="35%">
							${work.ziwei}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								薪资待遇:
							</td>
							<td width="35%">
							${work.salary}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								学历要求:
							</td>
							<td width="35%">
							${work.xueli}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								招聘单位:
							</td>
							<td width="35%">
							${work.member.tname}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								联系人:
							</td>
							<td width="35%">
							${work.name}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								联系电话:
							</td>
							<td width="35%">
							${work.tel}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								发布时间:
							</td>
							<td width="35%">
							${work.savetime}
							</td>
						</tr>
						<tr>
							<td width="15%" align="right">
								备注:
							</td>
							<td width="35%">
							${work.content}
							</td>
						</tr>
						
					
						
					</table>
					
				</form>
</body>
</html>