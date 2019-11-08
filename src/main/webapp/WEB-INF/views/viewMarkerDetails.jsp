<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div>
${marker.name}
</div>

<table border="2">
    <tr>Dodane przez XXX dnia XXX</tr>
    <tr>${marker.description}</tr>
    <tr>kategorie</tr>
</table>


Komentarze

<div>
    <p>Komentarze</p>
</div>

</body>
</html>
