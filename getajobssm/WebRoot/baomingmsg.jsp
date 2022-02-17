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
                            <h3>求职者递交的简历</h3>
                        </div>
                        <div class="lzy-tab2">
                            <form action="baomingMsg.do" method="post" id="form1">
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick">
                                <tr>
                                    <td style="width:220px;">求职者 <input placeholder="" value="${key}" name="key" ></td>
                                    <td align="right"><a href="javascript:form1.submit();">查询</a></td>
                                    
                                </tr>
                            </table>
                           </form>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick-bk tab-capital">
                                <tr>
                                    <th>求职者</th>
                                    <th>应聘工作</th>
                                    <th>求职者简历</th>
                                    <th>提交时间</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${list}" var="baoming">
                                <tr>
                                    <td>${baoming.member.tname}</td>
                                    <td>${baoming.work.title}</td>
                                    <td><a target="_blank" href="upload/${baoming.filename}">查看简历</a></td>
                                    <td>${baoming.savetime}</td>
                                    <td>
                                    <a href="baomingDel.do?id=${baoming.id}">删除</a>
                                    </td>
                                </tr>
								</c:forEach>

                            </table>

                        </div>
                        <div class="lzy-page clearfix">
                     <a href="javascript:void(0)" style="font-family:楷体;">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页</a>&nbsp;&nbsp;
                                                           
                     <a href="baomingMsg.do?index=1&&key=${key}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="baomingMsg.do?index=${index-1}&key=${key}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="baomingMsg.do?index=${index+1}&key=${key}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="baomingMsg.do?index=${pages}&key=${key}" style="font-family:楷体;">末页</a>
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