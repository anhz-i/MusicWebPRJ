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
            function deleteSinger(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "UpdateSinger?id=" + id + "&value=1";
                }
            }

        </script>
        <style>
            *{
                color: white;
            }
            body, table{
                margin-top: 20px;
                text-align: center
            }
            img{
                width:100px;
                height:100px;
                border-radius: 10px;
                z-index:100;
                border: 1px white solid;
            }
        </style>

    </head>
    <body>

    <center>
        <h1>List of Singers</h1>
        <h3><a href="AddSinger">Add a singer</a></h3>
        <table border="1px solid white" width="70%" >
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Describe</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${singerList}" var="i">
                <c:set var="id" value="${i.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${i.name}</td>
                    <td><img src="${pageContext.request.contextPath}/Images/${i.imgUrl}" alt="NotUpdate"/></td>
                    <td>${i.describe}</td>
                    <td>${(i.gender)?"Male":"Female"}</td>
                    <td>${i.dob}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/UpdateSinger?id=${i.id}&value=0">Update</a> &nbsp;
                        <a href="#" onclick="deleteSinger(${i.id});">Delete</a>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
