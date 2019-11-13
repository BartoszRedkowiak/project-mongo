<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>


</head>
<body>

<jsp:include page="elemNavbar.jsp"/>
<div class="container m-1">
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
            <c:forEach items="${users}" var="user" varStatus="index">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>
                        <button class="btn btn-warning" onclick="window.location.href = '/users/edit/${user.id}'">Edytuj</button>
                        <button class="btn btn-danger" onclick="confirmDelete(${user.id}, '/users/delete/')">Usuń</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>
