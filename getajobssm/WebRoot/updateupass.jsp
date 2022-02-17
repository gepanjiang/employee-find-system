<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
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
    <title>网络人才招聘系统</title>
    <link type="text/css" rel="stylesheet" href="theme/css/core.css">
    <link type="text/css" rel="stylesheet" href="theme/css/home.css">
    <script type="text/javascript" src="/getajobssm/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
</head>
<body>
<jsp:include page="centertop.jsp"></jsp:include>
<section>
    <div class="lzy-content" id="lzy-adaption">
        <div class="lzy-boxes lzy-boxes-reg">
            <div class="lzy-shadow">
                <h2>修改密码</h2>
            </div>
<form action="updateUpass.do" method="post" name="f1">
            <div class="login_m">
                <div class="login_boder">
                    <div class="login_padding">
                        <h2>旧密码</h2>
                        <label>
                            <input type="password" name="oldupass" id="oldupass"  class="txt_input" placeholder="" required oninvalid="setCustomValidity('旧密码不能为空')" oninput="setCustomValidity('');">
                        </label>
                        
                        <h2>新密码</h2>
                        <label>
                            <input type="password" name="newupass" id="newupass" class="txt_input"  required oninvalid="setCustomValidity('新密码不能为空')" oninput="setCustomValidity('');" >
                        </label>
                        
                        <h2>确认密码</h2>
                        <label>
                            <input type="password" name="newupass1" id="newupass1" onblur="checkUpass()" class="txt_input" required oninvalid="setCustomValidity('确认密码不能为空')" oninput="setCustomValidity('');">
                        </label>
                        

                        <div class="rem_sub">
                            <div class="clearfix"><input type="submit" class="sub_button" name="button" id="button" value="提交"></div>
                            
                        </div>
                    </div>
                </div>
            </div>
</form>            
            
            
        </div>
        <div style="height:100px;"></div>
    </div>
</section>

<jsp:include page="foot.jsp"></jsp:include>

</body>
<script type="text/javascript">

function checkUpass(){
	var newupass = $("#newupass").val();
	var newupass1 = $("#newupass1").val();
	if(newupass!=newupass1){
		layer.msg('确认密码错误');
		$("#newupass1").val("");
	}
}


<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>

</script>
<script type="text/javascript">
$("a[name='li']").click(function(){
	$(this).attr("class","current");
	$("a[name='li']").not(this).attr("class","");
});
</script>
</html>