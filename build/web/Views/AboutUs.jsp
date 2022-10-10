<%-- 
    Document   : Home.jsp
    Created on : Jun 20, 2022, 5:37:25 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="controller.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>



    </head>

    <body class="">
         <c:set var="ses" value="${sessionScope.loginUser}"/>
        <c:if test="${ses == null}">       
            <%@include file="Guest/Header.jsp" %>
        </c:if>
        <c:if test="${ses != null}">         
            <%@include file="User/Header.jsp" %>
        </c:if>

        <%@include file="Menu-Slide.jsp" %>

        <h2 style="margin: 20px 50px">Introduce</h2>

        <div class="intro">
            <p>
                <a href="Home.jsp">HotSound</a>
                là ứng dụng nghe nhạc hàng đầu Việt Nam, là nơi chia sẻ, truyền cảm hứng cuộc sống bằng âm nhạc đỉnh cao, bằng khát vọng tiên phong mang lại sự chuyên nghiệp cho nền âm nhạc Việt Nam. Chủ động gắn kết các thế hệ Nghệ sỹ Việt, rút ngắn khoảng cách giữa Nghệ sỹ và Khán giả.
            </p>
            <p><a href="Home.jsp">HotSound</a> là một ứng dụng nghe nhạc MP3 đa nền tảng, có sẵn trên những thiết bị như iPhone, iPod, iPad, Android, Nokia, Windows Phone. Ngoài ra bạn sẽ không phải mất thì giờ tìm lại một loạt các bài hát yêu thích vì <a href="Home.jsp">HotSound</a> có chức năng lưu lại các bài hát bạn đã nghe và yêu thích, quá thông minh, quá độc đáo phải không?</p>
        </div>
        
         <%@include file="Footer.jsp" %>
    </body>
</html>
