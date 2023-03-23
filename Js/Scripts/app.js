window.onload = start();


import {Plato} from '../Class/Plato.js'

/*Asuntos de Node.js para leer el archivo platos.json
const { readFileSync } = require("fs");
const path = "D:\VisualStudioProjects\firstWebSite\CNMPBuffetMenu\Data\platos.json"
const jsonString = readFileSync(path);

console.log(JSON.parse(jsonString))
*/ 

function start(){
const editInfo = document.getElementById("editInfo")
const mainDiv = document.getElementById("infoDiv")
const editInfoDiv = document.getElementById("editInfoDiv")
const categoriesDiv = document.querySelector(".opciones")
const editBtn = document.getElementById("edit")

editInfo.addEventListener('click',() => {
    mainDiv.classList.add('isInactive');
    categoriesDiv.classList.add('isInactive');
    editInfoDiv.classList.remove('isInactive');
})

editBtn.addEventListener('click',() => {
    let nombrePlatoDia = document.getElementById('inputPlatoDia').value;
    let descriptionPlatoDia = document.getElementById('descripcionPlatoDia').value;

    mainDiv.classList.remove('isInactive');
    categoriesDiv.classList.remove('isInactive');
    editInfoDiv.classList.add('isInactive');
    
    console.log(nombrePlatoDia + ', Nombre plato');
    console.log(descriptionPlatoDia + ', Descripcion plato');

    document.getElementById('nombrePDia').innerHTML=nombrePlatoDia;
    document.getElementById('descripcionPDia').innerHTML = descriptionPlatoDia;
    }
)

let nombrePlatoDia = document.getElementById('inputPlatoDia');
nombrePlatoDia.addEventListener('keyup',(event) => {
    let inputText = nombrePlatoDia.value;
    document.getElementById('presentacionNombre').innerHTML = inputText; 
})

let descripcionPDia = document.getElementById('descripcionPlatoDia');
descripcionPDia.addEventListener('keyup',(event) => {
    let inputText = document.getElementById('descripcionPlatoDia').value;
    document.getElementById('presentacionDesc').innerHTML = inputText;
})

function scrollFunction1(){
    let e = document.getElementById("pescados");
        e.scrollIntoView({
          block: 'start',
          behavior: 'smooth',
          inline: 'start'
        });
}


let p1 = new Plato('Mondongo','Mondongo a la espanola con papas',1500.00,1,'Carnes Rojas')

console.log(p1.presentacion());

p1.setPlatoDia(0);

console.log(p1.presentacion());
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


