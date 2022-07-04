<%--
  Created by IntelliJ IDEA.
  User: sherk
  Date: 19-Jun-22
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration Form</title>
</head>
<body>
    <h1>Student Registration Form</h1>

    <form action="/student/save" method="post">
        <input type="hidden" name="id" value="${Student.id}"/>
        <input type="text" name="name" value="${Student.name}" placeholder="name">
        <input type="text" name="department" value="${Student.department}" placeholder="department">
        <input type="text" name="country" value="${Student.country}" placeholder="country">

        <button type="submit">Save</button>
    </form>
    <a href="/student/list">Back to Student List</a>
</body>
</html>
