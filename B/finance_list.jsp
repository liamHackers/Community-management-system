<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String st_id=request.getParameter("st_id");   
   if(st_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_financial where st_id = '"+st_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   String rtn="[";
   while(rs.next()){
    rtn += "{\"f_id\":\""+rs.getString("f_id")+"\",\"f_type\":\""
   +rs.getString("f_type")+"\",\"f_money\":\""
   +rs.getString("f_money")+"\",\"f_recorder\":\""
   +rs.getString("f_recorder")+"\"},";
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