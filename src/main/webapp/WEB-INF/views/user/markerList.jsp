<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Spot List</title>
    <script>
        function confirmDelete(id) {
            if (confirm("Potwierdź usunięcie spotu o id: " + id)) {
                window.location.href = "/markers/delete/" + id;
            }
        }
    </script>
</head>
<body>

<a href="/">Strona główna TEMP</a>

<table border="2">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nazwa</th>
        <th>Lat</th>
        <th>Lng</th>
        <th>Opis</th>
        <th>Widoczność</th>
        <th>Akcje</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${markers}" var="marker" varStatus="index">
        <tr>
            <td>${marker.id}</td>
            <td>${marker.name}</td>
            <td>${marker.lat}</td>
            <td>${marker.lng}</td>
            <td>${marker.description}</td>
            <td></td>
            <td>
                <a href="/markers/edit/${marker.id}">Edytuj dane</a><br>
                <a>Dodaj do konkursu</a><br>
                <a>Zmień widoczność</a><br>
                <a href="#" onclick="confirmDelete(${marker.id})">Delete</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>


</body>
</html>
