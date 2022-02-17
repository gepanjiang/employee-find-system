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
    <meta content="Li Zhen Ya Team" name="author">
    <title>网络人才招聘系统</title>
    <link type="text/css" rel="stylesheet" href="theme/css/core.css">
    <link type="text/css" rel="stylesheet" href="theme/css/home.css">
    <script type="text/javascript" src="/getajobssm/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layer.js"></script>
    <script type="text/javascript" src="/getajobssm/layer/layui.css"></script>
    <script type="text/javascript">
        $(function(){
            $('.tabPanel ul li').click(function(){
                $(this).addClass('hit').siblings().removeClass('hit');
                $('.panes>div:eq('+$(this).index()+')').show().siblings().hide();
            })
        })
    </script>
    
    <style type="text/css">
    .lzy-tab .tab-sender select{
    width:230px; 
    height:30px; border:1px solid #d0d0d0;   padding:0 5px; line-height:30px; margin-bottom:3px; font-size:14px; color:#717171; box-shadow:3px 3px 5px #f3f3f3 inset;  -moz-box-shadow:3px 3px 5px #f3f3f3 inset;    -webkit-box-shadow:3px 3px 5px #f3f3f3 inset;
    }
    </style>

</head>

<body>
<% 
String wid = request.getParameter("wid");
%>
<jsp:include page="centertop.jsp"></jsp:include>
<section>
    <div class="lzy-content lzy-content-order">
        <div class="lzy-boxes lzy-boxes-order clearfix">
            <div class="tabPanel clearfix">
                <ul>
                    <li class="hit">投递简历</li>
                    
                </ul>
                <div class="panes">
                    <div class="pane" style="display:block;">
                        <div class="panes-tab">
                            <h3>请上传要递交的简历文件</h3>
                        </div>
                        <div class="lzy-tab">
                        <form action="baomingAdd.do" method="post" name="f1">
                        <input type="hidden" name="wid" value="<%=wid %>"/>
                            <table width="1089" border="0" cellspacing="0" cellpadding="0" class="tab-sender">
                                <tr>
                                    <td >
                                    <input name='filename' type='text' class="txt_input txt_input2" required     id='url'  size='50'  />&nbsp;
                           <input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/> 
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
        </div>
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
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>