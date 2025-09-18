<%--
Document : addquestion
Created on : 4 Mar 2025, 10:52:29 am
Author : win 10
--%>

    <%@page import="java.sql.ResultSet"%>
        <%@page import="mypack.DbManager"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Quiz test</title>
                    <link href="css/bootstrap.css" rel="Stylesheet" />
                    <link href="css/style.css" rel="Stylesheet" />
                    <script src="js/bootstrap.bundle.js"></script>
                </head>

                <body>
                    <div class="container-flued" Style="background: #f1f3f3;">
                        <div class="container vh-100">
                            <div class="row">
                                <div class="col-sm-5">

                                    <!--------------------form div-->
                                    <div class="my-5">
                                        <form action="#" method="post" onsubmit="event.preventDefault();sub()" class="form">

                                            <input type="hidden" name="page" value="add_question" />
                                            <label for="name" class="form-label">Enter
                                    Question number</label>
                                            <input type="number" required="true" name="id" class="form-control" id="id" placeholder="Enter question number" />

                                            <label for="name" class="form-label">Enter
                                    Question</label>
                                            <input type="text" required="true" name="question" id="qu" class="form-control" placeholder="Enter question" />
                                            <label for="email" class="form-label">Enter
                                    option first </label>
                                            <input type="text" required="true" name="op1" id="op1" class="form-control" placeholder="Enter option first" />
                                            <label for="email" class="form-label">Enter
                                    option second </label>
                                            <input type="text" required="true" name="op2" id="op2" class="form-control" placeholder="Enter option Second" />
                                            <label for="email" class="form-label">Enter
                                    option third </label>
                                            <input type="text" required="true" name="op3" id="op3" class="form-control" placeholder="Enter option third" />
                                            <label for="email" class="form-label">Enter
                                    option fourth </label>
                                            <input type="text" required="true" name="op4" id="op4" class="form-control" placeholder="Enter option fourth" />
                                            <label for="email" class="form-label">Enter
                                    correct option </label>
                                            <input type="text" required="true" name="cop" id="cop" class="form-control" placeholder="Enter correct option " />

                                            <button type="submit" class="mt-5 w-25  btn btn-outline-success float-end">Submit</button>
                                            <button type="reset" class="mt-5 w-25  btn btn-outline-danger float-start">Clear</button>

                                        </form>
                                    </div>

                                </div>

                                <div class="col-sm-7">

                                    <div class="my-5 overflow-auto " style="height: 600px;">
                                        <table class="table table-responsive ">
                                            <tr class="sticky-top">
                                                <th>Q._No.</th>
                                                <th>Question</th>
                                                <th>First</th>
                                                <th>Second</th>
                                                <th>Third</th>
                                                <th>Fourth</th>
                                                <th>Correct</th>
                                                <th>Button</th>
                                            </tr>
                                            <%
                                DbManager dm=new DbManager();
                                ResultSet
                                rs=dm.select("SELECT * FROM question");
                                while (rs.next()) {

                                %>

                                                <tr>
                                                    <td>
                                                        <%=rs.getString("id")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("question")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("op1")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("op2")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("op3")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("op4")%>
                                                    </td>
                                                    <td>
                                                        <%=rs.getString("correct")%>
                                                    </td>
                                                    <td>
                                                        <!--<input id= type="hidden"/>-->
                                                        <a class="btn btn-outline-danger " onclick="delqu(<%=rs.getString(" id ")%>)">Delete</a>
                                                        <a class="btn btn-outline-danger mt-1 px-3" onclick="edit(<%=rs.getString(" id ")%>)">Edit</a>
                                                    </td>
                                                </tr>

                                                <%}%>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="js/jquery.js"></script>
                    <script>
                        function delqu(y) {
                            if (confirm('Are you sure you want to Delete question No. ' + y + ' ?')) {

                                $.post("qudel.jsp", {
                                    id: y
                                }, );
                                location.reload(true);
                            }
                        };

                        function edit(z) {

                            $.post("edit.jsp", {
                                    id: z
                                },

                                function(data) {

                                    let alldata = JSON.parse(data);
                                    let id = alldata["id"];
                                    let que = alldata["question"];
                                    let op1 = alldata["op1"];
                                    let op2 = alldata["op2"];
                                    let op3 = alldata["op3"];
                                    let op4 = alldata["op4"];
                                    let cop = alldata["cop"];
                                    $('#qu').val(que);
                                    $('#op1').val(op1);
                                    $('#op2').val(op2);
                                    $('#op3').val(op3);
                                    $('#op4').val(op4);
                                    $('#cop').val(cop);
                                    $('#id').val(id);
                                });
                        };

                        function sub() {
                            let qu = $('#qu').val();
                            let op1 = $('#op1').val();
                            let op2 = $('#op2').val();
                            let op3 = $('#op3').val();
                            let op4 = $('#op4').val();
                            let cop = $('#cop').val();
                            let id = $('#id').val();
                            $.post("submitQ.jsp", {
                                page: "sub",
                                id: id,
                                qu: qu,
                                op1: op1,
                                op2: op2,
                                op3: op3,
                                op4: op4,
                                cop: cop
                            }, function(data) {
                                let res = JSON.parse(data);
                                if (res["id"] == id) {
                                    if (confirm("Your Question No. " + id + " is alredy exist,Press 'OK' Update your Question! Otherwise change Question No. ")) {

                                        if (confirm("Are you sure want to Update your Question?")) {
                                            //         
                                            $.post("submitQ.jsp", {
                                                page: "update",
                                                id: id,
                                                qu: qu,
                                                op1: op1,
                                                op2: op2,
                                                op3: op3,
                                                op4: op4,
                                                cop: cop
                                            }, function(succes) {
                                                alert(succes);
                                                window.location.reload();
                                            });
                                            //
                                        }
                                    }
                                } else {
                                    alert(res["id"]);
                                    window.location.reload();

                                }
                            });
                        };
                    </script>
                </body>

                </html>