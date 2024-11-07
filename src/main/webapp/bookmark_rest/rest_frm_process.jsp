<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.rest.RestaurantDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/session_chk.jsp" %>
<%@ include file="../common/jsp/post_chk.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rVO" class="kr.co.sist.user.rest.RestaurantVO" scope="page"/>
<jsp:setProperty name="rVO" property="*"/>
<%
rVO.setId(sessionId);

boolean insertFlag=false;
RestaurantDAO rDAO=RestaurantDAO.getInstance();
try{
	rDAO.insertRest(rVO);
	insertFlag=true;
}catch(SQLException se){
	se.printStackTrace();
}

pageContext.setAttribute("insertFlag", insertFlag);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.230/jsp_prj/common/images/favicon.ico"/>
<!-- bootstrap CON 시작-->
<link rel="stylesheet" type="text/css" href="http://192.168.10.230/jsp_prj/common/css/main_20240911.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- JQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
var msg="식당이 즐겨찾기 되지 않았습니다.";
<c:if test="${ insertFlag }">
msg="${ userData.id }님 ${ param.restaurant }정보가 즐겨찾기 되었습니다";
</c:if>
alert( msg );
location.href="rest_map.jsp";

$(function(){
	
});//ready
</script>
</head>
<body>
<div id="wrap">
	
</div>
</body>
</html>