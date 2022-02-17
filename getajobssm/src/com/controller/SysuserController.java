//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.awt.geom.AreaOp.IntOp;

import com.bean.Sysuser;
import com.dao.NoticeDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class SysuserController extends BaseController {
	@Resource
	SysuserDAO sysuserDAO;
	
	
	//后台登录
	@RequestMapping("admin/login")
	public String login(HttpServletRequest request) {
	        String username =request.getParameter("username");
	        String userpwd =request.getParameter("userpwd");
	        String validcode =request.getParameter("validcode");
	        
	        if(validcode.equals(request.getSession().getAttribute("validcode"))){
	        HashMap map = new HashMap();
	        map.put("username", username);
	        map.put("userpwd", userpwd);
		    List<Sysuser> list = sysuserDAO.selectOne(map);
		    if(list.size()==0){
		    	request.setAttribute("error", "用户名或密码错误");
		    	return "admin/login";
		    }else{
		    	Sysuser admin = sysuserDAO.findById(list.get(0).getId());
		    	request.getSession().setAttribute("admin",admin);
		    	return "admin/index";
		    }
	        }else{
	        	request.setAttribute("no", "用户名或密码错误");
		    	return "admin/login";
	        }

	}
	
	
	//管理员管理
	@RequestMapping("admin/sysuserList")
	public String sysuserList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Sysuser> list = sysuserDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/sysuserlist";
	}
	

	//添加管理员
	@RequestMapping("admin/sysuserAdd")
	public String sysuserAdd(Sysuser sysuser, HttpServletRequest request) {
		sysuser.setDelstatus("0");
		sysuser.setSavetime(Info.getDateStr());
		sysuserDAO.add(sysuser);
		return "redirect:sysuserList.do";
	}
	

	@RequestMapping("admin/update")
	public String update(Sysuser sysuser, HttpServletRequest request) {
		sysuserDAO.update(sysuser);
		return "redirect:show.do?msg=msg";
	}
	
	
	@RequestMapping("admin/updatepwd")
	public String updatepwd(int id,String sysuserpassword, HttpServletRequest request) {
		String oldpassword = request.getParameter("oldpassword");
		Sysuser sysuser = sysuserDAO.findById(id);
		if(oldpassword.equals(sysuser.getUserpwd())){
			sysuserDAO.updatepwd(id,sysuserpassword);
			request.setAttribute("suc", "操作成功");
		}else{
			request.setAttribute("error", "原密码错误");
		}
		return "admin/updatepwd";
	}

	//查找管理员用户到编辑页面
	
	@RequestMapping("admin/showSysuser")
	public String showSysuser(int id, HttpServletRequest request) {
		Sysuser sysuser = sysuserDAO.findById(id);
		request.setAttribute("sysuser", sysuser);
		return "admin/sysuseredit";
	}
	
	//后台修改管理员信息
	@RequestMapping("admin/sysuserEdit")
	public String sysuserEdit(Sysuser sysuser, HttpServletRequest request) {
		sysuserDAO.update(sysuser);
		return "redirect:sysuserList.do";
	}
	
	
	//检查用户名的唯一性
	@RequestMapping("admin/checkUsername")
	public void checksysusername(String username, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Sysuser> list = sysuserDAO.checkUsername(username);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//后台删除管理员信息
	@RequestMapping("admin/sysuserDel")
	public String sysuserDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		sysuserDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:sysuserList.do";
	}
	
	
	//修改密码
	@RequestMapping("admin/passEdit")
	public String passEdit(HttpServletRequest request) {
		String password1 = request.getParameter("password1");
		String userpwd = request.getParameter("userpwd");
		Sysuser admin = (Sysuser)request.getSession().getAttribute("admin");
		Sysuser sysuser = (Sysuser)sysuserDAO.findById(admin.getId());
		if(sysuser.getUserpwd().equals(password1)){
		       sysuser.setUserpwd(userpwd);
		       sysuserDAO.update(sysuser);
		       request.setAttribute("suc", "修改成功");
		}else{
			request.setAttribute("suc", "原密码错误");
		}
		return "admin/modifypw";
	}

}
