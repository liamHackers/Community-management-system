<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String st_id=request.getParameter("st_id");
   String name=request.getParameter("name");
   String city=request.getParameter("city");
   String school=request.getParameter("school");
   String lx_name=request.getParameter("lx_name");
   String lx_phone=request.getParameter("lx_phone");
   String lx_email=request.getParameter("lx_email");
   String lx_qq=request.getParameter("lx_qq");
   String desc=request.getParameter("desc");
   
   if(st_id!=null&&name!=null&&city!=null&&school!=null&&lx_name!=null&&lx_phone!=null&&lx_email!=null&&lx_qq!=null&&desc!=null){
   
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "update st_society set st_name='"+name+"',st_city='"+city+"',st_school='"+school+"',st_desc='"+desc+"',lx_name='"+lx_name+"',lx_phone='"+lx_phone+"',lx_email='"+lx_email+"',lx_qq='"+lx_qq+"' where st_id="+st_id;
   stmt.executeUpdate(sql);
   
   stmt.close();
   conn.close();
   
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/plain;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write("true");
   p.close();
   }
   %>