<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 22.
  Time: PM 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add New Post</h1>
<form action="write_ok.jsp" method="post">
    <table>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="writer"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"></textarea></td>
        </tr>
        <tr>
            <td><a href="">View All Records</a></td>
            <td align="right"><input type="submit" value="Add Post"></td>
        </tr>
    </table>
</form>
</body>
</html>
