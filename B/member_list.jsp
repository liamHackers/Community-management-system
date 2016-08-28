<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String st_id=request.getParameter("st_id");   
   if(st_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_member where st_id = '"+st_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   String rtn="[";
   while(rs.next()){
    rtn += "{\"m_id\":\""+rs.getString("m_id")+"\",\"name\":\""
   +rs.getString("m_name")+"\",\"dept\":\""
   +rs.getString("m_dept")+"\",\"phone\":\""
   +rs.getString("m_phone")+"\"},";
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