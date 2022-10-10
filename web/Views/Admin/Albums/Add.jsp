<%-- 
    Document   : Add
    Created on : Jul 5, 2022, 3:52:56 PM
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
            textarea {
                width: 40%;
                height: 300px;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                resize: none;
            }

            body {
                padding: 50px;
                color: white;
                background-color: rgb(26, 27, 58);
                /*display: flex;*/
                /*justify-content: center;*/
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
                font-size: 25px;


            }

            button:hover{
                background-color: rgba(0, 0, 0, 0.666);
                color: white;
                border: 1px solid white;
                cursor: pointer;

            }

            input[type="text"]{
                padding: 0 10px;
                background-color: rgb(250, 247, 247);
                height: 30px;
                border: 1px solid black;
                border-radius: 3px;
                margin-bottom: 10px;
            }
            .box{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <h2>Add new album</h2>
        <c:if test="${requestScope.err!=null}"><h4 style="color: red">${requestScope.err}</h4></c:if>
        <c:set var="name" value=""/>
        <c:set var="img" value=""/>
        <c:set var="des" value=""/>

        <c:if test="${requestScope.infor!=null}">
            <c:set var="name" value="${requestScope.infor.name}"/>
            <c:set var="img" value="${requestScope.infor.imgUrl}"/>
            <c:set var="des" value="${requestScope.infor.describe}"/>
        </c:if>
        <form action="AddAlbum" method="post">
            <div class="box">
                ID: <input type="number" name="id" required/></br>
            </div>
            <div class="box">
                Name: <input type="text" name="name" value = "${name}" required/></br>
            </div>
            <div class="box">
                Image: <input type="file" name="imgUrl" value = "${img}" accept="image/*"/></br>
            </div>
            <div class="box">
                Describe: </br>
                <textarea type="text"  name="describe">${des}</textarea> <br/>
            </div>
            <button>Add</button>
        </form>
    </body>
</html>
