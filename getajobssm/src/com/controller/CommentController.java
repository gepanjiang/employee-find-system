//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.persistence.Temporal;
import javax.servlet.ServletException;
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
import com.bean.Chat;
import com.bean.Comment;
import com.bean.Findjob;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Work;
import com.dao.BaomingDAO;
import com.dao.CommentDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.dao.WorkDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class CommentController extends BaseController {
	@Resource
	CommentDAO commentDAO;
	@Resource
	WorkDAO workDAO;
	@Resource
	MemberDAO memberDAO;
	
	
	@RequestMapping("commentAdd")
	public String commentAdd(Comment comment, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member!=null){
			HashMap map = new HashMap();
			map.put("workid", comment.getWorkid());
			map.put("memberid", member.getId());
			ArrayList<Comment> list = (ArrayList<Comment>)commentDAO.selectOne(map);
			if(list.size()==0){
				Work work = workDAO.findById(comment.getWorkid());
				comment.setMemberid(member.getId());
				comment.setSavetime(Info.getDateStr());
				comment.setQyid(work.getMemberid());
				commentDAO.add(comment);
				return "redirect:showWork.do?type=details&id="+comment.getWorkid();	
			}else{
				request.setAttribute("suc", "已评论过了");
				return "redirect:showWork.do?type=details&msg=msg&id="+comment.getWorkid();	
			}
		}else{
			return "login";
		}
	}
	
	
	//后台评论列表
	@RequestMapping("admin/commentList")
	public String commentList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Comment> list = commentDAO.selectAll(map);
		for(Comment comment:list){
			Member member = (Member)memberDAO.findById(comment.getMemberid());
			comment.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/commentlist";
	}
	
	//评论删除
	@RequestMapping("admin/commentDel")
	public String chatDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		commentDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:commentList.do";
	}
	
	
	
}
