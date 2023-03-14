window.onload = start();

function start(){
const editInfo = document.getElementById("editInfo")
const mainDiv = document.getElementById("infoDiv")
const editInfoDiv = document.getElementById("editInfoDiv")
const editBtn = document.getElementById("edit")

editInfo.addEventListener('click',() => {
    mainDiv.classList.add('isInactive');
    editInfoDiv.classList.remove('isInactive');
})

editBtn.addEventListener('click',() => {
    let nombrePlatoDia = document.getElementById('inputPlatoDia').value;
    let descriptionPlatoDia = document.getElementById('descripcionPlatoDia').value;

    mainDiv.classList.remove('isInactive');
    editInfoDiv.classList.add('isInactive');

    let pPlatoDia = document.getElementById('nombrePDia').innerHTML=nombrePlatoDia;
    let dPlatoDia = document.getElementById('descriptionPDIa').innerHTML=descriptionPlatoDia;
})
}
