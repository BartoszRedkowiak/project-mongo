$(function () {

});

function confirmDelete(id, path) {
    if (confirm("Potwierdź usunięcie rekordu o id: " + id)) {
        window.location.href = path + id;
    }
}