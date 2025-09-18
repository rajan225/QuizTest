<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
    
String id=request.getParameter("id");
DbManager dm=new DbManager();
JSONObject obj=new JSONObject();
ResultSet rs=dm.select("SELECT * FROM question where id='"+id+"'");
while(rs.next())
{
obj.put("id",rs.getString("id"));
obj.put("question", rs.getString("question"));
   obj.put("op1",rs.getString("op1"));
   obj.put("op2",rs.getString("op2"));
   obj.put("op3",rs.getString("op3"));
   obj.put("op4",rs.getString("op4"));
obj.put("cop", rs.getString("correct"));
};
out.print(obj);
%>
