//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.bean;

import java.util.*;

public class Comment {
	private int id;
	private int memberid;
	private String content;
	private String savetime;
	private String hfcontent;
	private int qyid;
	private int workid;
	private Member member;
	private Work work;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getHfcontent() {
		return hfcontent;
	}
	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}
	public int getQyid() {
		return qyid;
	}
	public void setQyid(int qyid) {
		this.qyid = qyid;
	}
	public int getWorkid() {
		return workid;
	}
	public void setWorkid(int workid) {
		this.workid = workid;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Work getWork() {
		return work;
	}
	public void setWork(Work work) {
		this.work = work;
	}
	
	
	
}
