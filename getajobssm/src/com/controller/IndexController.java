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

import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Work;
import com.dao.MemberDAO;
import com.dao.NoticeDAO;
import com.dao.SysuserDAO;
import com.dao.WorkDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class IndexController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	WorkDAO workDAO;
	
	
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		
		//首页招聘信息
		String index = request.getParameter("index");
		String key = request.getParameter("key");
		String ziwei = request.getParameter("ziwei");
		String salary = request.getParameter("salary");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
		map.put("ziwei", ziwei);
	   	map.put("salary", salary);
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Work> list = workDAO.selectAll(map);
		for(Work work:list){
			Member mmm =  memberDAO.findById(work.getMemberid());
			work.setMember(mmm);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("ziwei", ziwei);
		request.setAttribute("salary", salary);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		 return "index";
	}
	

}
