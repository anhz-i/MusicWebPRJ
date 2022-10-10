<%-- 
    Document   : Update
    Created on : Jul 5, 2022, 1:36:09 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.singers"%>

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
           singers s = (singers) request.getAttribute("singer");
        %>
        <h2>Update Singer</h2>
        <form action="UpdateSinger" method="post">
            <div class="box">
                Id: <input type="number" readonly  name="id" value="<%=s.getId()%>"  /> <br/>
            </div>
            <div class="box">
                Name: <input type="text" name="name" value="<%=s.getName()%>" /> <br/>
            </div>
            <div class="box">
                Change image: </br> <input type="file" name="imgUrl" accept="image/*"/></br>
                <input type="hidden" name="imgUrl1" value="<%=s.getImgUrl()%>" />
            </div>
            <div class="box">
                Describe: <br/>
                <textarea type="text"  name="describe"><%=(s.getDescribe()==null)?"":s.getDescribe()%></textarea> <br/>
            </div>
            <div class="box">
                Gender: 
                <input type="radio" name="gender" value="0" <%=(s.isGender()?"":"checked")%> >Female
                <input type="radio" name="gender" value="1" <%=(s.isGender()?"checked":"")%> >Male </br>
            </div>
            <div class="box">
                Date of Birth: <input type="date" name="dob" value="<%=s.getDob()%>"> </br>
            </div>
            <button>Save</button>
        </form>
    </body>
</html>
