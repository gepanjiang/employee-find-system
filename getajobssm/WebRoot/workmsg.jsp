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
                            <h3>我发布的招聘信息</h3>
                        </div>
                        <div class="lzy-tab2">
                            <form action="workMsg.do" method="post" id="form1">
                            <input type="hidden" name="memberid" value="${sessionScope.member.id}">
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick">
                                <tr>
                                    <td style="width:220px;">标题 <input placeholder="" value="${key}" name="key" ></td>
                                    <td align="right"><a href="javascript:form1.submit();">查询</a>&nbsp;<a href="javascript:location.replace('workadd.jsp');">发布招聘信息</a></td>
                                    
                                </tr>
                            </table>
                           </form>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick-bk tab-capital">
                                <tr>
                                    <th>标题</th>
                                    <th>招聘人数</th>
                                    <th>学历要求</th>
                                    <th>薪资</th>
                                    <th>招聘职位</th>
                                    <th>联系人</th>
                                    <th>联系电话</th>
                                    <th>发布时间</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${list}" var="work">
                                <tr>
                                    <td>${work.title}</td>
                                    <td>${work.pnum}</td>
                                    <td>${work.xueli}</td>
                                    <td>${work.salary}</td>
                                    <td>${work.ziwei}</td>
                                    <td>${work.name}</td>
                                    <td>${work.tel}</td>
                                    <td>${work.savetime}</td>
                                    <td>
                                    <a href="showWork.do?id=${work.id}">编辑</a>
                                    <a href="workDel.do?id=${work.id}">删除</a>
                                    </td>
                                </tr>
								</c:forEach>

                            </table>

                        </div>
                        <div class="lzy-page clearfix">
                     <a href="javascript:void(0)" style="font-family:楷体;">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页</a>&nbsp;&nbsp;
                                                           
                     <a href="workMsg.do?index=1&&key=${key}&memberid=${memberid}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="workMsg.do?index=${index-1}&key=${key}&memberid=${memberid}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="workMsg.do?index=${index+1}&key=${key}&memberid=${memberid}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="workMsg.do?index=${pages}&key=${key}&memberid=${memberid}" style="font-family:楷体;">末页</a>
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