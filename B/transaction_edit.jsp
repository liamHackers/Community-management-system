<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
 
   String title=request.getParameter("title");
   String recorder=request.getParameter("recorder");
   String director=request.getParameter("director");
   String attendance=request.getParameter("attendance");
   String desc=request.getParameter("desc");
   String time=request.getParameter("time");
    String state=request.getParameter("state");
   String t_id=request.getParameter("t_id");
   
   if(title!=null&&recorder!=null&&director!=null&&attendance!=null&&desc!=null&&time!=null&&state!=null&&t_id!=null){
   
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   time = "'"+time+" 00:00:00'"; 
   String sql = "update st_transaction set t_title='"+title+
   "',t_recorder='"+recorder+"',t_director='"
   +director+"',t_attendance='"
   +attendance+"',t_desc='"
   +desc+"',t_time="
   +time+",t_state='"
   +state+"'where t_id='"
   +t_id+"'";
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