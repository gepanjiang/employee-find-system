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
    <title>网络人才招聘系统</title>
    <link type="text/css" rel="stylesheet" href="theme/css/core.css">
    <link type="text/css" rel="stylesheet" href="theme/css/home.css">
    <script type="text/javascript" src="/getajobssm/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<section>
    <div class="lzy-content" id="lzy-adaption">
        <div class="lzy-boxes">
            <div class="lzy-shadow">
                <h2><i></i>登录</h2>
            </div>
<form action="Login.do" method="post" name="f1">
            <div class="login_m">
                <div class="login_boder">
                    <div class="login_padding">
                        <h2>用户名</h2>
                        <label>
                            <input type="text" id="uname" name="uname" class="txt_input txt_input2"   required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('');">
                        </label>
                        <h2>密码</h2>
                        <label>
                            <input type="password" id="upass" name="upass" class="txt_input" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');">
                        </label>

                        <div class="rem_sub">
                        <!-- 
                            <div class="clearfix">
                                <div class="rem_sub_l fl"><input type="checkbox" name="checkbox" id="save_me" placeholder=""><label for="checkbox">记住我的登录状态</label></div>
                                <div class="forgot fr"><a href="javascript:void(0);">忘记密码?</a></div>
                            </div>
                             -->
                            <div class="clearfix"><input type="submit" class="sub_button" name="button" id="button" value="登录"></div>
                            <div class="reg"><a href="chooseregister.jsp">立即注册</a></div>
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
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</body>
</html>