const editInfo = document.getElementById("editInfo")
const mainDiv = document.getElementById("infoDiv")
const editInfoDiv = document.getElementById("editInfoDiv")
const editBtn = document.getElementById("edit")

editInfo.addEventListener('click',() => {
    mainDiv.classList.add('isInactive');
    editInfoDiv.classList.remove('isInactive');
})

editBtn.addEventListener('click',() => {
    mainDiv.classList.remove('isInactive');
    editInfoDiv.classList.add('isInactive');
})