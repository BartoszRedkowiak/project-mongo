<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div id="sidebar">

    <div class="sidebar-item">
        <a href="/markers/add"><h5>Dodaj spocik</h5></a>
    </div>
    <div class="foldable"></div>
    <div class="sidebar-item">
        <h5>Filtry mapy</h5>
    </div>
    <div class="foldable">
        <form method="get" >
            <div id="sliderContainer">
                <label>Odległość: <span id="sliderValue"></span><br>
                    <input type="range" min="0" max="20" value="10" name="maxDistance" class="form-control-range" id="distanceSlider">
                </label>
            </div>
            <div>
                <label>Rodzaj spotu<br>
<%--                    <form:options path="categories" items="${categories}" itemValue="id" itemLabel="name"/>--%>
                </label>
            </div>
            <div>
                <label>Rodzaj spotu<br>
                    <input type="checkbox" name="spotType" value="flatground" checked>Flatground<br>
                    <input type="checkbox" name="spotType" value="vert">Vert<br>
                    <input type="checkbox" name="spotType" value="street">Street
                </label>
            </div>
            <input type="submit" value="Filtruj">
        </form>
        <script>
            var slider = $('#distanceSlider');
            var output = $('#sliderValue');
            output.val(slider.valueAsNumber);

            // Update the current slider value
            slider.on('input', function () {
                output.val(slider.valueAsNumber)
            })
        </script>
    </div>
    <div class="sidebar-item">
        <h5>Wydarzenia</h5>
    </div>
    <div class="foldable">
        <a>Aktualne wydarzenia</a><br>
        <a>Dodaj wydarzenie</a><br>
    </div>
    <div class="sidebar-item">
        <h5>Lordowie spocików</h5>
    </div>
    <div class="foldable">
        <a>Lista hot spocików</a><br>
        <a>Liderzy</a><br>
    </div>
</div>

<script>
    $(function (events, handler) {
        var sidebarItem = $('div .sidebar-item');
        sidebarItem.on('click', function () {
            $(this).next().toggle(300);
        })
    })

</script>


<%--
Filtr boczny na stronie głównej

Opcje:
- filtr: rodzaj sportu
- fitr: ocena spotu
- filtr: typ spotu
- filtr: odległość
przycisk submit
--%>