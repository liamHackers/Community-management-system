<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.sql.*" %>
<%@page import="java.io.PrintWriter"%>
<% 
   request.setCharacterEncoding("utf-8");
   
   String pass=request.getParameter("pass");
   String name=request.getParameter("name");
   String city=request.getParameter("city");
   String school=request.getParameter("school");
   String lx_name=request.getParameter("lx_name");
   String lx_phone=request.getParameter("lx_phone");
   String lx_email=request.getParameter("lx_email");
   String lx_qq=request.getParameter("lx_qq");
   String desc=request.getParameter("desc");
   String addtime ;
   
   if(pass!=null&&name!=null&&city!=null&&school!=null&&lx_name!=null&&lx_phone!=null&&lx_email!=null&&lx_qq!=null&&desc!=null){
   SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
   addtime = sdf.format(new Date());
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "insert into st_society values (null,'"+pass+"','"+name+"','"+city+"','"+school+"','"+addtime+"','"+desc+"','"+lx_name+"','"+lx_phone+"','"+lx_email+"','"+lx_qq+"')";
   stmt.executeUpdate(sql);
   
   int st_id=0;
   String sql2 = "select * from st_society where st_password='"+pass+"' and st_name='"+name+"' and st_city='"+city+"' and st_school='"+school+"' and st_addtime='"+addtime+"' and st_desc='"+desc+"' and lx_name='"+lx_name+"' and lx_phone='"+lx_phone+"' and lx_email='"+lx_email+"' and lx_qq='"+lx_qq+"'";
   ResultSet rs =stmt.executeQuery(sql2);
   if(rs.next()){
   st_id = rs.getInt("st_id");
   }   
   rs.close();
   stmt.close();
   conn.close();
   
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/plain;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write(String.valueOf(st_id));
   p.close();
   }
   %>