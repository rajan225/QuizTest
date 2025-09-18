<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>
<%
   
   if(request.getParameter("page").equals("singup"))
   {
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String password=request.getParameter("password");
   DbManager dm=new DbManager();
   ResultSet r=dm.select("SELECT * FROM student where email='"+email+"'");
   if(r.next())
   {
   out.print("<script>alert('Your account is Already Exist');window.location.href='index.jsp';</script>");

   }
   else
   {
   if(dm.insertUpdateDelete("INSERT INTO student(name, password, email, date) VALUES ('"+name+"','"+password+"','"+email+"',now())"))
   {
   session.setAttribute("userid", email);
   response.sendRedirect("test.jsp");
   };
   };
   }
   else if(request.getParameter("page").equals("singin"))
   {
   String email=request.getParameter("email");
   String password=request.getParameter("password");
   DbManager dm=new DbManager();
   ResultSet rs=dm.select("SELECT * FROM student where email='"+email+"'");
   if (rs.next())
   {
   if(password.equals(rs.getString("password")) && email.equals(rs.getString("email")))
   {
   if(email.equals("user@admin"))
   {
   response.sendRedirect("addquestion.jsp");
   }
   else
   {
String id=rs.getString("email");
   session.setAttribute("userid", id);
   response.sendRedirect("score.jsp");

   }
   }
   else
   {
out.print("<script>alert('Your password is wrong');window.location.href='index.jsp';</script>");
   }
   }
   else
   {
out.print("<script>alert('Your email is not Exist');window.location.href='index.jsp';</script>");
   };
   }

   %>