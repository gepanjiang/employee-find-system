<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="/getajobssm/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    <script  type="text/javascript" src="/getajobssm/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/getajobssm/webui/jquery/messages_cn.js" ></script>
    <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script  type="text/javascript">
             $(function(){
                    $.metadata.setType("attr","validate");
                    $("#form1").validate();
             });
    </script>

  </head>
  
  <body>
   <form name="form1" class="form-horizontal" action="passEdit.action"  id="form1" method="post"  >
                <table border="0" cellspacing="1"  class="grid" cellpadding="0" width="100%" >
                <tr>
                      <td align="right" >原始密码 :</td>
                      <td align="left" >
                        <input name="password1"  type="password" id="password1" class="input-txt" validate="{required:true,messages:{required:'请输入确定密码'}}" />
                      </td>
                  </tr>
                   <tr>
						        <td colspan="4">
										<input type="submit" value="提交"/>
						       </td>
				  </tr>
              </table>
          </form>
  </body>
</html>
