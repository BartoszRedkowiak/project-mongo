<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Marker</title>
</head>
<body>

<div>
    <h2>Add new marker</h2>
    <form:form method="post" modelAttribute="marker">
        <label>Lat:
            <form:input path="lat"/>
        </label>
        <label>Lng:
            <form:input path="lng"/>
        </label>
        <label>Name:
            <form:input path="name"/>
        </label>
        <label>Description:
            <form:input path="description"/>
        </label>
        <input type="submit" value="Add marker">
    </form:form>
</div>


</body>
</html>
