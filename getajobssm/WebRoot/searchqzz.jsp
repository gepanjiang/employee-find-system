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
    <style type="text/css">
    .user-notice{
	background-color: white;
	font-size: 14px;
    color: #f39800;
    height: 60px;
    line-height: 60px;
    padding-left: 42px;
    font-weight: bold;
    width: 1140px;
    margin: 0 170px;
	}
    </style>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<section>
   <div class="lzy-nubbin"></div>
</section>

<section>



    <div class="lzy-content lzy-content-order">
    
    <div class="tabPanel clearfix" >
    <div class="user-notice" style="background-color: white;">首页 &nbsp;>&nbsp;检索求职者信息</div>
        <div class="lzy-boxes lzy-boxes-order clearfix" style="margin-top: 20px;">
                <div class="panes">
                    <div class="pane" style="display:block;">
                        <div class="panes-tab capital-list ">
                            <h3>检索求职者信息</h3>
                        </div>
                        <div class="lzy-tab2">
                            <form action="searchQzz.do" method="post" id="form1">
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick">
                                <tr>
                                    <td style="width:220px;">职位 <input placeholder="" value="${ziwei}" name="ziwei" ></td>
                                    <td style="width:220px;">专业 <input placeholder="" value="${major}" name="major" ></td>
                                    <td align="right"><a href="javascript:form1.submit();">查询</a></td>
                                </tr>
                            </table>
                           </form>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-pick-bk tab-capital">
                                <tr>
                                    <th>姓名</th>
                                    <th>年龄</th>
                                    <th>电话</th>
                                    <th>地址</th>
                                    <th>所学专业</th>
                                    <th>求职意向</th>
                                    <th>个人简历</th>
                                </tr>
                                <c:forEach items="${list}" var="member">
                                <tr>
                                    <td>${member.tname}</td>
                                    <td>${member.age}</td>
                                    <td>${member.tel}</td>
                                    <td>${member.addr}</td>
                                    <td>${member.major}</td>
                                    <td>${member.ziwei}</td>
                                    <td>
                                    <c:choose>
                                      <c:when test="${member.flag==1}">
                                      <a href="shJianli.do?memberid=${member.id}">查看简历</a>
                                      </c:when>
                                      <c:otherwise>
                                      <a href="javascript:void(0)">暂无简历信息</a>
                                      </c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
								</c:forEach>

                            </table>

                        </div>
                        <div class="lzy-page clearfix">
                     <a href="javascript:void(0)" style="font-family:楷体;">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页</a>&nbsp;&nbsp;
                                                           
                     <a href="searchQzz.do?index=1&ziwei=${ziwei}&major=${major}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="searchQzz.do?index=${index-1}&ziwei=${ziwei}&major=${major}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="searchQzz.do?index=${index+1}&ziwei=${ziwei}&major=${major}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="searchQzz.do?index=${pages}&ziwei=${ziwei}&major=${major}" style="font-family:楷体;">末页</a>
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