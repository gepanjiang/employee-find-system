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
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Work;
import com.dao.BaomingDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.dao.WorkDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class BaomingController extends BaseController {
	@Resource
	BaomingDAO baomingDAO;
	@Resource
	WorkDAO workDAO;
	@Resource
	MemberDAO memberDAO;
	
	
	
	
	//前台报名列表
	@RequestMapping("baomingMsg")
	public String baomingMsg(String key, HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("member");
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	HashMap map = new HashMap();
	   	map.put("key", key);
	   	map.put("qyid", mmm.getId());
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Baoming> list = baomingDAO.selectAll(map);
		for(Baoming baoming:list){
			Member member = (Member)memberDAO.findById(baoming.getMid());
			Work work = (Work)workDAO.findById(baoming.getWid());
			baoming.setMember(member);
			baoming.setWork(work);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "baomingmsg";
	}
	
	//提交简历
	@RequestMapping("baomingAdd")
	public void baomingAdd(Baoming baoming, HttpServletRequest request, HttpServletResponse response) {
		Member member = (Member)request.getSession().getAttribute("member");
		HashMap map = new HashMap();
		map.put("wid", baoming.getWid());
		map.put("mid",member.getId());
		ArrayList<Baoming> list = (ArrayList<Baoming>)baomingDAO.selectOne(map);
		
		try {
			if(list.size()==0){
			Work work = (Work)workDAO.findById(baoming.getWid());
			baoming.setMid(member.getId());
			baoming.setQyid(work.getMemberid());
			baoming.setSavetime(Info.getDateStr());
			baomingDAO.add(baoming);
			request.setAttribute("suc", "提交简历成功");
			}else{
			request.setAttribute("suc", "已提交过简历了!");	
			}
			request.getRequestDispatcher("uploadjianli.jsp?wid="+baoming.getWid()).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//删除提交的简历
	@RequestMapping("baomingDel")
	public String baomingDel(int id, HttpServletRequest request) {
		baomingDAO.delete(id);
		return "redirect:baomingMsg.do";
	}
}
