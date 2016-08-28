<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
     
   
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_society";
 
   ResultSet rs =stmt.executeQuery(sql);
   String rtn="[";
   while(rs.next()){
    rtn += "{\"st_id\":\""+rs.getString("st_id")+"\",\"st_name\":\""
   +rs.getString("st_name")+"\",\"st_city\":\""
   +rs.getString("st_city")+"\",\"st_school\":\""
   +rs.getString("st_school")+"\",\"st_addtime\":\""
   +rs.getString("st_addtime")+"\",\"st_desc\":\""
   +rs.getString("st_desc")+"\",\"lx_name\":\""
   +rs.getString("lx_name")+"\",\"lx_phone\":\""
   +rs.getString("lx_phone")+"\",\"lx_email\":\""
   +rs.getString("lx_email")+"\",\"lx_qq\":\""
   +rs.getString("lx_qq")+"\",\"st_password\":\""
   +rs.getString("st_password")+"\"},";
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
   
 
   %>