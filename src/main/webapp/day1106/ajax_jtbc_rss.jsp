<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="외부에서 제공되는 XML(RSS)을 파싱"
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
a{ font-size: 16px; color: #212529; text-decoration: none;}
a hover{ font-size: 16px; color: #dfdfdf}
</style>
<script type="text/javascript">
$(function(){
	
});//ready
function jtbcParsing( url ) {
	//최초 요청한 URL에서 요청하는 URL이 변경될 경우 보안상의 분재가 발생할 수 있다
	//CORS 에러를 발생시킨다. (서버에서 인증을 해주지 않음 => 서버세팅 변경, proxy server를 통해서 우회)
	$.ajax({
		url:"https://news-ex.jtbc.co.kr/v1/get/rss/"+url,
		type:"get",
		dataType:"text",
		error:function( xhr ){
			alert( xhr.status );
		},
		success:function( xmlDoc ){
			alert( xmlDoc )
		}
	});
}
</script>
</head>
<body>
<div id="wrap">
<%
String[] titleArr={"이슈 Top10","정치","경제","사회","국제","문화","연예","스포츠","날씨"};
String[] urlArr={"issue","section/10","section/20","section/30",
		"section/40","section/50","section/60","section/70","section/80"};
%>
	<div>
	<table class="table">
	<%for(int i=0; i<titleArr.length; i++){ %>
	<td><a href="#void"onclick="jtbcParsing('<%= urlArr[i] %>')"><%= titleArr[i] %></a></td>
	<%} %>
	</table>
	</div>
	<div>
	<c:if test="${ not empty param.url }">
	<%
	String prefixUrl="https://news-ex.jtbc.co.kr/v1/get/rss/";
	String paramUrl=request.getParameter("url");
	//out.println(prefixUrl+paramUrl);
	
	//1.파서 생성
	SAXBuilder builder=new SAXBuilder();
	//2.최상위 문서 객체 얻기
	Document doc=builder.build(new URL(prefixUrl+paramUrl));
	//3.root 노드 얻기
	Element rootNode=doc.getRootElement();
	//4.반복대상(getChildren("반복할 노드")), 단숭 정보(getChild("찾아낼 노드"))
	Element channelNode=rootNode.getChild("channel");
	
	Element pubDateNode=channelNode.getChild("pubDate");	
	Element titleNode=channelNode.getChild("title");	
	
	//반복대상
	List<Element> itemNodes=channelNode.getChildren("item");
	
	System.out.println( pubDateNode );
	%>
	<strong>뉴스생성일 : </strong><%= pubDateNode.getValue() %><br>
	<strong>제공자 : </strong><%= titleNode.getValue() %><br>
	<strong>뉴스의 수 : </strong><%= itemNodes.size() %><br>
	<%
	if(itemNodes.isEmpty()){%>
		<div>작성된 뉴스가 없습니다.</div>
<% } %>
	<%
	Element itemTitleNode=null;
	Element itemLinkNode=null;
	Element itemDescriptionNode=null;
	Element itemPubDateNode=null;
	int ind=0;
	for(Element itemNode : itemNodes ){ 
		itemTitleNode=itemNode.getChild("title");
		itemLinkNode=itemNode.getChild("link");
		itemDescriptionNode=itemNode.getChild("description");
		itemPubDateNode=itemNode.getChild("pubDate");
	%>
	<div>
	<ul>
	<li><%= ++ind %><strong>가사명 :</strong> 
	<a href="<%= itemLinkNode.getValue() %>" taget="_blank"> <%= itemTitleNode.getValue() %>,</a>
		<strong>작성일 :</strong> <%= itemPubDateNode.getValue() %>
	</li>
	<li>&nbsp;&nbsp;<strong>기사내용 :</strong><%= itemDescriptionNode.getValue() %>
	</ul>
	</div>
	<%} %>
	</c:if>
	</div>
</div>
</body>
</html>