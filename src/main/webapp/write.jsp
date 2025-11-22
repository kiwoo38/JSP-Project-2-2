<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 22.
  Time: PM 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<h1>새 글 작성</h1>
<form action="write_ok.jsp" method="post">
    <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" name="title" class="form-control" required>
    </div>

    <div class="mb-3">
        <label class="form-label">작성자</label>
        <input type="text" name="writer" class="form-control" required>
    </div>

    <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea name="content" class="form-control" rows="5" required></textarea>
    </div>

    <button type="submit" class="btn btn-primary">저장</button>
    <a href="list.jsp" class="btn btn-secondary">목록</a>
</form>
<jsp:include page="bottom.jsp"/>
