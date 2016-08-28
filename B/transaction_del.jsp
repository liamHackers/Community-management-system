<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   
   String t_id=request.getParameter("t_id");

   
   if(t_id!=null){   
  
  Class.forName("com.mysql.jdbc.Driver"); 
  Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
  Statement stmt=conn.createStatement();   
   
   String sql = "delete from st_transaction where t_id='"+t_id+"'";
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