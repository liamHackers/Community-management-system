<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String t_id=request.getParameter("t_id");   
   if(t_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_transaction where t_id = '"+t_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
   String rtn = "{\"t_id\":\""+rs.getString("t_id")+"\",\"title\":\""
   +rs.getString("t_title")+"\",\"recorder\":\""
   +rs.getString("t_recorder")+"\",\"director\":\""
   +rs.getString("t_director")+"\",\"attendance\":\""
   +rs.getString("t_attendance")+"\",\"desc\":\""
   +rs.getString("t_desc")+"\",\"time\":\""
   +rs.getString("t_time")+"\",\"state\":\""
   +rs.getString("t_state")+"\"}";
   
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