<%-- 
    Document   : LoginForm
    Created on : Jun 20, 2022, 7:48:47 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <!-- <link rel="stylesheet" href="HomeStyle.css"> -->
        <!-- <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"> -->
        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            body {
                background-color: rgb(26, 27, 58);
                display: flex;
                justify-content: center;
                font-family: 'Courier New', Courier, monospace;
                font-size: 20px;
            }

            .login-form {
                width: auto;
                height: 500px;
                background-color: white;
                border-radius: 20px;
                padding: 30px;
                margin-top: 5%;
            }

            p {
                font-size: 40px;
                color: black;
                text-align: center;
                font-weight: bold;
            }

            input{
                /* border: none; */
            }

            .box{
                margin: 10px;
                /* text-align: center; */
                padding-left: 10px;
            }

            input[type="text"], input[type="password"]{
                padding: 0 10px;
                background-color: rgb(250, 247, 247);
                height: 30px;
                border: 1px solid black;
                border-left: none;
                border-radius: 0 3px 3px 0;
            }

            input[type="text"]:hover, input[type="password"]:hover{
                background-color: white;
            }

            .box button{
                height: 32px;
                border:none;
                border-radius: 3px 0 0 3px;
                border: 1px solid black;
                border-right: none;
                background-color: rgb(250, 247, 247);

            }

            .box-1{
                text-align: center;
            }

            .box-1 a{
                font-size: 13px;
            }
            .box-1 button{
                margin: 10px;
                background: black;
                color:white;
                border-radius: 10px;
                padding: 10px 60px;
                font-size: 20px;
            }
            .box-1 button:hover{
                background-color: rgba(0, 0, 0, 0.666);
            }



        </style>
    </head>



    <body>

        <%--<%@include file="Menu.jsp" %>--%>
        <div class="login-form">
            <p>Login Form</p>
            <%
                   if(request.getAttribute("error")!=null)
                   {
                       String error = (String)request.getAttribute("error");
            %>
            <h6 style="color:red"><%= error %></h6>
            <%}%>
           
            <form action="Login" method="post">
                <div class="box">
                    Username: <br>
                    <div>
                        <button type="submit"><i class="fa-solid fa-user"></i></button><input type="text" name="username" 
                                                                                              placeholder="Username" required></div>
                </div>
                <div class="box">
                    Password: <br>
                    <button type="submit"><i class="fa-solid fa-key"></i></button><input type="password" name="password" placeholder="Password" required>
                </div>
                 <div style="font-size:15px" class="box">
                   
                     <input type="checkbox" name="remember" value="remember"/>Remember me </br>
                </div>
                <div class="box-1">
                    <a href="">Fogot password?</a>
                    <br>
                    <button type="submit" name="login">Login</button>
                    <br>
                    Or Sign Up with
                    <br>
                    <a href="Regist">Sign Up</a>
                </div>
            </form>
        </div>
    </body>
</html>
