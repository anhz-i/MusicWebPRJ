<%-- 
    Document   : Menu
    Created on : Jun 20, 2022, 11:30:48 PM
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
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            .menu-slide{
                /*background-image: url(../..//Images/Untitled.jpg);*/
                background-image: url(${pageContext.request.contextPath}/Images/Untitled.jpg);
                background-repeat: no-repeat;
                background-size: contain;
            }
        </style>

    </head>

    <body class="">
        <header>
            <div id="subMenu">

                <div>
                    <div class="logo">
                      
                        <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="HotSoundLogo">
                    </div>
                </div>
                <div class="sign">
                    <div class="">
                        <div class="sign-in-up">
                            <a href="${pageContext.request.contextPath}/Login" title="Đăng nhập">
                                Sign In
                            </a>
                        </div>
                        <div class="sign-in-up">
                            <a href="${pageContext.request.contextPath}/Regist" title="Đăng ký" onclick="">
                                Sign Up
                            </a>
                        </div>
                    </div>

                   
                    <div class="search-container">
                        <form action="">
                            <input type="text" placeholder="Tìm kiếm.." name="search">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>

            </div>
        </header>
    </body>
</html>
