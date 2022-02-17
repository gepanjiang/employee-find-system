<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.bean.Sysuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

      Sysuser sysuser = (Sysuser)session.getAttribute("admin");
      if(sysuser==null){
          response.sendRedirect(path+"/admin/login.jsp");
          
      }

%>

