<%@page import="mypack.DbManager"%>
<%
    
String id=request.getParameter("id");
DbManager dm=new DbManager();
String query="DELETE FROM question WHERE id='"+id+"'";
 if(dm.insertUpdateDelete(query))
{
response.sendRedirect("addquestion.jsp");
}
else
{
out.print("<script>alert('Something went wrong please try agan');window.location.href='addquestion.jsp'</script>");

}
%>
