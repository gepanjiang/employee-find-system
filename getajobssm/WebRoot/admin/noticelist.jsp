<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告管理</title>
   
    
    <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="/getajobssm/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>

    <link href="/getajobssm/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="/getajobssm/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="/getajobssm/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/getajobssm/layer/layer.js" type="text/javascript"></script>
    
    <script src="/getajobssm/webui/combo/combo.js"
			type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的公告");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除吗?", function(){
				             window.location.href=encodeURI('noticeDel.do?idlist='+ idlist);
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
<body>


           <div class="search-title">
                <h2>
                                                公告管理
                </h2>
                <div class="description">
                    <a href="/getajobssm/admin/noticeadd.jsp">新增公告</a>
                </div>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="noticeList.do" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                标题:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="key" value="${key}" runat="server" class="input-txt" />
                        </div>
                    </div>
                    
                    <div class="search-form-item fn-left">
                       <div class="ui-button">
                        <input  class="ui-button-text" value="搜索"  type="submit" />
                        </div>
                    </div>
               </div>
                  
               
              </form>
            </div>
            <div class="action-details">
               
                  <a id="btnDelete" class="action-btn" href="#">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>
                
            </div>
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
								<th>
									选择
								</th>
								<th>
									<b>标题</b>
								</th>
								<th>
									<b>发布者</b>
								</th>
								<th>
									<b>发布时间</b>
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						  <c:when test="${fn:length(list)==0}">
							<tr>
								<td colspan="20">
									没有相关公告信息
								</td>
							</tr>
						  </c:when>
						  <c:otherwise>
						   <c:forEach items="${list}" var="notice">
								<tr>
									<td>
										&nbsp;
										<input id="chk" class="check"
											name="chk" type="checkbox"
											value='${notice.id}'>
									</td>
									<td>
										${notice.title}
									</td>
									<td>
										${notice.author}
									</td>
									
									<td>
										${notice.savetime}
									</td>
									<td>
										<a class="edit" href="showNotice.do?id=${notice.id}">修改</a>
									</td>
								</tr>
							 </c:forEach>
							</c:otherwise>
							</c:choose>
								<tr>
								
								<td align="center" style="font-weight: bold;font-family:楷体;font-weight: bold; color:blue" colspan="10">
                                                              共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页
                     <a href="noticeList.do?index=1&key=${key}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="noticeList.do?index=${index-1}&key=${key}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="noticeList.do?index=${index+1}&key=${key}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="noticeList.do?index=${pages}&key=${key}" style="font-family:楷体;">末页</a>
                 </td>
								
								</tr>
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
window.setTimeout(function(){location.replace('/getajobssm/admin/noticelist.jsp');},3000); 
<%}%>
</script>
</html>