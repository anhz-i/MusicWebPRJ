<%-- 
    Document   : SingerInfor
    Created on : Jul 12, 2022, 1:20:48 AM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.singers"%>

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
                /*display: flex;*/
                /*justify-content: center;*/
                font-family: 'Courier New', Courier, monospace;
                font-size: 30px;
            }

            .box{
                margin: 10px;
            }
            img{
                width:30%;
                height:auto;
                border-radius: 10px;
                z-index:100;
                border: 1px white solid;
            }
        </style>
    </head>
    <body>
        <%
            singers s = (singers) request.getAttribute("singer");
        %>


        <h2> Singer Information </h2>
        <div class="box">
            <img src="${pageContext.request.contextPath}/Images/<%=s.getImgUrl()%>" alt="NotUpdate"/>
        </div>
        <div class="box">
            Name: <%=s.getName()%> 
        </div>
        <div class="box">
            Gender: 
            <%=(s.isGender()?"Male":"Female")%> 
        </div>
        <div class="box">
            Date of Birth: <%=s.getDob()%>
        </div>
        <div class="box">
            Describe: 
           <%=((s.getDescribe()==null||(s.getDescribe().equals("")))?"NotUpdate":s.getDescribe())%>
        </div>
    </body>
</html>
