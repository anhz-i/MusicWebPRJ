<%-- 
    Document   : AdminArea
    Created on : Jun 20, 2022, 11:15:01 PM
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
        <title>Document</title>
        <style>
            body {
                background-color: rgb(26, 27, 58);

                font-family: 'Courier New', Courier, monospace;
                font-size: 20px;
                font-weight: bold;

            }
            h1{
                color: white;
                /* margin-left: 30px; */
                text-align: center;
            }
            a{
                text-decoration: none;
            }
            p{
                padding-top: 10px;
            }
            .manage {
                display: flex;

                background: white;
                margin: 20px ;
                justify-content: space-between;
                border-radius: 10px;
                padding: 20px 50px;
            }
            .manage ul{
                display: flex;
            }
            .manage li{
                display:inline-block;
                /* margin: 0 20px; */
                /* background-color: blue; */
                padding: 10px;
                border-radius: 5px;

            }

            .manage li:hover, .sub:hover{
                background-color: rgb(228, 228, 228);

            }

        </style>

        <!-- <script>
            change(){
                window.location = 'Home.html'
            }
        </script> -->
    </head>

    <body>

        <h1>Admin Area</h1>
        <hr>
        
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/Management?type=1">Album Management</a>
        </div>
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/Management?type=2">Song Management</a>
        </div>
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/Management?type=3">Singer Management</a>
        </div>
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/Management?type=4">User Management</a>
        </div>
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/ChangePass">Change Password</a>
        </div>
        <div class="manage sub">
            <a href="${pageContext.request.contextPath}/Logout">Logout</a>

        </div>
    </body>

</html>
