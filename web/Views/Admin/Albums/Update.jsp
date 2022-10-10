<%-- 
    Document   : Update
    Created on : Jul 5, 2022, 1:36:09 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.albums"%>

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
        <%
           albums al = (albums) request.getAttribute("al");
        %>
        <%--<%=al%>--%>
        <h2>Update Album</h2>
        <form action="UpdateAlbum" method="post">
            <div class="box">
                Id: <input type="number" readonly  name="id" value="<%=al.getId()%>"  /> <br/>
            </div>
            <div class="box">
                Name: <input type="name" name="name" value="<%=al.getName()%>" /> <br/>
            </div>
            <div class="box">
                Describe: <br/>
                <textarea type="text"  name="describe"><%=al.getDescribe()%></textarea> <br/>
            </div>
            <div class="box">
                Change image: </br> <input type="file" name="imgUrl" accept="image/*"/></br>
                <input type="hidden" name="imgUrl1" value="<%=al.getImgUrl()%>" />
            </div>
            <button>Save</button>
        </form>
    </body>
</html>
