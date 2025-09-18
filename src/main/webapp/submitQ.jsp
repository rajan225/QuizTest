<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
if(request.getParameter("page").equals("sub"))
   {
    String id=request.getParameter("id");
    String question=request.getParameter("qu");
    String op1=request.getParameter("op1");
    String op2=request.getParameter("op2");
    String op3=request.getParameter("op3");
    String op4=request.getParameter("op4");
    String cop=request.getParameter("cop");
    DbManager dm=new DbManager();
    ResultSet rs=dm.select("SELECT * FROM question where id='"+id+"'");
    JSONObject obj=new JSONObject();
    if(rs.next())
    {
   
   obj.put("id",rs.getString("id"));
   
   out.print(obj);
}
else
{
String query="INSERT INTO question(id, question, op1, op2, op3, op4, correct, date) VALUES ('"+id+"','"+question+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+cop+"',now())";
    if(dm.insertUpdateDelete(query))
{
obj.put("id","Your Question saved");
   out.print(obj);
}
else
{
obj.put("id","Something went wrong please try agan..");
   
   out.print(obj);

};
 
}
}
else if(request.getParameter("page").equals("update"))
{
    String id=request.getParameter("id");
    String question=request.getParameter("qu");
    String op1=request.getParameter("op1");
    String op2=request.getParameter("op2");
    String op3=request.getParameter("op3");
    String op4=request.getParameter("op4");
    String cop=request.getParameter("cop");
    DbManager dm=new DbManager();
   String query="UPDATE question SET id='"+id+"',question='"+question+"',op1='"+op1+"',op2='"+op2+"',op3='"+op3+"',op4='"+op4+"',correct='"+cop+"',date=now() where id='"+id+"' ";
    if(dm.insertUpdateDelete(query))
    {
  out.print("Your Question updatted");
    }
    else
    {
     out.print("Something went wrong please try agan");
   }
}
%>