<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 22.
  Time: PM 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="org.example.project22.dao.BoardDAO" %>

<%
    request.setCharacterEncoding("UTF-8");

    String seqStr = request.getParameter("seq");
    int seq = 0;
    int result = 0;

    try {
        if (seqStr != null) {
            seq = Integer.parseInt(seqStr);
            BoardDAO dao = new BoardDAO();
            result = dao.deleteBoard(seq);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    String msg = (result == 1) ? "글이 삭제되었습니다." : "[에러] 삭제에 실패했습니다.";
%>

<script>
    alert("<%= msg %>");
    location.href = 'list.jsp';
</script>
