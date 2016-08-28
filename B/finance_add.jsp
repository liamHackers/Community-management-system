<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   
   String type=request.getParameter("type");
   String money=request.getParameter("money");
   String date=request.getParameter("date");
   String associate=request.getParameter("associate");
   String desc=request.getParameter("desc");
   String recorder=request.getParameter("recorder");
   String st_id=request.getParameter("st_id");

   
   if(type!=null&&money!=null&&date!=null&&associate!=null&&recorder!=null&&st_id!=null){
   
  String f_id = java.util.UUID.randomUUID().toString(); 
  Class.forName("com.mysql.jdbc.Driver"); 
  Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
  Statement stmt=conn.createStatement();
  date = "'"+date+" 00:00:00'";
   
   
   String sql = "insert into st_financial values ('"+f_id+"','"
   +type+"','"
   +money+"',"
   +date+",'"
   +associate+"','"
   +desc+"','"
   +recorder+"','"
   +st_id+"')";
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