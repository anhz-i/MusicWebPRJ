<%-- 
    Document   : ChangePass
    Created on : Jul 10, 2022, 8:23:09 PM
    Author     : Mai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                padding: 50px;
                color: white;
                background-color: rgb(26, 27, 58);
                display: flex;
                justify-content: center;
                font-family: 'Courier New', Courier, monospace;
                font-size: 30px;
            }

            button{
                height: auto;
                border:none;
                border-radius: 5px;
                border: 1px solid black;
                background-color: rgb(250, 247, 247);
                margin: 10px;
                padding: 10px;
                box-sizing: border-box;
                font-size: 30px;


            }

            button:hover{
                background-color: rgba(0, 0, 0, 0.666);
                color: white;
                border: 1px solid white;

            }

            input[type="password"]{
                padding: 0 10px;
                background-color: rgb(250, 247, 247);
                height: 30px;
                border: 1px solid black;
                border-radius: 3px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        
    <c:set var="user" value="${sessionScope.loginUser}"/>
    <form action="ChangePass" method="post">

        <div class="box">
            Old Password: </br>
            <input type="password" name="pass" placeholder="Password" required>
        </div>
        <div class="box">
            New Password: </br>
            <input type="password" name="newPass" placeholder="NewPassword" required>
        </div>
        <div class="box">
            Re-enter New Password: </br>
            <input type="password" name="reNewPass" placeholder="Re-Enter-NewPassword" required>
        </div>

        <button type="submit" name="save">Save</button>
        <%
                           if(request.getAttribute("err")!=null)
                           {
                               String error = (String)request.getAttribute("err");
        %>
        <h6 style="color:red"><%= error %></h6>
        <%}%>
    </form>
</body>
</html>
