<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 22.
  Time: PM 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.dao.BoardDAO"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="u" class="org.example.project22.bean.BoardVO"/>
<jsp:setProperty name="u" property="*"/>


<%
    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);
    String msg="데이터 추가 성공 !";
    if(i==0) msg="[에러] 데이터 추가";
%>
<script>
    alert("<%=msg%>");
    location.href='list.jsp';
</script>