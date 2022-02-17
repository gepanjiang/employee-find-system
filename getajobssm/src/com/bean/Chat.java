//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.bean;

import java.util.*;

public class Chat {
	private int id;
	private String content;
	private String hfcontent;
	private String savetime;
	private int memberid;
	private Member member;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHfcontent() {
		return hfcontent;
	}
	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
