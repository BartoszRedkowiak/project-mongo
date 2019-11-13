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

<div class="container">
    <div class="card mt-2">
            <div class="card-body">
                <form:form modelAttribute="newContribution" method="post">
                    <label for="linkInput">Chcesz walczyć o spot? Wklej link filmu na instagramie:</label>
                    <form:input path="igLink" cssClass="form-control" type="text" id="linkInput"
                                placeholder="Wzór linku: https://www.instagram.com/p/indywidualnyKodFilmu/"/>
                    <label>Nazwij swoje combo</label>
                    <form:input path="name" cssClass="form-control" type="text" id="nameInput"
                                placeholder="np. Fakie 360 Bigspin"/>
                    <input class="btn btn-primary mt-1" type="submit" value="Prześlij"/>
                </form:form>
            </div>
    </div>
</div>

<div class="container">
    <c:forEach items="${contributions}" var="contribution">
        <div class="card mt-2">
            <div class="card-body">
                <h5 class="card-header">
                    ${contribution.name}
                </h5>
                <div class="card-subtitle mt-1">
                    Dodane przez: ${contribution.user.firstName} ${contribution.user.lastName} (${contribution.user.email})<br>
                    Liczba głosów: ${contribution.votes}
                    <form method="post" action="/markers/tricks/vote">
                        <input type="text" value="${contribution.id}" name="contributionId" hidden/>
                        <input type="submit" class="btn btn-primary my-2" value="Łap łapkę w górę"/>
                    </form>
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
</body>
</html>


