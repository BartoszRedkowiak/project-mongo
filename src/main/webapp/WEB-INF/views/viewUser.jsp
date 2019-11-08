<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div class="container-fluid">
    <div class="card mt-2  mb-2">
        <div class="card-body">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="firstNameId">Imię</label>
                    <form:input path="firstName" cssClass="form-control" id="firstNameId"/>
                </div>

                <div class="form-group">
                    <label for="lastNameId">Nazwisko</label>
                    <form:input path="lastName" cssClass="form-control" id="lastNameId"/>
                </div>
                <div class="form-group">
                    <label for="emailId">Email</label>
                    <form:input path="email" cssClass="form-control" id="emailId"/>
                </div>

                <div class="form-group">
                    <label for="passwordOneId">Hasło</label>
                    <form:input path="password" cssClass="form-control" id="passwordOneId"/>
                </div>

                <div class="form-group">
                    <label for="passwordTwoId">Powtórz hasło</label>
                    <input class="form-control" id="passwordTwoId" name="password2"/>
                </div>

                <div class="form-group">
                    <label for="categoriesId">Rodzaj deseczki</label>
                    <form:select items="${mainCategories}" path="sportTypes" cssClass="form-control" id="categoriesId"
                                 itemLabel="name"
                                 itemValue="id"/>
                </div>
                <input class="btn btn-dark" type="submit" value="Zapisz"/>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
