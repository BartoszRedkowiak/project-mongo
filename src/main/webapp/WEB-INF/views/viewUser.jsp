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
        <h5 class="card-header">${empty user.id ? 'Rejestracja użytkownika' : 'Edycja danych'}</h5>
        <div class="card-body">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="userNameId">Login</label>
                    <form:input path="username" cssClass="form-control" id="userNameId"/>
                    <form:errors path="username" element="small" cssStyle="color:red"/>
                </div>
                <div class="form-group">
                    <label for="firstNameId">Imię</label>
                    <form:input path="firstName" cssClass="form-control" id="firstNameId"/>
                    <form:errors path="firstName" element="small" cssStyle="color:red"/>
                </div>
                <div class="form-group">
                    <label for="lastNameId">Nazwisko</label>
                    <form:input path="lastName" cssClass="form-control" id="lastNameId"/>
                    <form:errors path="lastName" element="small" cssStyle="color:red"/>
                </div>
                <div class="form-group">
                    <label for="emailId">Email</label>
                    <form:input path="email" cssClass="form-control" id="emailId"/>
                    <form:errors path="email" element="small" cssStyle="color:red"/>
                </div>

                <div class="form-group">
                    <label for="passwordOneId">Hasło</label>
                    <form:password path="password" cssClass="form-control" id="passwordOneId"/>
                    <form:errors path="password" element="small" cssStyle="color:red"/>
                </div>

                <div class="form-group">
                    <label for="passwordTwoId">Powtórz hasło</label>
                    <input type="password" class="form-control" id="passwordTwoId" name="password2"/>
                </div>

                <div class="form-group">
                    <label for="categoriesId">Rodzaj deseczki</label>
                    <form:select items="${mainCategories}" path="sportTypes" cssClass="form-control" id="categoriesId"
                                 itemLabel="name"
                                 itemValue="id"/>
                    <form:errors path="sportTypes" element="small" cssStyle="color:red"/>
                </div>
                <input class="btn btn-dark" type="submit" value="Zapisz"/>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
