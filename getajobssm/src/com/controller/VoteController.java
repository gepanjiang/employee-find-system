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
import com.bean.Findjob;
import com.bean.Jianli;
import com.bean.Member;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Vote;
import com.bean.Work;
import com.dao.BaomingDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.SysuserDAO;
import com.dao.VoteDAO;
import com.dao.WorkDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class VoteController extends BaseController {
	@Resource
	VoteDAO voteDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	WorkDAO workDAO;
	
	
	
	@RequestMapping("voteAdd")
	public void voteAdd(HttpServletRequest request,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member mmm = (Member)request.getSession().getAttribute("member");
			String workid = request.getParameter("workid");
			HashMap map = new HashMap();
			map.put("memberid", mmm.getId());
			map.put("workid", workid);
			ArrayList<Vote> list = (ArrayList<Vote>)voteDAO.selectOne(map);
			if(list.size()==0){
				Vote vote = new Vote();
				vote.setMemberid(mmm.getId());
				vote.setWorkid(Integer.parseInt(workid));
				voteDAO.add(vote);
				Work work = workDAO.findById(Integer.parseInt(workid));
				work.setVote(work.getVote()+1);
				workDAO.update(work);
				out.print("0");
			}else{
				out.print("1");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
