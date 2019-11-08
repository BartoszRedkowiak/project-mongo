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
                <th>Opis</th>
                <th>Widoczność</th>
                <th>Akcje</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <c:forEach items="${markers}" var="marker" varStatus="index">
                <tr>
                    <td>${marker.id}</td>
                    <td>${marker.name}</td>
                    <td>${marker.description}</td>
                    <td>${marker.visible == true? 'TAK' : 'NIE'}</td>
                    <td>
                        <a class="btn btn-outline-dark" href="/markers/toggle/${marker.id}">Toggle</a><br>
                        <a class="btn btn-outline-warning" href="/markers/edit/${marker.id}">Edytuj dane</a><br>
                        <a class="btn btn-outline-danger" href="#" onclick="confirmDelete(${marker.id})">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
