<%-- 
    Document   : test
    Created on : 17 Feb 2025, 4:48:59 pm
    Author     : win 10
--%>
<%@page import="mypack.mail"%>
<%@page import="java.util.Random" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>

<%--
if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
{
response.sendRedirect("index.jsp");
}
else
{
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Quiz test</title>
            <link href="css/bootstrap.css" rel="Stylesheet"/>
            <link href="css/style.css" rel="Stylesheet">
            <script src="js/bootstrap.bundle.js"></script>
            <style>
               
            </style>
        </head>

        <body>
            <div class="container-fluid bg-light " id="maindiv">
                

                    <!-------scorediv ---------->
                      <div class="container w-50 resdiv my-5  text-light d-flex scorediv " Style="background:#00cccc; box-shadow: 5px 5px 30px 3px black; border-radius: 5px">
          
                   
                        
                        
                    <div class="row mr-0 vw-100 d-flex justify-content-center align-items-center ">
                        <h1 class="text-center text-dark">QUIZ TEST</h1>
                         <%
                            String id=session.getAttribute("userid").toString();
                            DbManager dm=new DbManager();
                            ResultSet rs=dm.select("SELECT * FROM score WHERE email='"+id+"'");
                            while (rs.next()) {                                    
                                    
                                
                            %>
                        <div class="w-75 p-0" style="" id="ansdiv">
                            <table class="table table-borderd" border="4">
                                <tr>
                                    <th><h3 class="text-center"> <%=rs.getString("name")%> </h3></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td>
                                        Correct Answer
                                    </td>
                                    <td> &#9989; <%=rs.getString("correct")%></td>
                                </tr>
                                 <tr>
                                    <td>
                                        Wrong Answer
                                    </td>
                                    <td> <span class="bg-danger text-light" Style="border: 2px solid black;" >&#x2717;</span> <%=rs.getString("wrong")%></td>
                                </tr>
                                 <tr>
                                    <td>
                                        Skip Answer
                                    </td>
                                    <td> <span class="text-light" Style="background:forestgreen ; border: 2px solid black; margin-right: 5px;" >> </span>  <%=rs.getString("skip")%></td>
                                </tr>
                            </table>                        
                        </div>
                                <%
    String c=rs.getString("correct") ; 
   String w=rs.getString("wrong");
   String s=rs.getString("skip");
    String to=session.getAttribute("userid").toString();
    String from="quiztest147@gmail.com";
    String subject="Thanks for using my Quiz test service";
   String text="your Correct answer : "+c+", Your wrong answer : "+w+", Skip question : "+s;
   mail m=new mail();
   boolean b=m.sendemail(to, from, text, subject);

                                
                                }%>
                    </div>
                   

                </div>
                    <!-------scorediv ---------->
                    
                
            </div>
            <script src="js/jquery.js"></script>
            <script>
                
                $(document).ready(function() {
                    
                    let quno=1;
                    let width=$('body').width();
                    
                    if(width<800)
                    {
                        $('.resdiv').removeClass('w-50');
                        $('#ansdiv').removeClass('w-75');
                        $('#ansdiv').addClass('h-50');
                       
                    }
                    
                    
});
            </script>
        </body>

        </html>
        <%--}--%>