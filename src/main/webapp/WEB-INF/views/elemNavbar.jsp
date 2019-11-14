<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <a class="navbar-brand js-scroll-trigger" href="/">MonGo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="/markers/add">Dodaj spocik</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Filtruj mapę
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <div class="mt-1 mx-2">
                        <form method="get" action="/">
                            <label for="distanceSlider">Odległość: </label>
                            <output class="ml-1" id="sliderValue">10</output>km<br>
                            <input type="range" min="1" max="20" value="10" name="maxDistance"
                                   class="custom-range"
                                   id="distanceSlider"
                                   oninput="sliderValue.value = distanceSlider.value"/>
                            <label>Rodzaj spotu</label><br>
                            <c:forEach items="${categories}" var="category">
                                <input type="checkbox" name="categoryId" value="${category.id}"/>${category.name}<br>
                            </c:forEach>
                            <input class="btn btn-primary btn-sm" type="submit" value="Filtruj">
                        </form>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Admin
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/markers/list">Lista markerów</a>
                    <a class="dropdown-item" href="/users/list">Lista użytkowników</a>
                    <a class="dropdown-item" href="/contributions/list">Lista kontrybucji</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Użytkownik
                </a>
                <div class="dropdown-menu">
                    <form:form action="/users/login" method="post" class="px-4 py-3" modelAttribute="userLogin">
                        <div class="form-group">
                            <label for="loginEmail">Adres email</label>
                            <form:input path="email" type="email" class="form-control" id="loginEmail" placeholder="email@example.com"/>
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Hasło</label>
                            <form:password path="password" class="form-control" id="loginPassword" placeholder="Password"/>
                        </div>
                        <button type="submit" class="btn btn-primary">Zaloguj</button>
                    </form:form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/users/register">Rejestracja</a>
                    <a class="dropdown-item" href="/users/profile">Profil</a>
                    <a class="dropdown-item" href="#">Wyloguj</a>
                </div>
            </li>
        </ul>
    </div>
</nav>