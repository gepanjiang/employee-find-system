<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="law.jsp"%>
<html>
  <head>
    <title>后台用户中心</title>
   <script type="text/javascript" src="/getajobssm/webui/jquery/jquery-1.8.3.min.js"></script>
   <script  type="text/javascript" src="/getajobssm/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/getajobssm/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/getajobssm/webui/jquery/messages_cn.js" ></script>
  
   <link href="/getajobssm/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/getajobssm/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/getajobssm/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
   <link href="/getajobssm/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/getajobssm/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
     <script  type="text/javascript">
             $(function(){
                    $.metadata.setType("attr","validate");
                    $("#form1").validate();
             });
    </script>
  </head>
  <body >
    	  <div class="search-title">
		      <h2>修改密码</h2>
		<div class="description">
		</div>
	</div>
	<form name="form1" class="form-horizontal" action="passEdit.do"  id="form1" method="post"  >
                <table border="0" cellspacing="1"  class="grid" cellpadding="0" width="100%" >
                <tr>
                      <td align="right" >原始密码 :</td>
                      <td align="left" >
                        <input name="password1"  type="password" id="password1" class="input-txt" validate="{required:true,messages:{required:'请输入原始密码'}}" />
                      </td>
                  </tr>
                 <tr>
                      <td align="right">新密码 :</td>
                      <td align="left" >
                        <input name="userpwd"   type="password" id="repassword1" class="input-txt" validate="{required:true,messages:{required:'请输入新密码'}}" />
                      </td>
                  </tr>
                   <tr>
                      <td align="right" >确认密码 :</td>
                      <td align="left">
                        <input name="repassword2"  type="password" id="repassword2" class="input-txt" validate="{required:true,equalTo:'#repassword1',messages:{required:'请输入确定密码',equalTo:'两次密码不一致'}}" />
                      </td>
                  </tr>
                   <tr>
						        <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>修改密码</button>
									     </div>
						       </td>
				  </tr>
              </table>
          </form>
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
