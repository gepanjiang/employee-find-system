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

import com.bean.Notice;
import com.bean.Sysuser;
import com.dao.NoticeDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class NoticeController extends BaseController {
	@Resource
	NoticeDAO noticeDAO;
	
	
	
	//后台查询公告列表
	@RequestMapping("admin/noticeList")
	public String noticeList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Notice> list = noticeDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/noticelist";
	}
	

	//添加公告
	@RequestMapping("admin/noticeAdd")
	public String noticeAdd(Notice notice, HttpServletRequest request) {
		Sysuser sysuser = (Sysuser)request.getSession().getAttribute("admin");
		notice.setAuthor(sysuser.getRealname());
		notice.setSavetime(Info.getDateStr());
		noticeDAO.add(notice);
		return "redirect:noticeList.do";
	}

	//查找公告信息到编辑页面
	
	@RequestMapping("admin/showNotice")
	public String showNotice(int id, HttpServletRequest request) {
		Notice notice = noticeDAO.findById(id);
		request.setAttribute("notice", notice);
		return "admin/noticeedit";
	}
	
	//后台修改公告信息
	@RequestMapping("admin/noticeEdit")
	public String noticeEdit(Notice notice, HttpServletRequest request) {
		noticeDAO.update(notice);
		return "redirect:noticeList.do";
	}
	
	//删除公告信息
	@RequestMapping("admin/noticeDel")
	public String noticeDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		noticeDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:noticeList.do";
	}
	
	//前台公告列表
	@RequestMapping("noticeMsg")
	public String noticeMsg(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Notice> list = noticeDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "noticemsg";
	}
	
	@RequestMapping("lookNotice")
	public String lookNotice(int id, HttpServletRequest request) {
		Notice notice = noticeDAO.findById(id);
		request.setAttribute("notice", notice);
		return "noticex";
	}
	
	
	

}
