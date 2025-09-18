<%-- 
    Document   : test
    Created on : 17 Feb 2025, 4:48:59 pm
    Author     : win 10
--%>
<%@page import="java.util.Random" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypack.DbManager"%>

<%
if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
{
response.sendRedirect("index.jsp");
}
else
{
%>
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
                .formdiv{
                    background-image: url("image/backgroundimg1.jpg");
                    width: 100%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                  
                }
                .qudiv
                {
                    width: 80%;
                   min-height:100px;
                    background: #023289;
                    opacity: 0.8;
                    border:2px solid white;
                    box-shadow: 0 0 20px 10px #e002ab, 0 0 40px #e002ab ;
                    clip-path: polygon(10% 0,90% 0, 100% 50%,90% 100%,10% 100%, 0 50%);
                }
            </style>
        </head>

        <body>
            <div class="container-fluid" id="maindiv">
                
                <div class="row w-50 my-5 formdiv text-light d-flex testdiv">
                    
                    
                    <div class="row align-items-center justify-content-center">
                        <div class="qudiv d-flex align-items-center">
                            <div class="quno text-center" style="float: left;" >
                                <h2 class="text-warning" id="quno">1</h2>
                            </div>
                            <div class=" pt-2 text-justify position-relative w-75 " style="float: left; min-height: 100px;">
                                <p id="question">Welcome to Quiz</p>
                            </div>
                            <div class="timediv"style="float: left;" >
                                <h1 class="text-danger" id="timeh">30</h1>
                            </div>
                             
                        </div>
                        
                    </div>
                     <div class="row d-flex justify-content-center">
                         <div class="col-sm-6  align-items-center">
                             <div class="qudiv w-100 d-flex align-items-center" id="opdiv1">
                            <div class="quno text-center" style="float: left;">
                                <h2 class="text-success">A</h2>
                            </div>
                                 <div class="pt-2 text-justify position-relative pe-3" style="float: left; width:80% ; min-height: 100px;">
                                <p id="op1"> </p>
                            </div>
                        </div>
                         <div class="qudiv w-100 mt-2 d-flex align-items-center" id="opdiv2" >
                            <div class="quno text-center" style="float: left;">
                                <h2 class="text-success">B</h2>
                            </div>
                                 <div class="pt-2 text-justify position-relative pe-3" style="float: left; width:80% ; min-height: 100px;">
                                <p id="op2"> </p>
                            </div>
                        </div>
                         </div>
                          <div class="col-sm-6">
                             <div class="qudiv w-100 d-flex align-items-center" id="opdiv3">
                            <div class="quno text-center" style="float: left;">
                                <h2 class="text-success">C</h2>
                            </div>
                                 <div class="pt-2 text-justify position-relative pe-3" style="float: left; width:80% ; min-height: 100px;">
                                <p id="op3"></p>
                            </div>
                        </div>
                         <div class="qudiv w-100 mt-2 d-flex align-items-center" id="opdiv4">
                            <div class="quno text-center" style="float: left;">
                                <h2 class="text-success">D</h2>
                            </div>
                                 <div class="pt-2 text-justify position-relative pe-3" style="float: left; width:80% ; min-height: 100px;">
                                <p id="op4"></p>
                            </div>
                        </div>
                         </div>
                        
                    </div>
                 
                   </div>
                    <!-------scorediv ---------->
                                        <!-------scorediv ---------->
                      <div class="container w-50 my-5  text-light d-flex scorediv " Style="background:#00cccc; box-shadow: 5px 5px 30px 3px black; border-radius: 5px">
                    <div class="row mr-0 vw-100 d-flex justify-content-center align-items-center ">
                        <h1 class="text-center text-dark">QUIZ TEST</h1>
                       
                        <div class="w-75 p-0" style="" id="ansdiv">
                            <table class="table table-borderd" border="4">
                                <tr>
                                    <th><h3 class="text-center">  </h3></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td>
                                        Correct Answer
                                    </td>
                                    <td> &#9989;<h3 class="d-inline ms-3" id="cans">0</h3> </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Wrong Answer
                                    </td>
                                    <td> <span class="bg-danger text-light" Style="border: 2px solid black;" >&#x2717;</span><h3 class="d-inline ms-3" id="wans">0</h3> </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Skip Answer
                                    </td>
                                    <td> <span class="text-light p-1" Style="background:forestgreen ; border: 2px solid black; margin-right: 5px;" > ></span><h3 class="d-inline ms-3" id="sans">0</h3></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center" ><button class="text-light h-25 w-50 btn bg-success sub" >Submit</button></td>
                                </tr>
                            </table>                        
          
                    </div>
                   

                </div>
                    <!-------scorediv ---------->
                    
                
            </div>
            <script src="js/jquery.js"></script>
            <script>
                
                $(document).ready(function() {
                    $('.scorediv').addClass('d-none');
                    let quno=1;
                    let width=$('body').width();
                    
                    if(width<800)
                    {
                        $('.formdiv').removeClass('w-50');
                    }
                    
                    localStorage.clear();
                    changeQu();
                    
                  
                    
   $('#opdiv1, #opdiv2, #opdiv3, #opdiv4').click( function(event) {
   $('#opdiv1, #opdiv2, #opdiv3, #opdiv4').css({
      'background':'#023289',
       'color'     :'white'  
   }).removeClass('choose');    
   $(this).css({
       'background':'#F5FA0D',
       'color'     :'black'
       
   }).addClass('choose');
     
});
 
   
   let timediv=30;
   let a=setInterval(function() {
    
    
    if(timediv<0)
    {  
        
//      -------------save your pespons------- 
      let question=$('#question').text();
let ch=$('.choose p').text();        
 let oldop=JSON.parse(localStorage.getItem("userpre")) ?? [];
oldop.push({
    'question':question,
          'op':ch,
          'id':quno
          
});
localStorage.setItem("userpre",JSON.stringify(oldop));

//      -------------save your pespons------- 
           quno++;
           if(quno == 9)
           {
            clearInterval(a);
            quno=0;
           $('.scorediv').removeClass('d-none');
           $('.testdiv').addClass('d-none');
           alert("your test is done.");
           score();
           
           };
          changeQu();
           
           
        $('#quno').text(quno);
        
        timediv=30;
   
       
    }
    else
    {
     $("#timeh").text(timediv);
      timediv--; 
       

      
    };
    
},1000);
   
// ------------------change question start-------------
function changeQu(){

    
    $('#opdiv1, #opdiv2, #opdiv3, #opdiv4').css({
      'background':'#023289',
       'color'     :'white'  
   }).removeClass('choose');
    
    
        
  if(quno !=0)
  {
        $.post("setop.jsp",
  {
    quno: quno
  },
  function(data, status){
   let alldata=JSON.parse(data);
   if(alldata["op1"] != "empty")
   {    
   
   let que=alldata["question"];
   let op1=alldata["op1"];
   let op2=alldata["op2"];
   let op3=alldata["op3"];
   let op4=alldata["op4"];
   $('#question').text(que);
   $('#op1').text(op1);
   $('#op2').text(op2);
   $('#op3').text(op3);
   $('#op4').text(op4);
   }
   else
   {
       clearInterval(a);
    alert("your test is done.");
    $('.scorediv').removeClass('d-none');
    $('.testdiv').addClass('d-none');
    score();
    
   }; 
   
  });
  };
};
// ------------------change question end-------------



//----------------------------------score code start-----------------

function score(){
    
let c=0, w=0, s=0;
    let userdata=JSON.parse(localStorage.getItem("userpre"));
    userdata.forEach(function(element,i) {
    $.post("skor.jsp",
  {
    id: element["id"]
  },
  function(data){
    
    let el=element["op"].toLowerCase();
    let alldata=JSON.parse(data);
   let cop=alldata["cop"].toLowerCase();
    if(el != "")
    {
     if(cop == el )
     {
         c++;
         $('#cans').text(c);
         // corr=c;
     }
     else
     {
         w++;
        $('#wans').text(w);
             
     };
 }
 else
 {
     s++;
     $('#sans').text(s);
 };
  });
  
  
});

};
//----------------------------------score code end-----------------

 
});
$('.sub').click(function (){
    let ca=$('#cans').text();
    let wa=$('#wans').text();
    let sa=$('#sans').text();
    $.post("cont.jsp",
  {
    correct: ca,
    wrong: wa,
    skip: sa
  },
  function(data, status){
 
  alert(data);
  window.location.href='index.jsp';
  })
});  
            </script>
        </body>

        </html>
        <%}%>