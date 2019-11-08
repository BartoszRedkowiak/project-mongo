<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>

<a href="/">Strona główna TEMP</a>

<table border="2">
    <thead>
    <tr>
        <th>Id</th>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Email</th>
        <th>Akcje</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user" varStatus="index">
        <tr>
            <td>${user.id}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>
                <button onclick="window.location.href = '/users/edit/${user.id}'">Edytuj</button>
                <button onclick="window.location.href = '/users/delete/${user.id}'">Usuń</button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>



</body>
</html>
