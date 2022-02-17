<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
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
    <script type="text/javascript" src="theme/js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
        $(function(){
            $('.tabPanel ul li').click(function(){
                $(this).addClass('hit').siblings().removeClass('hit');
                $('.panes>div:eq('+$(this).index()+')').show().siblings().hide();
            })
        })
    </script>
    
    <style type="text/css">
      .register a:HOVER {
	color:#f39800;
    }
    </style>

</head>

<body>
<header id="lzy-header">
 <div class="register" style="border:0px solid red;text-align: right;width: 1300px;padding-top: 20px;">
       <c:choose>
       <c:when test="${sessionScope.member eq null}">
       <a href="login.jsp" style="color:#f39800 ">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="chooseregister.jsp">注册</a>
       </c:when>
       <c:otherwise>
       <span  class="sign" style="color:#f39800">欢迎，${sessionScope.member.uname}&nbsp;(${sessionScope.member.utype})&nbsp;&nbsp;<a href="memberCenter.do" style="color:#f39800">个人中心</a></span>&nbsp;&nbsp;
       <a href="memberExit.do">退出</a>
       </c:otherwise>
       </c:choose>
     </div>
    <div class="lzy-container clearfix" style="height: 125px;">
        <div class="lzy-he-logo">
            <h1>
                <a href="index.do" style="font-size: 30px;color: #907D7D">网络人才招聘系统</a>
            </h1>
        </div>
        
        <div class="lzy-che-nav" style="position:inherit;">
            <ul>
                <li><a href="index.do">首页</a></li>
                <li><a href="noticeMsg.do">公告信息</a></li>
                <li><a href="newsMsg.do">新闻信息</a></li>
                <li><a href="findjobMsg.do">求职信息</a></li>
                <li><a href="workListMsg.do">招聘信息</a></li>
                <c:if test="${sessionScope.member.utype eq '招聘者'}">
                <li><a href="searchqzz.jsp">求职者信息</a></li>
                </c:if>
                <li><a href="chatMsg.do">在线留言</a></li>
            </ul>
        </div>
    </div>
</header>
</body>
<script type="text/javascript">
$("ul li a").click(function(){
	$(this).attr("class","current");
	$("ul li a").not(this).attr("class","");
});
</script>
</html>

