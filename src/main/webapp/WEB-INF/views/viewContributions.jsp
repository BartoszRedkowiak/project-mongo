<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<c:if test="${not empty param.votingFailed}">
    <div class="container mt-2">
        <div class="card">
            <div class="card-body">
                <p style="color: red">Nie możesz dwukrotnie zagłosować na ten sam film</p>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${not empty param.contSuccess}">
    <div class="container mt-2">
        <div class="card">
            <div class="card-body">
                <p>Przekazano do weryfikacji administratora</p>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${marker.activeEvent == true}">
    <div class="container mt-2">
        <div class="card">
            <div class="card-body">
                <form:form modelAttribute="newContribution" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <h5>Weź udział w evencie</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Nazwij swoje combo</label>
                            <form:input path="name" cssClass="form-control" type="text" id="nameInput"
                                        placeholder="np. Fakie 360 Bigspin"/>
                            <form:errors path="name" element="small" cssStyle="color:red"/>
                        </div>
                        <div class="col-md-6">
                            <label for="linkInput">Dodaj link do filmu na instagramie:</label>
                            <form:input path="igLink" cssClass="form-control" type="text" id="linkInput"
                                        placeholder="Wzór linku: https://www.instagram.com/p/indywidualnyKodFilmu/"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cold-md-12">
                            <input class="btn btn-primary mt-1 ml-3" type="submit" value="Prześlij"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</c:if>

<div class="container mt-2">
    <c:forEach items="${contributions}" var="contribution">
        <div class="card mt-1">
            <h5 class="card-header">
                    ${contribution.name}
            </h5>
            <div class="card-body">
                <div class="card-subtitle mt-1">
                    Dodane przez: ${empty contribution.user? 'Użytkownik usunięty' : contribution.user.fullName}<br>
                    Liczba głosów: ${contribution.votes}
                    <c:if test="${marker.activeEvent == true}">
                        <form method="post" action="/markers/tricks/${marker.id}/vote">
                            <input type="text" value="${contribution.id}" name="contributionId" hidden/>
                            <input type="submit" class="btn btn-primary my-2" value="Łap łapkę w górę"/>
                        </form>
                    </c:if>
                </div>
                <blockquote class="instagram-media"
                            data-instgrm-captioned
                            data-instgrm-permalink="${contribution.igLink}?utm_source=ig_embed&amp;utm_campaign=loading"
                            data-instgrm-version="12"
                            style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);">
                </blockquote>
                <script async src="//www.instagram.com/embed.js"></script>
            </div>
        </div>
    </c:forEach>
</div>
<c:if test="${empty contributions}">
    <div class="container">
        <div class="card mt-2">
            <div class="card-body">
                Brak triczków dla spotu :(
            </div>
        </div>
    </div>
</c:if>
</body>
</html>


