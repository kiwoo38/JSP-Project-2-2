<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 22.
  Time: PM 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.dao.BoardDAO, org.example.project22.bean.BoardVO,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="top.jsp"/>

<h2 class="mb-4 text-center">자유게시판</h2>

<%
    request.setCharacterEncoding("UTF-8");

    String type = request.getParameter("type");
    String keyword = request.getParameter("keyword");

    if (type == null || type.trim().equals("")) {
        type = "title";
    }

    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list;

    if (keyword != null && !keyword.trim().isEmpty()) {
        list = boardDAO.searchBoard(type, keyword);
    } else {
        list = boardDAO.getBoardList();
    }

    request.setAttribute("list", list);
%>

<form class="row g-2 mb-3" action="list.jsp">
    <div class="col-auto">
        <select name="type" class="form-select">
            <option value="title"
            ${empty param.type or param.type == 'title' ? 'selected="selected"' : ''}>
                title
            </option>
            <option value="writer"
            ${param.type == 'writer' ? 'selected="selected"' : ''}>
                writer
            </option>
        </select>
    </div>

    <div class="col-auto">
        <input type="text" name="keyword" class="form-control" placeholder="검색어 입력">
    </div>

    <div class="col-auto">
        <button class="btn btn-primary">검색</button>
    </div>

    <div class="col-auto">
        <button type="button" class="btn btn-success" onclick="location.href='write.jsp'">새 글 작성</button>
    </div>
</form>

<table class="table table-striped table-hover align-middle">
    <thead class="table-dark">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>게시일자</th>
        <th>메뉴</th>
    </tr>
    </thead>

    <tbody>

    <c:forEach var="vo" items="${list}">
        <tr>
            <td>${vo.seq}</td>
            <td>
                <a class="title-link" href="view.jsp?seq=${vo.seq}">
                        ${vo.title}
                </a>
            </td>
            <td>${vo.writer}</td>
            <td>${vo.cnt}</td>
            <td>${vo.regdate}</td>
            <td>
                <button class="btn btn-sm btn-warning"
                        onclick="location.href='edit.jsp?seq=${vo.seq}'">수정</button>

                <button class="btn btn-sm btn-danger"
                        onclick="location.href='delete_ok.jsp?seq=${vo.seq}'">삭제</button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<jsp:include page="bottom.jsp"/>

