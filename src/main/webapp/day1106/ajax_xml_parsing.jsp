<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
$(function(){
	$("#btn").click(function(){
		$.ajax({
			url:"http://localhost/jsp_prj/day1106/parsing_xml.jsp",
			type:"get",
			dataType:"xml",
			error:function( xhr ){
				alert( xhr.status );
			},
			success:function( xmlDoc ){
				//parsing
				//1. JQueryObject에 xml문서를 전달하고, 파싱할 노드를 찾기
				var nameNode=$( xmlDoc ).find("name");
				//2. 찾아낸 노드를 parsing( 값을 얻기)
				var name=nameNode.text();
				$("#name").val( name );
			}
		});//ajax
	});//click
});//ready
</script>
</head>
<body>
<div id="wrap">
	<input type="button" value="XML Parsing" class="btn btn-sm btn-success"
	id="btn"/>
	<br>
	이름 : <input type="text" name="name" id="name"/>
</div>
</body>
</html>