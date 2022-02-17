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

import com.bean.Baoming;
import com.bean.Comment;
import com.bean.Findjob;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Work;
import com.dao.BaomingDAO;
import com.dao.CommentDAO;
import com.dao.FindjobDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.dao.WorkDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class WorkController extends BaseController {
	@Resource
	WorkDAO workDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	BaomingDAO baomingDAO;
	@Resource
	CommentDAO commentDAO;
	
	
	
	
	
	//前台查询招聘信息列表
	@RequestMapping("workMsg")
	public String workMsg(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		String index = request.getParameter("index");
		String key = request.getParameter("key");
		String memberid = request.getParameter("memberid");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
	   	map.put("memberid",memberid);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Work> list = workDAO.selectAll(map);
		for(Work work:list){
			Member mmm =  memberDAO.findById(work.getMemberid());
			work.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("memberid", memberid);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "workmsg";
	}
	

	//添加招聘信息
	@RequestMapping("workAdd")
	public String workAdd(Work work, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		work.setMemberid(member.getId());
		work.setDelstatus("0");
		work.setSavetime(Info.getDateStr());
		work.setVote(0);
		workDAO.add(work);
		return "redirect:workMsg.do?memberid="+member.getId();
	}

	//查找招聘信息信息到编辑页面
	
	@RequestMapping("showWork")
	public String showWork(int id, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		String type = request.getParameter("type")==null?"":request.getParameter("type");
		String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
		Work work = workDAO.findById(id);
		Member mmm = (Member)memberDAO.findById(work.getMemberid());
		work.setMember(mmm);
		request.setAttribute("work", work);
		if(type.equals("details")){
		HashMap map = new HashMap();
		map.put("wid", id);
		if(member!=null){
		map.put("mid",member.getId());
		}
		//查看用户是否提交过简历
		ArrayList<Baoming> list = (ArrayList<Baoming>)baomingDAO.selectOne(map);
		request.setAttribute("list", list);
		//评论列表
		ArrayList<Comment> ctlist = (ArrayList<Comment>)commentDAO.selectComment(id);
		for(Comment comment:ctlist){
			Member mem = memberDAO.findById(comment.getMemberid());
			comment.setMember(mem);
		}
		request.setAttribute("ctlist", ctlist);
		request.setAttribute("list", list);
		
		if(msg.equals("msg")){
			request.setAttribute("suc", "只能评论一次");
		}
			return "workx";
		}else{
			return "workedit";
		}
	}
	
	//后台修改招聘信息信息
	@RequestMapping("workEdit")
	public String workEdit(Work work, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		workDAO.update(work);
		return "redirect:workMsg.do?memberid="+member.getId();
	}
	
	
	//查找招聘信息到详情页面
	@RequestMapping("workDetails")
	public String workDetails(int id, HttpServletRequest request) {
		Work work = workDAO.findById(id);
		Member mmm = memberDAO.findById(work.getMemberid());
		work.setMember(mmm);
		request.setAttribute("work", work);
		return "workdetails";
	}
	
	
	
	//前台删除招聘信息
	@RequestMapping("workDel")
	public String workDel(int id,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		workDAO.delete(id);
		return "redirect:workMsg.do?memberid="+member.getId();
	}
	
	//后台查询招聘信息列表
	@RequestMapping("admin/workList")
	public String workList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Work> list = workDAO.selectAll(map);
		for(Work work:list){
			Member mmm =  memberDAO.findById(work.getMemberid());
			work.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/worklist";
	}
	
	//查找招聘信息信息到详情页面
	
	@RequestMapping("admin/lookWork")
	public String lookWork(int id, HttpServletRequest request) {
		Work work = workDAO.findById(id);
		Member mmm =  memberDAO.findById(work.getMemberid());
		work.setMember(mmm);
		request.setAttribute("work", work);
		return "admin/workdetails";
	}
	
	//查找招聘信息信息到编辑页面
	
	@RequestMapping("admin/showWorkMsg")
	public String showWorkMsg(int id, HttpServletRequest request) {
		Work work = workDAO.findById(id);
		request.setAttribute("work", work);
		return "admin/workedit";
	}
	
	
	//后台修改招聘信息
	@RequestMapping("admin/workUpdate")
	public String workUpdate(Work work, HttpServletRequest request) {
		workDAO.update(work);
		return "redirect:workList.do";
	}
	
	//后台多选删除
	@RequestMapping("admin/workAllDel")
	public String workAllDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		workDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:workList.do";
	}
	
	
	//前台查询招聘信息列表
	@RequestMapping("workListMsg")
	public String workListMsg(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		String index = request.getParameter("index");
		String key = request.getParameter("key");
		String memberid = request.getParameter("memberid");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
	   	map.put("memberid",memberid);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Work> list = workDAO.selectAll(map);
		for(Work work:list){
			Member mmm =  memberDAO.findById(work.getMemberid());
			work.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("memberid", memberid);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "worklistmsg";
	}
	
	

}
