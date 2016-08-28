<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String f_id=request.getParameter("f_id");   
   if(f_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_financial where f_id = '"+f_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
   String rtn = "{\"f_id\":\""+rs.getString("f_id")+"\",\"type\":\""
   +rs.getString("f_type")+"\",\"money\":\""
   +rs.getString("f_money")+"\",\"date\":\""
   +rs.getString("f_date")+"\",\"associate\":\""
   +rs.getString("f_associate")+"\",\"desc\":\""
   +rs.getString("f_desc")+"\",\"recorder\":\""
   +rs.getString("f_recorder")+"\"}";
   
   response.setCharacterEncoding("utf-8");
   response.setContentType("application/json;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write(rtn);
   p.close();
   }
   rs.close();
   stmt.close();
   conn.close();
  
   }
   %>