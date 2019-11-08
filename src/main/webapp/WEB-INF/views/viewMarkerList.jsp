<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
    <script>
        function confirmDelete(id) {
            if (confirm("Potwierdź usunięcie spotu o id: " + id)) {
                window.location.href = "/markers/delete/" + id;
            }
        }
    </script>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div class="container m-1">
    <header>Lista markerów</header>
    <div class="card mt-2">
        <table class="table-sm table-hover">
            <thead class="thead-dark">
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
            <tbody class="table-hover">
            <c:forEach items="${markers}" var="user" varStatus="index">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.lat}</td>
                    <td>${user.lng}</td>
                    <td>${user.description}</td>
                    <td></td>
                    <td>
                        <a class="btn btn-primary" href="/markers/toggle/{id}">Zmień widoczność</a><br>
                        <a class="btn-warning" href="/markers/edit/${user.id}">Edytuj dane</a><br>
                        <a class="btn" href="#" >Dodaj do konkursu</a><br>
                        <a class="btn btn-danger" href="#" onclick="confirmDelete(${user.id})">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
