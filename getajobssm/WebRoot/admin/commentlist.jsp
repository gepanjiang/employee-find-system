<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.util.Info"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>评论信息</title>
<link href="/getajobssm/admin/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="/getajobssm/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/getajobssm/webui/jquery/jquery-1.9.0.js"></script>
<link
	href="/getajobssm/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="/getajobssm/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="/getajobssm/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="/getajobssm/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="/getajobssm/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="/getajobssm/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
	<script src="/getajobssm/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的评论");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除吗?", function(){
				             window.location.href=encodeURI('commentDel.do?idlist='+ idlist);
						  });
					});
					$("#btnCheckAll").click(function() {
						var ischeck = false;
						$(".check").each(function() {
							if ($(this).is(":checked")) {
								$(this).prop("checked", "");
								ischeck = false;
							} else {
								$(this).prop("checked", "true");
								ischeck = true;
							}
						});
						if ($(this).text() == "选择记录")
							$(this).text("取消选择");
						else
							$(this).text("选择记录");
					})
	});
</script>
</head>
<body >
			<div class="search-title">
				<h2>评论管理</h2>
				<div class="description">
				</div>
			</div>
			<!-- 搜索控件开始 -->
			<div class="search-options">
				<form id="searchForm"
					action="commentList.do"
					method="post">
					<table class="grid" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td>评论内容 <input name="key" value="${key}"
									class="input-txt" type="text" id="accountname" />
									<div class="ui-button">
										<input type="submit" value="搜索" id="btnSearch"
											class="ui-button-text" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 搜索控件结束 -->
			<div class="clear"></div>
			<div class="action-details">

<a id="btnDelete" class="action-btn" href="javascript:void(0)">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>

			</div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						<th><b>评论人</b>
						</th>
						<th><b>评论时间</b>
						</th>
						<th><b>评论内容</b>
						</th>
						<th><b>用户类型</b>
						</th>
					</tr>
				</thead>
				<tbody>
						<c:choose>
						  <c:when test="${fn:length(list)==0}">
							<tr>
								<td colspan="20">没有相关评论信息</td>
							</tr>
						  </c:when>
						  <c:otherwise>
						 <c:forEach items="${list}" var="comment">
						<tr>
							<td>&nbsp;<input id="chk${comment.id}" class="check" name="chk${comment.id}" type="checkbox" value='${comment.id}'/>
							</td>
							<td>${comment.member.uname}</td>
                            <td>${comment.savetime}</td>
							<td>${comment.content}</td>
							<td>${comment.member.utype}</td>
						</tr>
						 </c:forEach>
						 <tr>
		        <td align="center" style="font-weight: bold;font-family:楷体;font-weight: bold; color:blue" colspan="10">
                                                              共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页
                     <a href="commentList.do?index=1&key=${key}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="commentList.do?index=${index-1}&key=${key}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="commentList.do?index=${index+1}&key=${key}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="commentList.do?index=${pages}&key=${key}" style="font-family:楷体;">末页</a>
                 </td>
		        </tr>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="clear"></div>
	
	
</body>
<script type="text/javascript">

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script> 
</html>
