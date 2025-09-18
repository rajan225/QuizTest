<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
String correct=request.getParameter("correct");
String wrong=request.getParameter("wrong");
String skip=request.getParameter("skip");
String email=session.getAttribute("userid").toString();
DbManager dm=new DbManager();
ResultSet rs=dm.select("select name from student where email='"+email+"'");
while (rs.next()) {        
       String name=rs.getString("name");
    
String query="INSERT INTO score(name,correct, wrong, skip, email) VALUES ('"+name+"','"+correct+"','"+wrong+"','"+skip+"','"+email+"')";
    
if(dm.insertUpdateDelete(query))
{
out.print("Your score save successfully");
}
else
{
out.println("Something went wrong please try agan");
};
    }
%>