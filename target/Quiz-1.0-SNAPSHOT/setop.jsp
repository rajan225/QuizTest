<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
   String i=request.getParameter("quno");
   DbManager dm=new DbManager();
   
   ResultSet rs=dm.select("SELECT * FROM question where id='"+i+"'");
   if(rs.next()) {
   
   JSONObject obj=new JSONObject();
   obj.put("question", rs.getString("question"));
   obj.put("op1",rs.getString("op1"));
   obj.put("op2",rs.getString("op2"));
   obj.put("op3",rs.getString("op3"));
   obj.put("op4",rs.getString("op4"));
   out.print(obj);

   }
   else
   {
   JSONObject obj=new JSONObject();
   obj.put("op1", "empty");
   
   out.print(obj);
   }
       
   %>
   