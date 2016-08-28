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
   String f_id=request.getParameter("f_id");
   
   if(type!=null&&money!=null&&date!=null&&associate!=null&&recorder!=null&&f_id!=null){
   
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   date = "'"+date+" 00:00:00'"; 
   String sql = "update st_financial set f_type='"+type+
   "',f_money='"+money+"',f_date="
   +date+",f_associate='"
   +associate+"',f_desc='"
   +desc+"',f_recorder='"
   +recorder+"'where f_id='"
   +f_id+"'";
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