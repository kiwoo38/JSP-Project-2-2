<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 26.
  Time: PM 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
    // 업로드된 파일명 저장 변수
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;   // 15MB 제한

    // 실제 업로드 경로 (프로젝트 내부의 /upload 폴더)
    String realPath = request.getServletContext().getRealPath("upload");
    System.out.println(realPath);

    // 업로드 경로에 폴더가 없다면 생성
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    // 파일 업로드 처리
    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(
            request,               // 파싱할 request
            realPath,              // 저장 경로
            sizeLimit,             // 파일 크기 제한
            "utf-8",               // 인코딩
            new DefaultFileRenamePolicy() // 파일명 중복 처리 정책
    );

    // 업로드된 파일의 실제 저장된 파일명 얻기
    filename = multipartRequest.getFilesystemName("photo");

    // (선택사항) 이미지 경로 변수
    String imagepath = "";
    if (filename != "") {
       out.print("<h3>" + filename +"<h3>");
       out.print("<img src='./upload/"+ filename+"'height=400>");
    }
%>


