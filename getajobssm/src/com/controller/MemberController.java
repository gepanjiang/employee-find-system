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

import com.bean.Jianli;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.dao.JianliDAO;
import com.dao.MemberDAO;
import com.dao.NoticeDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class MemberController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	JianliDAO jianliDAO;
	
	
	
	//前后登录
	@RequestMapping("Login")
	public String Login(HttpServletRequest request) {
	        String uname =request.getParameter("uname");
	        String upass =request.getParameter("upass");
	        
	        HashMap map = new HashMap();
	        map.put("uname", uname);
	        map.put("upass", upass);
		    List<Member> list = memberDAO.selectOne(map);
		    if(list.size()==0){
		    	request.setAttribute("suc", "用户名或密码错误或未通过审核");
		    	return "login";
		    }else{
		    	Member member = memberDAO.findById(list.get(0).getId());
		    	request.getSession().setAttribute("member",member);
		    	return "redirect:index.do";
		    }

	}
	

	//注册
	@RequestMapping("Register")
	public String Register(Member member, HttpServletRequest request) {
		member.setDelstatus("0");
		member.setSavetime(Info.getDateStr());
		member.setShstatus("待审核");
		memberDAO.add(member);
		return "redirect:registersuc.jsp";
	}
	

	//修改个人信息
	@RequestMapping("update")
	public String update(Member member, HttpServletRequest request) {
		memberDAO.update(member);
		return "redirect:show.do?msg=msg";
	}
	
	

	//查找管理员用户到编辑页面
	@RequestMapping("showMember")
	public String showmember(int id, HttpServletRequest request) {
		Member member = memberDAO.findById(id);
		request.setAttribute("member", member);
		return "admin/grinfoedit";
	}
	
	
	
	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Member> list = memberDAO.checkUname(uname);
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
	
	//后台删除注册信息
	@RequestMapping("admin/memberDel")
	public String memberDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		memberDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:memberList.do";
	}
	
	//后台查询用户列表
	@RequestMapping("admin/memberList")
	public String memberList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Member> list = memberDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/memberlist";
	}
	
	//后台审核用户
	@RequestMapping("admin/updateShstatus")
	public String updateShstatus(Member member, HttpServletRequest request) {
		member.setShstatus("通过审核");
		memberDAO.update(member);
		return "redirect:memberList.do";
	}
	
	//前台退出
	@RequestMapping("memberExit")
	public String memberExit(HttpServletRequest request) {
		request.getSession().removeAttribute("member");
		return "redirect:index.do";
	}
	
	//个人中心
	@RequestMapping("memberCenter")
	public String memberCenter(HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("member");
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		if(member.getUtype().equals("求职者")){
			return "membercenter";
		}else{
			return "qymembercenter";
		}
	}
	
	//完善个人信息
	@RequestMapping("grInfo")
	public String grInfo(HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("member");
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		if(member.getUtype().equals("求职者")){
		return "grinfo";
		}else{
			return "qyinfo";
		}
	}
	
	//更新个人信息
	@RequestMapping("updateGrinfo")
	public String updateGrinfo(Member mmm, HttpServletRequest request) {
		memberDAO.update(mmm);
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		request.setAttribute("suc", "操作成功");
		return "grinfo";
	}
	
	//更新企业信息
	@RequestMapping("updateQyinfo")
	public String updateQyinfo(Member mmm, HttpServletRequest request) {
		memberDAO.update(mmm);
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		request.setAttribute("suc", "操作成功");
		return "qyinfo";
	}
	
	//修改密码
	@RequestMapping("updateUpass")
	public String updateUpass(HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("member");
		Member member = (Member)memberDAO.findById(mmm.getId());
		String oldupass = request.getParameter("oldupass");
		String newupass = request.getParameter("newupass");
		
		if(oldupass.equals(member.getUpass())){
			member.setUpass(newupass);
			memberDAO.update(member);
			request.setAttribute("suc", "操作成功");
		}else{
			request.setAttribute("suc", "原密码输入有误");
		}
		return "updateupass";
	}
	
	
	//检查是否完善个人信息
	@RequestMapping("Iswsinfo")
	public void Iswsinfo(HttpServletRequest request,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member mmm = (Member)request.getSession().getAttribute("member");
			Member member = (Member)memberDAO.findById(mmm.getId());
			if(member.getTname()!=null){
				ArrayList<Jianli> list = (ArrayList<Jianli>)jianliDAO.selectOne(member.getId());
				if(list.size()==0){
					out.print("1");
				}else{
					out.print("2");
				}
			}else{
				out.print("0");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//searchQzz招聘者检索求职者
	@RequestMapping("searchQzz")
	public String searchQzz(HttpServletRequest request) {
		String ziwei = request.getParameter("ziwei");
		String major = request.getParameter("major");
	   	
	   	
	   	String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("ziwei", ziwei);
	   	map.put("major", major);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Member> list = memberDAO.searchQzz(map);
		for(Member member:list){
			List<Jianli> jllist = (List<Jianli>)jianliDAO.selectOne(member.getId());
			if(jllist.size()==0){
				member.setFlag(0);
			}else{
				member.setFlag(1);
			}
		}
		request.setAttribute("list", list);
		request.setAttribute("ziwei", ziwei);
		request.setAttribute("major", major);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "searchqzz";
	}
	

}
