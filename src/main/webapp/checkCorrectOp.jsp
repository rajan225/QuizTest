<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
        String id=request.getParameter("id");
   // String op=request.getParameter("cop");
    DbManager dm=new DbManager();
    ResultSet rs=dm.select("SELECT * FROM question where id="+id+"");
    while (rs.next()) { 
   JSONObject obj=new JSONObject();
   obj.put("cop", rs.getString("correct"));
   
   out.print(obj);
            
        }
%>