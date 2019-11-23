<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        var streetViewOptions = {
            position: {lat: ${marker.lat}, lng: ${marker.lng}},
            visible: true,
            clickToGo: false
        };

        var marker = new google.maps.Marker({
            position: ${marker.lat}, lng: ${marker.lng},
            map: view
        })
    </script>
    <jsp:include page="elemHeadLinks.jsp"/>
    <script src="<c:url value="/resources/js/mapMarkerDetails.js"/>"></script>
</head>
<body>
<jsp:include page="elemNavbar.jsp"/>

<div class="container-fluid mt-1">
    <div class="card">
        <h5 class="card-header">Szczegóły i ocena spotu</h5>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <div class="container-fluid" id="map">
                        <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
                        </script>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <th scope="row">Nazwa</th>
                                <td>${marker.name}</td>
                            </tr>
                            <tr>
                                <th scope="row">Data dodania</th>
                                <td>${marker.createdOn}</td>
                            </tr>
                            <tr>
                                <th scope="row">Średnia ocena</th>
                                <td>
                                    <c:if test="${rating == 0}">
                                        Brak ocen
                                    </c:if>
                                    <c:if test="${rating != 0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${rating}"/>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Opis</th>
                                <td>${empty marker.description ? "Brak opisu" : marker.description}</td>
                            </tr>
                            <tr>
                                <th scope="row">Kategorie</th>
                                <td>
                                    <c:forEach items="${marker.categories}" var="category">
                                        <span>${category.name}</span><br>
                                    </c:forEach>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a href="/markers/tricks/${marker.id}" class="btn btn-primary">Zobacz triczki na spocie</a>
                        </div>
                    </div>
                    <form:form method="post" modelAttribute="newReview">
                        <div class="row mt-2">
                            <div class="col-md-3">
                                <label for="ratingId">Ocena spotu</label>
                                <form:select path="rating" cssClass="form-control" id="ratingId">
                                    <c:forEach begin="1" end="5" var="number">
                                        <form:option value="${number}"/>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="rating" element="small" cssStyle="color:red"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="commentId">Komentarz</label>
                                <form:textarea path="comment" rows="4" cssClass="form-control" id="commentId"/>
                                <form:errors path="comment" element="small" cssStyle="color:red"/>
                                <input type="submit" class="btn btn-dark mt-1" value="Zapisz"/>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<div class="container-fluid">
    <div class="mt-2">
        <h5>Opinie użytkowników</h5>
        <c:if test="${empty marker.reviews}">
            <div class="card mt-3 mb-3">
                <div class="card-body">
                    Brak opinii
                </div>
            </div>
        </c:if>

        <c:forEach items="${marker.reviews}" var="review">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <small class="form-text text-muted">Data: ${review.created}</small>
                    </div>
                    <div class="row">
                            ${empty review.user? 'Użytkownik usunięty' : review.user.fullName} ocenił
                        na ${review.rating}
                    </div>
                    <div class="row">
                        Komentarz: ${review.comment}
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>

</div>

</body>
</html>
