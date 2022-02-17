<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>
<div class="accordion-group">
	<div
		style="height: 600px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
	      <h3>招聘管理</h3>  
		<div class="leftMenus">
		     <dd>
				<a   target="main"  target="main" href="/getajobssm/admin/findjobList.do">求职信息管理</a>
			 </dd>
			 <dd>
				<a   target="main"  target="main" href="/getajobssm/admin/workList.do">招聘信息管理</a>
			 </dd>
		</div>
	      <h3>人员管理</h3>  
		<div class="leftMenus">
			
			
			  <dd>
                  <a target="main"  href="/getajobssm/admin/memberList.do">用户管理</a>
              </dd>
             
			  <dd>
				<a target="main"  href="/getajobssm/admin/sysuserList.do">管理员管理</a>
			  </dd>
		</div>
		<h3>基础信息</h3>
		<div class="leftMenus">
			 <dd >
				<a target="main" href="/getajobssm/admin/noticeList.do">公告管理</a>
			</dd>
			
			<dd >
				<a target="main" href="/getajobssm/admin/newsList.do">新闻管理</a>
			</dd>
			
			<dd >
				<a target="main" href="/getajobssm/admin/chatList.do">留言管理</a>
			</dd>
			
			<dd >
				<a target="main" href="/getajobssm/admin/commentList.do">评论管理</a>
			</dd>
			
		</div>
		
		
		<h3>系统设置</h3>
		<div class="leftMenus">
		
		   
		    <dd>
				<a  href="/getajobssm/admin/modifypw.jsp"
					target="main">修改密码</a>
			</dd>
			
			
		</div>
		
		
	</div>
</div>
