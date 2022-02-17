<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
                <h2>完善个人信息</h2>
            </div>
<form action="updateGrinfo.do" method="post" name="f1">
<input type="hidden" name="id" value="${member.id}"/>
            <div class="login_m">
                <div class="login_boder">
                    <div class="login_padding">
                        <h2><img src="<%=path %>/upload/${member.filename}" style="width: 60px;height: 60px; border-radius:30px 30px;"/></h2>
                        <h2>头像</h2>
                        <label>
                           <input name='filename' type='text' class="txt_input txt_input2"  value="${member.filename}"   id='url'  size='50' value='' />&nbsp;
                           <input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/> 
                        </label>
                        <h2>姓名</h2>
                        <label>
                            <input type="text" name="tname" id="tname" value="${member.tname}" class="txt_input" placeholder="" required oninvalid="setCustomValidity('姓名不能为空')" oninput="setCustomValidity('');">
                        </label>
                        
                        <h2>年龄</h2>
                        <label>
                            <input type="number" name="age" id="age" class="txt_input" value="${member.age}" required oninvalid="setCustomValidity('年龄不能为空')" oninput="setCustomValidity('');" >
                        </label>
                        
                        <h2>电话</h2>
                        <label>
                            <input type="text" name="tel" id="tel" class="txt_input" value="${member.tel}" required oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');" pattern="[1][3,4,5,7,8][0-9]{9}">
                        </label>
                        
                        <h2>地址</h2>
                        <label>
                            <input type="text" name="addr" id="addr" class="txt_input" value="${member.addr}" required oninvalid="setCustomValidity('地址不能为空')" oninput="setCustomValidity('');" >
                        </label>
                        
                        <h2>专业</h2>
                        <label>
                            <input type="text" name="major" id="major" class="txt_input" value="${member.major}" required oninvalid="setCustomValidity('专业不能为空')" oninput="setCustomValidity('');" >
                        </label>
                        
                        <h2>求职意向</h2>
                        <label>
                            <input type="text" name="ziwei" id="ziwei" class="txt_input" value="${member.ziwei}" required oninvalid="setCustomValidity('地址不能为空')" oninput="setCustomValidity('');" >
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