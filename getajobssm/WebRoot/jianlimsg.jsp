<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    #edit a { width:120px; height:35px; display:inline-block; line-height:35px; text-align:center; font-size:14px; color:#fff; background-color:#f39800;  border-radius:2px;}
    #edit a:hover { background-color:#e48f02;}
    </style>
</head>
<body>

<jsp:include page="centertop.jsp"></jsp:include>

<section>
   <div class="lzy-nubbin"></div>
</section>

<section id="user-index">
    <div class="user-content">
        <div class="user-middle">
        
            <div class="user-boxes  clearfix" >
                <div class="fl user-boxes-fl" style="width: 600px;border:0px solid red">
                    <div class="fl user-portrait-br"><img src="/getajobssm/upload/${jianli.member.filename}" width="164" height="164"></div>
                    <div class="fl user-portrait-ti" style="width: 200px;border:0px solid red;padding-left:54px;">
                        <h2 style="width: 200px;border:0px solid red">欢迎，${jianli.member.tname}</h2>
                        <p>用户类型：<span>${jianli.member.utype}</span></p>
                    </div>
                </div>
                <div class="fr user-boxes-fr" style="padding: 0px;">
                   <img alt="" src="<%=path %>/upload/${jianli.filename}" style="width: 340px;height: 206px;">
                </div>
                </div>
           
        </div>
        <div class="user-boxes-bk">
           <div class="user-boxes-ma">
               <div class="user-notice"><h3>个人简历<span id="edit" style="float: right;margin: 0px 10px;"><a href="javascript:location.replace('showJianlitoEdit.do?id=${jianli.id}');">编辑简历信息</a></span></h3></div>
               <div class="user-present" >
                   <ul >
                       <li style="background-image: url('');float: left;border:0px solid red;line-height:40px;width: 260px;">
                        <label style="font-weight: bold;letter-spacing: 2px;">姓名:</label><span style="margin-left: 2px;">${jianli.member.tname}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">性别:</label><span style="margin-left: 2px;">${jianli.sex}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">年龄:</label><span style="margin-left: 2px;">${jianli.member.age}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">联系电话:</label><span style="margin-left: 2px;">${jianli.member.tel}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">邮箱:</label><span style="margin-left: 2px;">${jianli.member.email}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">家庭住址:</label><span style="margin-left: 2px;">${member.addr}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">专业:</label><span style="margin-left: 2px;">${jianli.member.major}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">毕业学校:</label><span style="margin-left: 2px;">${jianli.xueyuan}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">政治面貌:</label><span style="margin-left: 2px;">${jianli.mianmao}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">学历:</label><span style="margin-left: 2px;">${jianli.xueli}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">应聘职位:</label><span style="margin-left: 2px;">${jianli.ziwei}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 260px;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">期望薪资:</label><span style="margin-left: 2px;">${jianli.salary}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 100%;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">求职意向:</label><span style="margin-left: 2px;">${jianli.qzyixiang}</span>
                       </li>
                       <li style="background-image: url('');float: left;border:0px solid red;width: 100%;height: 40px;line-height:40px;">
                       <label style="font-weight: bold;letter-spacing: 2px;">工作经历:</label><span style="margin-left: 2px;">${jianli.gzjingli}</span>
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