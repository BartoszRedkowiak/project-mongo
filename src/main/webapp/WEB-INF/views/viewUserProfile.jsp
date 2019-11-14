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
        <h5 class="card-header">Dane użytkownika</h5>
        <div class="card-body">
            <table class="table table-responsive-sm table-borderless">
                <thead class="thead-dark">
                <tr></tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="row">Imię</td>
                    <td>${user.firstName}</td>
                </tr>
                <tr>
                    <td scope="row">Nazwisko</td>
                    <td>${user.lastName}</td>
                </tr>
                <tr>
                    <td scope="row">Email</td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td scope="row">Kategorie</td>
                    <td>
                        <c:forEach items="${user.sportTypes}" var="category">
                            ${category.name}<br>
                        </c:forEach>
                    </td>
                </tr>


                <tr>
                    <td>Akcje</td>
                    <td>
                        <button class="btn btn-primary ml-1" onclick="window.location.href = '/users/edit/${user.id}'">
                            Edytuj
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
