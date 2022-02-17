<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.removeAttribute("admin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

<link href="/getajobssm/admin/css/login.css" rel="stylesheet" type="text/css" />
<link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />


<script src="/getajobssm/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    <script  type="text/javascript" src="/getajobssm/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/messages_cn.js" ></script>
    
    <script  type="text/javascript">
             $(function(){
                    $.metadata.setType("attr","validate");
                    $("#form1").validate();
             });
    </script>
<style type="text/css">
.orange-button
{
	height: 30px;
	line-height: 30px;
	color: #fff;
	background-color: #f57403;
	border-color: #d66500;
	font-weight: 400;
	text-align: center;
	background-image: none;
	border-radius: 2px;
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	text-decoration: none;
	vertical-align: middle;
	padding: 0 20px;
}
</style>
</head>
<body style="background: #F0F0F0;">
	<div class="wrap" style="height: 638px;">
        <form method="post" action="login.do" id="form1">
           
           <input type="hidden" name="actiontype" value="login" />
           <input name="usertype" value="0" type="hidden" >
         
		<div style="width:600px; margin-top:110px; margin-left:200px;">

			<div class="whitebox">

				<h1>人才招聘后台管理系统</h1>
				<div class="reg-box">
					<div class="reg-content">
                        <dl>
                            <%
                            String no = (String)request.getAttribute("no");
                            String error = (String)request.getAttribute("error");
                            if(no!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>验证码不正确</font>");}
                            if(error!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>用户名或密码错误</font>");}
                             %>
						</dl>

						<dl>
							<dt>用户名:</dt>
							<dd>
								<input type="text" class="ui-input"  id="username" validate="{required:true,messages:{required:'请输入用户名'}}"
									name="username" > <i></i>
							</dd>
						</dl>
						
						<dl>
							<dt>密码:</dt>
							<dd>

								<input type="password" class="ui-input" id="userpwd" validate="{required:true,messages:{required:'请输入密码'}}"
									name="userpwd" > <i> </i>
							</dd>

						</dl>
						<dl>
							<dt> 
								 <img id="vcodeimg" src="<%=path %>/plusin/image.jsp" style="cursor: hand" onclick="this.src='<%=path %>/plusin/image.jsp?time=' + Math.random()"
                                title="点击刷新验证码" align="absMiddle" src="" />
							 </dt>
							<dd>
						    
							<input type="text" name="validcode" id="txtTextcode" autocomplete="off"  class="ui-input" validate="{required:true,messages:{required:'请输入验证码'}}">
                        

							</dd>

						</dl>
					

						<dl>
							<dt></dt>
							<dd>

								<input type="submit" class="orange-button" id="btnLogin" value="登录"
									name="btnLogin">

							</dd>

						</dl>


					</div>


				</div>


			</div>


		</div>
       </form>
	</div>
</body>
</html>