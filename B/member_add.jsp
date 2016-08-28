<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   
   String name=request.getParameter("name");
   String sex=request.getParameter("sex");
   String major=request.getParameter("major");
   String dorm=request.getParameter("dorm");
   String qq=request.getParameter("qq");
   String email=request.getParameter("email");
   String phone=request.getParameter("phone");
   String dept=request.getParameter("dept");
   String post=request.getParameter("post");
   String money=request.getParameter("money");
   String state=request.getParameter("state");
   String addtime=request.getParameter("addtime");
   String leavetime=request.getParameter("leavetime");
   String desc=request.getParameter("desc");
   String st_id=request.getParameter("st_id");

   
   if(name!=null&&sex!=null&&major!=null&&dorm!=null&&qq!=null&&email!=null&&
   dept!=null&&post!=null&&money!=null&&state!=null&&addtime!=null&&leavetime!=null&&desc!=null&&st_id!=null){
   
  String m_id = java.util.UUID.randomUUID().toString(); 
  Class.forName("com.mysql.jdbc.Driver"); 
  Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
  Statement stmt=conn.createStatement();
  addtime = "'"+addtime+" 00:00:00'";
  if(leavetime.equals("")){
  leavetime = "null";
  
  }else{
  leavetime = "'"+leavetime+" 00:00:00'";
  }
   
   
   String sql = "insert into st_member values ('"+m_id+"','"
   +name+"','"
   +sex+"','"
   +major+"','"
   +dorm+"','"
   +qq+"','"
   +email+"','"
   +phone+"','"
   +dept+"','"
   +post+"','"
   +money+"',"
   +addtime+",'"
   +state+"',"
   +leavetime+",'"
   +desc+"','"
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