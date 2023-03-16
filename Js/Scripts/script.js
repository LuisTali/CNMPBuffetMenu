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

/*
//Formas de declarar una funcion
const suma = function(n1,n2){
    return n1 + n2;
}
console.log(suma(2,2));

function resta(n1,n2){
    return n1 - n2;
}
console.log(resta(3,2));

const multiplicacion = (n1,n2) => {
    return n1 * n2;
}
console.log(multiplicacion(10,5));

const dividir = (n1,n2) => n1 / n2;
console.log(dividir(4,2));

//Con un solo parametro puedo omitir los parentesis.
const saludar = nombre => 'Hola' + nombre;
console.log(saludar('Luis'));*/


import {Plato} from '../Class/Plato.js'

let p1 = new Plato('Mondongo','Mondongo a la espanola con papas',1500.00,1,'Carnes Rojas')

console.log(p1.presentacion());

p1.setPlatoDia(0);

console.log(p1.presentacion());