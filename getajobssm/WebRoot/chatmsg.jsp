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
	
	#comment{
	width: 100%;
	border:0px solid red;
	margin-top: 10px;
	margin-left: 20px;
	}
	
	#chat:hover {
    background-color:#FFE5B9;
	}
	
	
	#count tr td{
	color: #7D7D7D;
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
            <!-- 评论 -->
            <div class="tabPanel clearfix">
                <ul>
                    <li class="hit">在线留言</li>
                </ul>
                <ul style="border-bottom: 0px;">
                    <li style="height: 30px;"></li>
                </ul>
                
                <c:forEach items="${list}" var="chat">
                <div id="chat">
                  <div style="float: left;border:0px solid blue"><img src="/getajobssm/upload/${chat.member.filename}" style="width:60px;height:60px; border-radius:30px 30px;"/></div>
                  <div id="count" style="float: left;margin-left: 20px;width: 80%;font-weight: bold;border-bottom: 0px solid red">
                    <table border=0 style="width: 100%;">
                      <tr>
                      <td style="width: 60px;height: 30px;font-weight: bold;">${chat.member.uname}</td>
                      <td>${chat.savetime}</td>
                      </tr>
                      <tr><td colspan="2" style="height: 10px;"></td></tr>
                      <tr><td colspan="2" align="left">${chat.content}</td></tr>
                      <tr><td colspan="2" style="height: 10px;"></td></tr>
                      <c:if test="${chat.hfcontent ne ''}">
                      <tr><td colspan="2" align="left"><font style="font-weight: bold;">回复:</font>&nbsp;&nbsp;${chat.hfcontent}</td></tr>
                      </c:if>
                    </table>
	              </div>
	              <div style="clear: both;height: 20px;"></div>
            	</div>
            	</c:forEach>
                
                <div class="panes">
                    <div class="pane" style="display:block;">
                        <div class="panes-tab">
                            <h3>留言填写</h3>
                        </div>
                        <div class="lzy-tab">
                        <form action="chatAdd.do" method="post" name="f1">
                        <input type="hidden" name="workid" value="${work.id}"/>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-sender">
                                <tr>
                                    <td>留言内容：</td>
                                    <td >
                                      <input  name="content" style="width: 568px;height: 50px;" required oninvalid="setCustomValidity('个人介绍不能为空')" oninput="setCustomValidity('');">
                                    </td>
                                </tr>
                            </table>
                            <div class="tab-text clearfix"></div>
                            <div class="tab-submit">
                                <input type="submit" value="提交" style="width: 150px;height: 40px;color: white;background-color:#F39800;border: 1px solid #F39800">
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 评论 -->
            
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


function vote(){
	var wid = $("#wid").val();
	$.ajax({
       type:"post",
       date:"",
       url:"voteAdd.do?workid="+wid,
       success:function(msg){
          if(msg==0){
             layer.msg("投票成功");
             var votenum = parseInt($("#votenum").html())+1;
             $("#votenum").html(votenum);
          }else if(msg==1){
        	 layer.msg("只能投票一次");
          }
	   }
	})
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>