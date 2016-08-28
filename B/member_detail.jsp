<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("utf-8");
   
   String m_id=request.getParameter("m_id");   
   if(m_id!=null){
   
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/st","root","root" ); 
   Statement stmt=conn.createStatement();
   String sql = "select * from st_member where m_id = '"+m_id+"'";
 
   ResultSet rs =stmt.executeQuery(sql);
   if(rs.next()){
   String rtn = "{\"m_id\":\""+rs.getString("m_id")+"\",\"name\":\""
   +rs.getString("m_name")+"\",\"sex\":\""
   +rs.getString("m_sex")+"\",\"major\":\""
   +rs.getString("m_major")+"\",\"dorm\":\""
   +rs.getString("m_dorm")+"\",\"qq\":\""
   +rs.getString("m_qq")+"\",\"email\":\""
   +rs.getString("m_email")+"\",\"phone\":\""
   +rs.getString("m_phone")+"\",\"dept\":\""
   +rs.getString("m_dept")+"\",\"post\":\""
   +rs.getString("m_post")+"\",\"money\":\""
   +rs.getString("m_money")+"\",\"addtime\":\""
   +rs.getString("m_addtime")+"\",\"state\":\""
   +rs.getString("m_state")+"\",\"leavetime\":\""
   +rs.getString("m_leavetime")+"\"}";
   
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