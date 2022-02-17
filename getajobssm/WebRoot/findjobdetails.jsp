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

<jsp:include page="top.jsp"></jsp:include>

<section>
   <div class="lzy-nubbin"></div>
</section>

<section id="user-index">
    <div class="user-content">
        <div class="user-boxes-bk">
            <div class="user-boxes-ma" >
                <div class="user-notice user-notice-cl"><h3>求职信息详情</h3></div>
                <div class="user-present">
                    <ul>
                       <li style="background-image: url('');font-size:24px;color: #F39800;font-family: '楷体'">${findjob.title}</li>
                       <li style="background-image: url('');height: 20px;"></li>
                       <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'"><label style="letter-spacing: 2px;font-family: '楷体'">发布人:</label>&nbsp;&nbsp;&nbsp;&nbsp;${findjob.member.tname}</li>
                       <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'"><label style="letter-spacing: 2px;font-family: '楷体'">发布时间:</label>&nbsp;&nbsp;&nbsp;&nbsp;${findjob.savetime}</li>
                       <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'"><label style="letter-spacing: 2px;font-family: '楷体'">职位:</label>&nbsp;&nbsp;&nbsp;&nbsp;${findjob.ziwei}</li>
                       <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'"><label style="letter-spacing: 2px;font-family: '楷体'">期望薪资:</label>&nbsp;&nbsp;&nbsp;&nbsp;${findjob.salary}</li>
                       <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'"><label style="letter-spacing: 2px;font-family: '楷体'">工作地点:</label>&nbsp;&nbsp;&nbsp;&nbsp;${findjob.addr}</li>
                       <li style="background-image: url('');height: 30px;"></li>
                        <li style="background-image: url('');font-size:18px;color: #F39800;font-weight: bold;font-family: '楷体'">求职者介绍</li>
                        <li style="background-image: url('');font-weight: bold;font-size: 12px;font-family: '楷体'">${findjob.content}</li>
                    </ul>
                    <div style="clear: both;"></div>
                </div>
            </div>
            
            
            
                        
                        
                        
            <div style="height:65px;"></div>
        </div>
        <div style="height:65px;"></div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>