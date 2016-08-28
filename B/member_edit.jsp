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
   String m_id=request.getParameter("m_id");
   
   if(m_id!=null&&name!=null&&sex!=null&&major!=null&&dorm!=null&&qq!=null&&email!=null&&phone!=null&&dept!=null&&post!=null&&money!=null&&state!=null&&addtime!=null&&leavetime!=null&&desc!=null){
   
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   addtime = "'"+addtime+" 00:00:00'"; 
    if(leavetime.equals("")){
  leavetime = "null";
  
  }else{
  leavetime = "'"+leavetime+" 00:00:00'";
  }
  
   String sql = "update st_member set m_name='"+name+
   "',m_sex='"+sex+"',m_major='"+major+"',m_dorm='"+dorm
   +"',m_qq='"+qq+"',m_email='"
   +email+"',m_phone='"
   +phone+"',m_dept='"
   +dept+"',m_post='"
   +post+"',m_money='"
   +money+"',m_addtime="
   +addtime+",m_state='"
   +state+"',m_leavetime="
   +leavetime+",m_desc='"
   +desc+"'where m_id='"
   +m_id+"'";
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