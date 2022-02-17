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
	
	#page a{
	    width: 100px;
	    height: 30px;
	    border:0px solid red;
	    font-weight: bold;
	}
	
	#page a:HOVER{
	    background: #F39800;
	    color: white;
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
            <div class="user-notice" style="background-color: white;">首页 &nbsp;>&nbsp;招聘信息</div>
            <!-- search -->
            <div class="lzy-subst lzy-box-bor" style="margin-top: 20px;">
                <div class="lzy-box-li">
                    <ul>
                    <c:forEach items="${list}" var="work">
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
                        <li id="page" style="border-bottom: 0px;color:#F39800">
                    <a href="javascript:void(0)" style="font-family:楷体;">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页</a>&nbsp;&nbsp;
                                                           
                     <a href="noticeMsg.do?index=1&key=${key}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
                     
                     <c:choose>
                     <c:when test="${index >1}">
                     <a href="noticeMsg.do?index=${index-1}&key=${key}" style="font-family:楷体;">上一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                     <c:when test="${pages>index}">
                     <a href="noticeMsg.do?index=${index+1}&key=${key}" style="font-family:楷体;">下一页</a>
                     </c:when>
                     <c:otherwise>
                     <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
                     </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <a href="noticeMsg.do?index=${pages}&key=${key}" style="font-family:楷体;">末页</a>
                    
                    </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>