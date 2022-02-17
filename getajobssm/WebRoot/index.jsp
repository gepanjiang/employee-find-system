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
    .lzy-box-li .count ul li { 
    border-bottom:0px solid #dedede;
    padding-bottom:0px; 
    padding-top:2px;
    font-size:12px;
    color:gray;
    border:0px solid red;
    float: left;
    margin: 0px 10px;
    height: 40px;
    line-height: 40px;
    }
    
    .count{
    border:0px solid red;
    float: left;
    width: 100%
    }
    .title{
    font-weight: bold;
    margin: 0 5px;
    letter-spacing: 1px;
    }
    
    .lzy-nubbin-tex h2 a {
    font-size: 15px;
    color: #f39800;
	}
	
	.user-notice{
	background-color: white;
	font-size: 14px;
    color: #f39800;
    height: 60px;
    line-height: 60px;
    padding-left: 42px;
    font-weight: bold;
	}
    </style>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<section>
   <div class="lzy-nubbin"></div>
</section>

<section>
    <div class="lzy-service-box">
        <div class="lzy-container">
            <!-- search -->
            <div class="user-notice" style="background-color: white;">首页 &nbsp;>&nbsp;最新招聘信息</div>
            <div class="lzy-query" style="text-align:center;margin-top: 20px;">
                <form action="index.do" method="post" name="f1">
                    <label>在线查询</label>
                    <input type="text" placeholder="请输入职位..." value="${ziwei}" name="ziwei" style="width: 200px;" class="box-input">
                    <input type="text" placeholder="薪资大于..." value="${salary}" name="salary" style="width: 200px;" class="box-input">
                    <input type="submit" placeholder="" value="查询" class="box-submit" name="">
                </form>
            </div>
            <!-- search -->
            <div class="lzy-subst lzy-box-bor" style="margin-top: 20px;">
                <div class="lzy-box-li">
                    <ul>
                    <c:forEach items="${list}" var="work" begin="0" end="3">
                        <li class="clearfix">
                            <div class="lzy-nubbin-box"><img src="/getajobssm/upload/${work.filename }" width="144" height="96" title=""></div>
                            <div class="lzy-nubbin-tex" style="border:0px solid red;padding-top: 5px;">
                                <h2><a href="showWork.do?type=details&id=${work.id}">${work.title}</a></h2>
                                <div class='count'>
                                  <ul>
                                    <li> 
                                      <label class="title">发布时间:</label>${work.savetime}
                                    </li>
                                    <li> 
                                      <label class="title">招聘人数:</label>${work.pnum}
                                    </li>
                                    <li> 
                                      <label class="title">薪资待遇:</label>${work.salary}
                                    </li>
                                    <li> 
                                      <label class="title">职位:</label>${work.ziwei}
                                    </li>
                                  </ul>
                                  <div style="clear: both;"></div>
                                </div>
                                <p style="margin-top: 10px;">
                                      ${work.content}                                                 
                                </p>
                            </div>
                        </li>
                    </c:forEach>  
                        
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>