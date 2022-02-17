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
<footer>
    <div class="lzy-adaption">
        <div class="lzy-copyright">
            <p>Copyright © 2018 网络人才招聘系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="/getajobssm/admin/login.jsp" style="color:#f39800" target="block">后台管理</a></p>
        </div>
    </div>
</footer>

</body>
</html>

