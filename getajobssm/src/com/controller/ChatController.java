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
import com.dao.ChatDAO;
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
public class ChatController extends BaseController {
	@Resource
	ChatDAO chatDAO;
	@Resource
	MemberDAO memberDAO;
	
	
	//留言添加
	@RequestMapping("chatAdd")
	public String chatAdd(HttpServletRequest request) {
		String content = request.getParameter("content");
		Member mmm = (Member)request.getSession().getAttribute("member");
		if(mmm!=null){
			Chat chat = new Chat();
			chat.setContent(content);
			chat.setMemberid(mmm.getId());
			chat.setSavetime(Info.getDateStr());
			chat.setHfcontent("");
			chatDAO.add(chat);
			return "redirect:chatMsg.do";
		}else{
			return "login";
		}
	}
	
	//后台留言列表
	@RequestMapping("admin/chatList")
	public String chatList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Chat> list = chatDAO.selectAll(map);
		for(Chat chat:list){
			Member member = (Member)memberDAO.findById(chat.getMemberid());
			chat.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/chatlist";
	}
	
	
	//前台留言列表
	@RequestMapping("chatMsg")
	public String chatMsg(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Chat> list = chatDAO.selectAll(map);
		for(Chat chat:list){
			Member member = (Member)memberDAO.findById(chat.getMemberid());
			chat.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "chatmsg";
	}
	
	
	//留言回复
	@RequestMapping("admin/chatHf")
	public String chatHf(Chat chat,HttpServletRequest request) {
		chatDAO.update(chat);
			return "redirect:chatList.do";
	}
	
	//删除留言
	@RequestMapping("admin/chatDel")
	public String chatDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		chatDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:chatList.do";
	}
	
}
