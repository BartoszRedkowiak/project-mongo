<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div class="container">
    <div class="card mt-2  mb-2">
        <h5 class="card-header">
            Logowanie
        </h5>
        <div class="card-body">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="emailId">Email</label>
                    <form:input path="email" cssClass="form-control" id="emailId"/>
                </div>
                <div class="form-group">
                    <label for="passwordOneId">Hasło</label>
                    <form:password path="password" cssClass="form-control" id="passwordOneId"/>
                </div>
                <input class="btn btn-dark" type="submit" value="Zapisz"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
