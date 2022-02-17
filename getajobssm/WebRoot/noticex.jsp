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
    <script type="text/javascript" src="/getajobssm/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
    <style type="text/css">
    .user-present ul li {
    list-style:none;
    no-repeat;
    font-size: 12px;
    font-family: '微软雅黑';
    }
    .user-present ul label {
    letter-spacing: 2px;
    font-family: '微软雅黑';
    margin: 0 5px;
    font-weight: bold;
    }
    .workpro{
    border:0px solid red;
    padding-left:20px;
    width: 600px;
    float: left;
    }
    .workimg{
    border:0px solid red;
    float: left;
    }
    .workimg img{
    width: 300px;
    height: 250px;
    }
    .workcontent{
    width: 100%;
    border:0px solid red;
    margin-top: 10px;
    }
    
    .workpro ul li a:hover {
    background-color: #e48f02;
	}
	.workpro ul li a {
        width: 120px;
    height: 35px;
    display: inline-block;
    line-height: 35px;
    text-align: center;
    font-size: 14px;
    color: #fff;
    background-color: #f39800;
    border-radius: 2px;
	}
    </style>
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
                <div class="user-notice user-notice-cl"><h3>公告详情</h3></div>
                <div class="user-present" style="border:0px solid red">
                    <div class="workimg">
                     <img alt="" src="/getajobssm/upload/${notice.filename}">
                   </div>
                   <div class="workpro">
                    <ul>
                       <li style="background-image: url('');font-size:24px;color: #F39800;font-family: '微软雅黑'">${notice.title}</li>
                       <li style="background-image: url('');height: 20px;"></li>
                       <li style="background-image: url('');"><label>发布时间:</label>${notice.savetime}</li>
                    </ul>
                   </div>
                    <div style="clear: both;"></div>
                    <div class="workcontent">
                    <p>${notice.content}</p>
                    </div>
                </div>
            </div>
            <div style="height:65px;"></div>
        </div>
        <div style="height:65px;"></div>
    </div>
</section>
<jsp:include page="foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
function Iswsinfo(){
	var wid = $("#wid").val();
	$.ajax({
       type:"post",
       date:"",
       url:"Iswsinfo.do",
       success:function(msg){
          if(msg==0){
             layer.msg("请选完善个人信息");
          }else if(msg==1){
        	 layer.msg("请选完善简历信息");
          }else{
			location.replace("uploadjianli.jsp?wid="+wid);
          }
	   }
	})
}
</script>
</html>