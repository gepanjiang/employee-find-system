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

<section id="user-index">
    <div class="user-content">
        <div class="user-middle">
        
            <c:if test="${sessionScope.member ne null}">
            <div class="user-boxes  clearfix" >
                <div class="fl user-boxes-fl" style="width: 600px;border:0px solid red">
                    <div class="fl user-portrait-br"><img src="/getajobssm/upload/${member.filename}" width="164" height="164"></div>
                    <div class="fl user-portrait-ti" style="width: 200px;border:0px solid red;padding-left:54px;">
                        <h2 style="width: 200px;border:0px solid red">欢迎，${member.uname}</h2>
                        <p>用户类型：<span>${member.utype}</span></p>
                    </div>
                </div>
                </div>
           </c:if>
           
        </div>
        <div class="user-boxes-bk">
           <div class="user-boxes-ma">
               <div class="user-notice"><h3>个人信息</h3></div>
               <div class="user-present" >
                   <ul >
                       <li style="background-image: url('');float: left;border:0px solid red;line-height:40px;width: 260px;">
                        <label style="font-weight: bold;letter-spacing: 2px;">用户名:</label><span style="margin-left: 2px;">${member.uname}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">单位名称:</label><span style="margin-left: 2px;">${member.tname}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">联系电话:</label><span style="margin-left: 2px;">${member.tel}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">公司地址:</label><span style="margin-left: 2px;">${member.addr}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">公司简介:</label><span style="margin-left: 2px;">${member.ziwei}</span>
                       </li>
                   </ul>
                   <div style="clear: both;" ></div>
               </div>
           </div>
            
            <div style="height:65px;"></div>
            <div style="height:65px;"></div>
        </div>
        <div style="height:65px;"></div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>