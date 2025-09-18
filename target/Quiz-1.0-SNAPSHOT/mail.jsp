<%@page import="org.json.simple.JSONObject"%>
<%@page import="mypack.mail"%>
<%
    String otp=request.getParameter("otp");
    String to=request.getParameter("email");
    String from="quiztest147@gmail.com";
    String subject="Thanks for using my Quiz test service";
   String text="Your OTP : "+otp;
   mail m=new mail();
   boolean b=m.sendemail(to, from, text, subject);
   JSONObject obj=new JSONObject();
if(b)
{
obj.put("da","true");
out.println(obj);
}
else
{
obj.put("da","false");
out.println(obj);
};
%>