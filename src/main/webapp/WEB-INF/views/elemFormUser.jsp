<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form:form method="post" modelAttribute="user">
    <div>
        <label for="firstNameId">Imię</label>
        <form:input path="firstName" id="firstNameId"/>
    </div>

    <div>
        <label for="lastNameId">Nazwisko</label>
        <form:input path="lastName" id="lastNameId"/>
    </div>

    <div>
        <label for="emailId">Email</label>
        <form:input path="email" id="emailId"/>
    </div>

    <div>
        <label for="passwordId">Hasło</label>
        <form:input path="password" id="passwordId"/>
    </div>

    <div>
        <label for="categoriesId">Rodzaj deseczki(domyślne ustawienia wyszukiwania spotów)</label>
        <form:select items="${mainCategories}" path="sportTypes" id="categoriesId" itemLabel="name" itemValue="id"/>
    </div>

    <input type="submit" value="Zapisz"/>

</form:form>
