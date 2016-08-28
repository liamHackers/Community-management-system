<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<% 
   request.setCharacterEncoding("utf-8");
   
   String old_pass=request.getParameter("old_pass");
   String new_pass=request.getParameter("new_pass");

   
   if(old_pass!=null&&new_pass!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   
   String sql = "select * from st_admin";
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
   String _old_pass = rs.getString("admin_password");
   if(_old_pass.equals(old_pass)){
   String sql2="update st_admin set admin_password ='"+new_pass+"'";
   stmt.executeUpdate(sql2);
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/plain;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write("true");
   p.close();
   }else{ 
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/plain;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write("false");
   p.close();
     }   
   }
   rs.close();
   stmt.close();
   conn.close();
   }
   %>