<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div class="container-fluid mt-1 mx-1">
    <header>Lista kontrybucji(trików)</header>
    <div class="card mt-2">
        <table class="table table-sm table-hover table-responsive-sm">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Data dodania</th>
                <th scope="col">Nazwa</th>
                <th scope="col">Użytkownik</th>
                <th scope="col">Marker Id</th>
                <th scope="col">Zweryfikowano</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contributions}" var="contribution" varStatus="index">
                <tr class="initEntry">
                    <td scope="row">${contribution.id}</td>
                    <td>${contribution.created}</td>
                    <td>${contribution.name}</td>
                    <td>${contribution.user.email}</td>
                    <td>${contribution.marker.id}</td>
                    <td>
                        ${contribution.validated == true? 'TAK' : 'NIE'}
                        <a class="btn btn-dark btn-sm ml-1 my-1" href="/contributions/validate/${contribution.id}">Toggle</a>
                    </td>
                    <td>
                        <div class="row">
                            <a class="btn btn-primary btn-sm mx-1 my-1" href="/contributions/view/${contribution.id}">Sprawdź</a> <br>
                            <a class="btn btn-warning btn-sm mx-1 my-1" href="/contributions/edit/${contribution.id}">Edytuj</a> <br>
                            <a class="btn btn-danger btn-sm mx-1 my-1"
                               onclick="confirmDelete(${contribution.id}, '/contributions/delete/')">Usuń</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
