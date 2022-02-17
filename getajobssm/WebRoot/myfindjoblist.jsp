<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
   <meta name="author" content="order by dede58.com/" />
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta content="telephone=no" name="format-detection">
    <meta content="Li Zhen Ya Team" name="author">
    <title>网络人才招聘系统</title>
    <link type="text/css" rel="stylesheet" href="theme/css/core.css">
    <link type="text/css" rel="stylesheet" href="theme/css/home.css">
</head>
<body>

<jsp:include page="centertop.jsp"></jsp:include>

<section>
   <div class="lzy-nubbin"></div>
</section>

<section>
    <div class="lzy-content lzy-content-order">
        <div class="lzy-boxes lzy-boxes-order clearfix">
            <div class="tabPanel clearfix">
                <div class="panes">
                    <div class="pane" style="display:block;">
                        <div class="panes-tab capital-list ">
                            <h3>求职信息</h3>
                        </div>
                        <div class="lzy-tab2">
                            <form action="myfindjobList.do" method="post" id="form1">
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick">
                                <tr>
                                    <td style="width:220px;">标题 <input placeholder="" value="${key}" name="key" ></td>
                                    <td align="right"><a href="javascript:form1.submit();">查询</a>&nbsp;<a href="javascript:location.replace('findjobadd.jsp');">发布求职信息</a></td>
                                    
                                </tr>
                            </table>
                           </form>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick-bk tab-capital">
                                <tr>
                                    <th>标题</th>
                                    <th>求职者</th>
                                    <th>发布时间</th>
                                    <th>期望薪资</th>
                                    <th>职位</th>
                                    <th>工作地点</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${list}" var="findjob">
                                <tr>
                                    <td>${findjob.title}</td>
                                    <td>${findjob.member.tname}</td>
                                    <td>${findjob.savetime}</td>
                                    <td>${findjob.salary}</td>
                                    <td>${findjob.ziwei}</td>
                                    <td>${findjob.addr}</td>
                                    <td>
                                    <a href="showFindjob.do?id=${findjob.id}">编辑</a>
                                    <a href="findjobDel.do?id=${findjob.id}">删除</a>
                                    </td>
                                </tr>
								</c:forEach>

                            </table>

                        </div>
                        <div class="lzy-page clearfix">
                     <a href="javascript:void(0)" style="font-family:楷体;">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页</a>&nbsp;&nbsp;
                                                           
                     <a href="myfindjobList.do?index=1&key=${key}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="myfindjobList.do?index=${index-1}&key=${key}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="myfindjobList.do?index=${index+1}&key=${key}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="myfindjobList.do?index=${pages}&key=${key}" style="font-family:楷体;">末页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>