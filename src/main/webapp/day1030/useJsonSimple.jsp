<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
//1. JSONObject 생성 - Map기반
JSONObject jsonObj=new JSONObject();
//2. 값할당
jsonObj.put("name"," 김현우");
jsonObj.put("age",20);
//3. jsonObj을 문자열로 얻기
//String jsonStr=jsonObj.toString();
String jsonStr=jsonObj.toJSONString();
%>
<%= jsonStr %>
    