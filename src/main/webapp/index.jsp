<%-- 
    Document   : index
    Created on : 15 Feb 2025, 9:00:06 pm
    Author     : win 10
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to fit=no">

            <title>Quiz test</title>
            <link href="css/bootstrap.css" rel="Stylesheet" />
            <link href="css/style.css" rel="Stylesheet">
            <script src="js/bootstrap.bundle.js"></script>
            <style>

            </style>
        </head>

        <body>
            <div class="container-fluid bg-light h-100%" id="maindiv">

                <div class="container row w-50 resdiv my-5  text-light" Style="background:#00cccc; box-shadow: 5px 5px 30px 3px black; border-radius: 5px">
                    <div class="row  mt-2">
                        <div class="col-md-10">
                            <h1 class="text-center py-3 text-dark">QUIZ TEST</h1>

                        </div>

                        <div class="col-md-2">
                            <a class=" text-dark log fs-3" href="#">Sign in</a>
                            <a class=" text-dark logup fs-3" onclick="window.location.reload()" href="#">Sign up</a>
                        </div>
                    </div>

                    <!-- -------------registration start------------ -->
                    <div class="row singupdiv">
                        <form class="form" method="post" id="reform" onsubmit="event.preventDefault();check()" action="controller.jsp">
                            <input type="hidden" value="singup" name="page" />
                            <label for="name" class="form-label">Enter Full Name</label>
                            <input type="text" required="true" name="name" class="form-control" placeholder="Enter your full name" />
                            <label for="email" class="form-label">Enter Email Id </label>
                            <input type="email" required="true" id="email" name="email" class="form-control" placeholder="Enter email" />
                            <label for="email" class="form-label">Enter Email OTP </label>
                            <input type="number" required="true" class="form-control" id="otp" placeholder="Enter email OTP" />
                            <div class="float-end mt-4 text-light p-1 m-1" onclick="verify()" id="btnotp"> <input type="button" value="OTP Verify" /> </div>
                            <div class="float-end mt-4 text-light p-1 m-1" id="timeotp"></div>
                            <div class="float-end mt-4 text-light p-1 m-1" onclick="send()" id="sendotp"> <input type="button" value="Send OTP" /> </div>
                            <p class="ptext d-none">225</p>
                            <label for="password" class="form-label mt-5">Enter New Password </label>
                            <input type="password" required="true" name="password" class="form-control" placeholder="Enter new password" />
                            <button type="reset" onclick="window.location.reload()" class="mt-5 w-25 text-light btn btn-outline-danger float-start">Clear</button>
                            <button type="submit" class="mt-5 w-25 text-light btn btn-outline-primary bg-success float-end">Submit</button>

                        </form>
                    </div>
                    <!-- -------------registration end------------ -->
                    <!-- -------------login start------------ -->

                    <div class="row singindiv">
                        <form class="form" method="post" action="controller.jsp">
                            <input type="hidden" value="singin" name="page" />

                            <label for="email" class="form-label">Enter email id </label>
                            <input type="email" required="true" name="email" class="form-control" placeholder="Enter email" />
                            <label for="password" class="form-label">Enter password </label>
                            <input type="password" required="true" name="password" class="form-control" placeholder="Enter new password" />

                            <button type="submit" class="mt-5 w-25 text-light btn btn-outline-success bg-success float-end">Log in</button>

                        </form>
                    </div>
                    <!-- -------------login end------------ -->

                </div>
            </div>
            <script src="js/jquery.js"></script>
            <script>
                function send() {
                    alert("Please keep your device connected to fast Internet.");
                    let num = Math.floor(Math.random() * 1000000);

                    let em = $('#email').val();
                    let ti = 60;
                    let a = setInterval(function() {

                        if (ti == 0) {
                            $('#timeotp').text("ram");
                            clearInterval(a);

                        };
                        $('#timeotp').text(ti);
                        $('#sendotp input').val('Resend');
                        ti--;
                    }, 1000);
                    $.post("mail.jsp", {
                            otp: num,
                            email: em
                        },
                        function(data) {
                            let d = JSON.parse(data);
                            if (d["da"] == "true") {
                                $('.ptext').text(num);
                            } else {
                                alert("Your email is wrong or Network problem.");
                                $('#sendotp input').css({
                                    'background-color': 'white',
                                    'color': 'black'
                                });

                                clearInterval(a);
                            };

                        });
                };

                function verify() {
                    let num = $('.ptext').text();

                    let val = $('#otp').val();

                    if (val == num) {
                        $('#btnotp input').val("Verified").css({
                            'background-color': 'green',
                            'color': 'white'
                        });

                    } else {
                        alert('Your OTP is wrong Try again..');
                        $('#otp').val('');
                        $('#btnotp input').val("Try again").css({
                            'background-color': 'red',
                            'color': 'white'
                        });

                    }
                };

                function check() {
                    let v = $('#btnotp input').val();
                    if (v !== "Verified") {
                        alert("First verify your OTP.");

                    } else {
                        $('#reform').get(0).submit();
                    };
                };
                $(document).ready(function() {
                    let width = $('body').width();

                    if (width < 800) {
                        $('.resdiv').removeClass('w-50');
                    };
                    $('.singindiv').addClass('d-none');
                    $('.logup').addClass('d-none');
                    $('.log').click(function() {
                        $('.singupdiv').addClass('d-none');
                        $('.log').addClass('d-none');
                        $('.singindiv').removeClass('d-none');
                        $('.logup').removeClass('d-none');
                    });
                    $('.logup').click(function() {
                        $('.singupdiv').removeClass('d-none');

                        $('.logup').addClass('d-none');
                        $('.singindiv').addClass('d-none');
                    });

                });
            </script>
        </body>

        </html>