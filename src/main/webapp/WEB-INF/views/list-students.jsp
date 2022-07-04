<%--
  Created by IntelliJ IDEA.
  User: sherk
  Date: 19-Jun-22
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Student Directory</title>
</head>
<body>
    <h3>Student Directory</h3>
    <form action="/student/addStudent">
        <a href="/student/addStudent">Add Student</a>
    </form>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Department</th>
                <th>Country</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${Students}" var="tempStudent">
                <tr>
                    <td><c:out value="${tempStudent.name}"/></td>
                    <td><c:out value="${tempStudent.department}"/></td>
                    <td><c:out value="${tempStudent.country}"/></td>
                    <td>
                        <a href="/student/updateStudent?id=${tempStudent.id}">Update</a>|
                        <a href="/student/delete?id=${tempStudent.id}"
                           onclick="if(!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
