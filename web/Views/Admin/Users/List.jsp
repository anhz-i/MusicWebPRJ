<%-- 
    Document   : List
    Created on : Jul 8, 2022, 3:32:43 PM
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
        <title></title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

        <script>
            function deleteUser(userName)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "ViewUser?userName=" + userName + "&value=1";
                }
            }

        </script>
        <style>
            *{
                color: white;
            }
            img{
                width:100px;
                height:100px;
                border-radius: 10px;
                z-index:100;
                border: 1px white solid;
            }
            body, table{
                margin-top: 20px;
            }
        </style>

    </head>
    <body>

    <center>
        <h1>List of Users</h1>
        <table border="1px solid white" width="80%" >
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Image Url</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Activated</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${userList}" var="i">

                <tr>
                    <td>${i.userName}</td>
                    <td>${i.fname}</td>
                    <td>${i.lname}</td>
                    <td>${(i.gender)?"Male":"Female"}</td>
                    <td><img src="${pageContext.request.contextPath}/Images/${i.imgUrl}" alt="NotUpdate"/></td>
                    <td>${i.email}</td>
                    <td>${i.phone}</td>
                    <td>${i.address}</td>
                    <td>${(i.active)?"Yes":"No"}</td>
                    <td>
                        <a href="#" onclick="deleteUser('${i.userName}');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
