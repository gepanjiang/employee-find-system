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
import com.bean.Jianli;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.dao.FindjobDAO;
import com.dao.JianliDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class JianliController extends BaseController {
	@Resource
	JianliDAO jianliDAO;
	@Resource
	MemberDAO memberDAO;
	
	
	@RequestMapping("myJianli")
	public String myJianli(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		Member mmm = (Member)memberDAO.findById(member.getId());
		HashMap map = new HashMap();
		map.put("memberid", member.getId());
		if(mmm.getTname()!=null){
		ArrayList<Jianli> list = (ArrayList<Jianli>)jianliDAO.selectAll(map);
		if(list.size()==0){
			request.setAttribute("member", mmm);
			request.setAttribute("flag", "no");
			return "jianliadd";
		}else{
			Jianli jianli = list.get(0);
			jianli.setMember(mmm);
			request.setAttribute("jianli", jianli);
			request.setAttribute("flag", "suc");
			return "jianlimsg";
		}
		}else{
			request.setAttribute("member", mmm);
			return "grinfo";
		}
	}
	
	
	//求职者填写简历
	@RequestMapping("jianliAdd")
	public String jianliAdd(Jianli jianli,HttpServletRequest request) {
		jianli.setDelstatus("0");
		jianliDAO.add(jianli);
		return "redirect:myJianli.do";
	}
	
	//查找简历信息到编辑页面
	@RequestMapping("showJianlitoEdit")
	public String showJianlitoEdit(int id,HttpServletRequest request) {
		Jianli jianli = jianliDAO.findById(id);
		Member member = memberDAO.findById(jianli.getMemberid());
		jianli.setMember(member);
		request.setAttribute("jianli", jianli);
		return "jianliedit";
	}
	
	//编辑简历
	@RequestMapping("jianliEdit")
	public String jianliEdit(Jianli jianli,HttpServletRequest request) {
		jianliDAO.update(jianli);
		return "redirect:myJianli.do";
	}
	
	//招聘用户查看递交过来的简历
	@RequestMapping("shJianli")
	public String shJianli(int memberid,HttpServletRequest request) {
		ArrayList<Jianli> list = (ArrayList<Jianli>)jianliDAO.selectOne(memberid);
		Jianli jianli = list.get(0);
		Member member = (Member)memberDAO.findById(jianli.getMemberid());
		jianli.setMember(member);
		request.setAttribute("jianli", jianli);
		return "shjianli";
	}
	

}
