<%-- 
    Document   : Add
    Created on : Jul 5, 2022, 3:52:56 PM
    Author     : Mai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
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

            input[type="text"], input[type="number"], input[type="date"]{
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
        <%
            singers s = new singers(0, "", "", "", true, null);
            if(request.getAttribute("infor")!=null)
            {
                s = (singers)request.getAttribute("infor");
            }
        %>
        <h2>Add new singer</h2>
        <c:if test="${requestScope.err!=null}"><h4 style="color: red">${requestScope.err}</h4></c:if>
            <form action="AddSinger" method="post">
                <div class="box">
                    ID: <input type="number" name="id"  required/></br>
                </div>
                <div class="box">  
                    Name: <input type="text" name="name" value="<%=s.getName()%>" required/></br>
            </div>
            <div class="box"> 
                Image: <input type="file" name="imgUrl"  accept="image/*"/></br>
            </div>
            <div class="box"> 
                Describe: </br>
                <textarea type="text"  name="describe" ><%=s.getDescribe()%></textarea> <br/>
            </div>
            <div class="box"> 
                Gender: 
                <input type="radio" name="gender" value="0" <%=(s.isGender())?"":"checked"%> >Female
                <input type="radio" name="gender" value="1" <%=(s.isGender())?"checked":""%> >Male </br>
            </div>
            <div class="box"> 
                Date of Birth: <input type="date" name="dob" required value="<%=s.getDob()%>"> </br>
            </div>
            <button>Add</button>
        </form>
    </body>
</html>
