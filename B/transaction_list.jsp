<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String st_id=request.getParameter("st_id");   
   if(st_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_transaction where st_id = '"+st_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   String rtn="[";
   while(rs.next()){
    rtn += "{\"t_id\":\""+rs.getString("t_id")+"\",\"t_title\":\""
   +rs.getString("t_title")+"\",\"t_recorder\":\""
   +rs.getString("t_recorder")+"\",\"t_director\":\""
   +rs.getString("t_director")+"\",\"t_attendance\":\""
   +rs.getString("t_attendance")+"\",\"t_desc\":\""
   +rs.getString("t_desc")+"\",\"t_time\":\""
   +rs.getString("t_time")+"\",\"t_state\":\""
   +rs.getString("t_state")+"\"},";
   }
   rtn += "]";
   rtn = rtn.replaceAll(",]","]");
   
    rs.close();
   stmt.close();
   conn.close();
   
   response.setCharacterEncoding("utf-8");
   response.setContentType("application/json;charset=utf-8");
   java.io.PrintWriter p = response.getWriter();
   p.write(rtn);
   p.close();
   }
 
   %>