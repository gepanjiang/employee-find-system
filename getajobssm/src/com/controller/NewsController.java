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

import com.bean.News;
import com.bean.Sysuser;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class NewsController extends BaseController {
	@Resource
	NewsDAO newsDAO;
	
	
	
	//后台查询公告列表
	@RequestMapping("admin/newsList")
	public String newsList(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<News> list = newsDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/newslist";
	}
	

	//添加公告
	@RequestMapping("admin/newsAdd")
	public String newsAdd(News news, HttpServletRequest request) {
		Sysuser sysuser = (Sysuser)request.getSession().getAttribute("admin");
		news.setSavetime(Info.getDateStr());
		newsDAO.add(news);
		return "redirect:newsList.do";
	}

	//查找公告信息到编辑页面
	
	@RequestMapping("admin/showNews")
	public String showNews(int id, HttpServletRequest request) {
		News news = newsDAO.findById(id);
		request.setAttribute("news", news);
		return "admin/newsedit";
	}
	
	//后台修改公告信息
	@RequestMapping("admin/newsEdit")
	public String newsEdit(News news, HttpServletRequest request) {
		newsDAO.update(news);
		return "redirect:newsList.do";
	}
	
	//删除公告信息
	@RequestMapping("admin/newsDel")
	public String newsDel(HttpServletRequest request) {
	    String idlist = request.getParameter("idlist");
	    String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		newsDAO.delete(Integer.parseInt(a[i]));
		}
		return "redirect:newsList.do";
	}
	
	
	//前台新闻列表
	@RequestMapping("newsMsg")
	public String newsMsg(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<News> list = newsDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "newsmsg";
	}
	
	//前台查找新闻到详情页面
	@RequestMapping("lookNews")
	public String lookNews(int id, HttpServletRequest request) {
		News news = newsDAO.findById(id);
		request.setAttribute("news", news);
		return "newsx";
	}
	
	
	
	

}
