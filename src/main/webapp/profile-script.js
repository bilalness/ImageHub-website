document.getElementById('file-input').addEventListener('change', function () {
    var fileName = this.files[0].name;
    document.getElementById('upload-label').textContent = fileName;
});

document.getElementById('upload-btn').addEventListener('click', function () {
    document.getElementById('upload-form').submit();
});

function openModal(imageId) {
    var modal = document.getElementById("modal");
    var modalImg = document.getElementById("modal-img");
    modal.style.display = "block";
    modalImg.src = "image?id=" + imageId;
}

function closeModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "none";
}
