<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>
<div class="container-fluid">
    <div>
        ${marker.name}
    </div>

    <table border="2">
        <tr>Dodane przez XXX dnia XXX</tr>
        <tr>${empty marker.description ? "Brak opisu" : marker.description}</tr>
        <tr>średnia Ocena: <fmt:formatNumber type="number" maxFractionDigits="2" value="${rating}"/></tr>
        <tr>kategorie</tr>
    </table>

    <div class="card mt-2">
        <form:form method="post" action="/markers/newReview" modelAttribute="newReview">
            <input name="markerId" value="${marker.id}" hidden>
            <div class="row">
                <div class="form-group col-md-3">
                    <label for="ratingId">Ocena spotu</label>
                    <form:input path="rating" cssClass="form-control" id="ratingId"/>
                </div>
                <div class="form-group col-md-3">
                    <input type="submit" class="btn btn-dark" value="Zapisz"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="commentId">Komentarz</label>
                    <form:textarea path="comment" rows="4" cssClass="form-control" id="commentId"/>
                </div>
            </div>
        </form:form>
    </div>
    <h5>Opinie</h5>
    <c:forEach items="${marker.reviews}" var="review">
        <div class="card mt-1">
            <table>
                <tr>
                    ${review.user.lastName} ocenił na ${review.rating}
                </tr>
                <tr>
                    ${review.comment}
                </tr>
            </table>
        </div>

    </c:forEach>

</div>

</body>
</html>
