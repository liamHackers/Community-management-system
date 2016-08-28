<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String st_id=request.getParameter("st_id");   
   if(st_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_society where st_id = '"+st_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
   String rtn = "{\"st_id\":\""+rs.getInt("st_id")+"\",\"name\":\""
   +rs.getString("st_name")+"\",\"city\":\""
   +rs.getString("st_city")+"\",\"school\":\""
   +rs.getString("st_school")+"\",\"lx_name\":\""
   +rs.getString("lx_name")+"\",\"lx_phone\":\""
   +rs.getString("lx_phone")+"\",\"lx_email\":\""
   +rs.getString("lx_email")+"\",\"lx_qq\":\""
   +rs.getString("lx_qq")+"\",\"addtime\":\""
   +rs.getString("st_addtime")+"\",\"desc\":\""
   +rs.getString("st_desc")+"\"}";
   
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