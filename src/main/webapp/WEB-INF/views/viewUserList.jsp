<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>


</head>
<body>

<jsp:include page="elemNavbar.jsp"/>
<div class="container-fluid mt-1 mx-1">
    <div class="card mt-2">
        <h5 class="card-header">Lista użytkowników</h5>
        <div class="card-body">
        <table class="table table-sm table-hover table-responsive-sm">
            <thead class="thead-dark">
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
                        <button class="btn btn-warning m-1" onclick="window.location.href = '/users/edit/${user.id}'">Edytuj</button>
                        <button class="btn btn-danger m-1" onclick="confirmDelete(${user.id}, '/users/delete/')">Usuń</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </div>
</div>


</body>
</html>
