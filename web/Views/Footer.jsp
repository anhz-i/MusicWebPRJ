<%-- 
    Document   : Footer
    Created on : Jul 11, 2022, 5:56:59 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>
        <style>
            footer{
                text-align: center;
                background-color:rgb(19,24,43);
                height:auto;
                padding: 50px;
                /*box-sizing: border-box*/
            }
            footer a{
                color:white;
                padding: 20px;
                font-size: 30px;

            }
            footer i{
                border: 1px solid white;
                border-radius: 5px;
                width: 60px;
                height: 50px;
                padding-top: 12px;
            }
            footer i:hover{
                background-color: white;
                color: rgb(19,24,43);
            }

            footer h1{
                color:white;
                font-family: fantasy
            }

        </style>
    </head>
    <body>
        <hr style="margin-top:50px">
        <footer>
            <h1>HOTSOUND.COM</h1>
            <a href="#"><i class="fa-brands fa-twitter"></i></i></a>
            <a href="#"><i class="fa-brands fa-facebook-f"></i></i></a>
            <a href="#"><i class="fa-brands fa-instagram"></i></i></a>

        </footer>
    </body>
</html>
