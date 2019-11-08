<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>
<div lass="container m-1">
    <header>Lista użytkowników</header>
    <div class="card mt-2">
        <table class="table-sm table-hover">
            <thead class="thead-dark">
            <tr>
                <th>Id</th>
                <th>Imię</th>
                <th>Nazwisko</th>
                <th>Email</th>
                <th>Akcje</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <c:forEach items="${users}" var="marker" varStatus="index">
                <tr>
                    <td>${marker.id}</td>
                    <td>${marker.firstName}</td>
                    <td>${marker.lastName}</td>
                    <td>${marker.email}</td>
                    <td>
                        <button class="btn btn-warning" onclick="window.location.href = '/users/edit/${marker.id}'">Edytuj</button>
                        <button class="btn btn-danger" onclick="window.location.href = '/users/delete/${marker.id}'">Usuń</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>
