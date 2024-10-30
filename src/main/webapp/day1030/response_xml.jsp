<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <msg>JSP에서 XML을 응답</msg>
</root>
<% 
    // 서버 로그에 요청 메서드 출력
    System.out.println("--------------" + request.getMethod());
%>
