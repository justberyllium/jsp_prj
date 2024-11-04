<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업로드된 파일의 처리"
    %>
<%
//1. 업로드 저장 디렉토리 설정
File saveDir=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

//2. 최대파일크기 설정
int fileSize=1024*1024*600;
//3. FileUpload Component 생성
MultipartRequest mr=new MultipartRequest(request,saveDir.getAbsolutePath(), fileSize,"UTF-8",
		new DefaultFileRenamePolicy());
//4. 파일명받기
String fileSystemName=mr.getFilesystemName("profile");

File readFile=new File(saveDir.getAbsolutePath()+fileSystemName);
//최대 파일크기 비교
int maxSize=1024*1024*10; //10MByte
boolean uploadflag = readFile.length() > maxSize;
if(uploadflag){//파일 사이즈가 큰 경우 => 업로드된 파일을 삭제한다
	readFile.delete();
}//end if

//5. 응답화면 
JSONObject jsonObj=new JSONObject();
jsonObj.put("uploadflag",uploadflag);
out.print(jsonObj.toJSONString());
%>
    