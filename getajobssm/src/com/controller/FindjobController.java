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

import com.bean.Findjob;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.dao.FindjobDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class FindjobController extends BaseController {
	@Resource
	FindjobDAO findjobDAO;
	@Resource
	MemberDAO memberDAO;
	
	
	
	//前台查询求职信息列表
	@RequestMapping("findjobMsg")
	public String findjobMsg(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Findjob> list = findjobDAO.selectAll(map);
		for(Findjob findjob:list){
			Member mmm =  memberDAO.findById(findjob.getMemberid());
			findjob.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "findjoblist";
	}
	

	//添加求职信息
	@RequestMapping("findjobAdd")
	public String findjobAdd(Findjob findjob, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		Member mmm = (Member)memberDAO.findById(member.getId());
		if(mmm.getTname()!=null){
		findjob.setMemberid(member.getId());
		findjob.setSavetime(Info.getDateStr());
		findjobDAO.add(findjob);
		return "redirect:myfindjobList.do";
		}else{
		request.setAttribute("member", mmm);
		return "grinfo";	
		}
	}

	//查找求职信息信息到编辑页面
	
	@RequestMapping("showFindjob")
	public String showFindjob(int id, HttpServletRequest request) {
		Findjob findjob = findjobDAO.findById(id);
		request.setAttribute("findjob", findjob);
		return "findjobedit";
	}
	
	//后台修改求职信息信息
	@RequestMapping("findjobEdit")
	public String findjobEdit(Findjob findjob, HttpServletRequest request) {
		findjobDAO.update(findjob);
		return "redirect:myfindjobList.do";
	}
	
	//删除求职信息信息
	@RequestMapping("admin/findjobAllDel")
	public String findjobAllDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		findjobDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:findjobList.do";
	}
	
	//查找求职信息到详情页面
	@RequestMapping("findjobDetails")
	public String findjobDetails(int id, HttpServletRequest request) {
		Findjob findjob = findjobDAO.findById(id);
		Member mmm = memberDAO.findById(findjob.getMemberid());
		findjob.setMember(mmm);
		request.setAttribute("findjob", findjob);
		return "findjobdetails";
	}
	
	//我发布的求职信息
	@RequestMapping("myfindjobList")
	public String myfindjobList(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		String key = request.getParameter("key");
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
	   	map.put("memberid", member.getId());
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Findjob> list = findjobDAO.myfindjoblist(map);
		for(Findjob findjob:list){
			Member mmm =  memberDAO.findById(findjob.getMemberid());
			findjob.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "myfindjoblist";
	}
	
	
	//前台删除求职信息
	@RequestMapping("findjobDel")
	public String findjobDel(int id,HttpServletRequest request) {
		findjobDAO.delete(id);
		return "redirect:myfindjobList.do";
	}
	
	//后台查询求职信息列表
	@RequestMapping("admin/findjobList")
	public String findjobList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Findjob> list = findjobDAO.selectAll(map);
		for(Findjob findjob:list){
			Member mmm =  memberDAO.findById(findjob.getMemberid());
			findjob.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/findjoblist";
	}
	
	//查找求职信息信息到编辑页面
	
	@RequestMapping("admin/lookFindjob")
	public String lookFindjob(int id, HttpServletRequest request) {
		Findjob findjob = findjobDAO.findById(id);
		Member mmm =  memberDAO.findById(findjob.getMemberid());
		findjob.setMember(mmm);
		request.setAttribute("findjob", findjob);
		return "admin/findjobdetails";
	}
	

}
