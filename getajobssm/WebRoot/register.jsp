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
    <title>网络人才招聘系统</title>
    <link type="text/css" rel="stylesheet" href="theme/css/core.css">
    <link type="text/css" rel="stylesheet" href="theme/css/home.css">
    <script type="text/javascript" src="/getajobssm/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
</head>
<body>
<% 
String utype = request.getParameter("utype");
%>
<jsp:include page="top.jsp"></jsp:include>
<section>
    <div class="lzy-content" id="lzy-adaption">
        <div class="lzy-boxes lzy-boxes-reg">
            <div class="lzy-shadow">
                <h2>用户注册资料</h2>
            </div>
<form action="Register.do" method="post" name="f1">
<input type="hidden" name="utype" value="<%=utype %>"/>
            <div class="login_m">
                <div class="login_boder">
                    <div class="login_padding">
                        <h2>头像</h2>
                        <label>
                           <input name='filename' type='text' class="txt_input txt_input2" required    id='url'  size='50' value='' />&nbsp;
                           <input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/> 
                        </label>
                        <h2>用户名</h2>
                        <label>
                            <input type="text" id="uname" name="uname" onblur="checkUname()" class="txt_input txt_input2"  placeholder="" required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('');">
                        </label>
                        <h2>密码</h2>
                        <label>
                            <input type="password" id="upass" name="upass" class="txt_input txt_input2"  placeholder="" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');">
                        </label>
                        
                        <h2>重复密码</h2>
                        <label>
                            <input type="password" id="upass1" name="upass1" onblur="checkUpass()" class="txt_input txt_input2" value="" placeholder="" required oninvalid="setCustomValidity('重复密码不能为空')" oninput="setCustomValidity('');">
                        </label>
                        
                        
                        <h2>邮箱</h2>
                        <label>
                            <input type="email" name="email" id="email" class="txt_input" required >
                        </label>
                        

                        <div class="rem_sub">
                            <div class="clearfix"><input type="submit" class="sub_button" name="button" id="button" value="注册"></div>
                            <div class="reg"><a href="login.jsp">我有帐号，去登录</a></div>
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
function up(tt)
{
		    layer.open({
		      type: 2,
		      title: '上传文件',
		      shadeClose: true,
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['450px', '200px'],
		      content: 'upload.jsp?Result='+tt
		    });
}	

function checkUpass(){
	var upass = $("#upass").val();
	var upass1 = $("#upass1").val();
	if(upass!=upass1){
		layer.msg('重复密码错误');
		$("#upass1").val("");
	}
}

function checkUname(){
	var uname = $("#uname").val();
	$.ajax({
		type:"post",
		url:"checkUname.do",
		data:"uname="+uname,
		success:function(msg){
			if(msg==1){
				layer.msg('已存在的用户名,请更换!');
				$("#uname").val("");
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