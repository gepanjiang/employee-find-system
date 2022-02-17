<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<jsp:include page="top.jsp"></jsp:include>
<section>
    <div class="lzy-content" id="lzy-adaption">
        <div class="lzy-boxes lzy-boxes-cpa clearfix">
            <div class="lzy-boxes-fl fl">
                <div class="lzy-reg-title"><h2>求职者用户</h2></div>
                <div class="lzy-reg-image"><img src="theme/img/icon/ic-reg-in.png"></div>
                <div class="lzy-reg-button" style="padding-top:20px;"><a href="register.jsp?utype=求职者">求职者注册</a></div>
            </div>
            <div class="lzy-boxes-fl lzy-boxes-fr fr">
                <div class="lzy-reg-title"><h2>招聘者用户</h2></div>
                <div class="lzy-reg-image"><img src="theme/img/icon/ic-reg-fo.png"></div>
                <div class="lzy-reg-lists lzy-reg-lists-b">
                </div>
                <div class="lzy-reg-button lzy-reg-button-b"><a href="register.jsp?utype=招聘者">招聘者注册</a></div>
            </div>

        </div>
        <div style="height:80px;"></div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>