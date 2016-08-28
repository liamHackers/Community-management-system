<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String password=request.getParameter("admin_password");
   String username=request.getParameter("admin_username");   
   if(password!=null&&username!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_admin where admin_username = '"+username+"' and admin_password = '"+password+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
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
   rs.close();
   stmt.close();
   conn.close();
  
   }
   %>