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

//Lee platos.json y los carga en sus correspondientes divs en el menu textual, funciona bien pero tendria que optimizar la carga de los datos para no recorrer todos los platos cada vez que avanzo de categoria.
const cargarPlatos = async () =>{
    try {
        let respuesta = await fetch('./Data/Platos.json')

        const datos = await respuesta.json();

        //Mapeo el arreglo datos y paso a cats los nombres de las categorias, podria que al realizar esto ya pasar los platos a un arreglo para cada categoria.
        let cats = datos.map((dato) => {
            let categoria = dato.cat;
            return categoria;
        });

        //Por cada categoria recorro los platos y los cargo en su div previamente obtenido por id
        cats.forEach(cate => {
            let divComida = document.getElementById(cate.toLowerCase())
            divComida.innerHTML=''
            //let html = `<div class="categoria" id="${cate.toLowerCase()}"> <h3>${cate}</h3>`;
            let html = `<h3>${cate}</h3>`
            let comidas = '';
            datos.forEach(Plato => {
                if(Plato.cat === cate){
                    
                    comidas += (comidas.substring(0,4)==='<ul>' ? `` : `<ul>`) + `<li> <h4>${Plato.nombre}</h4> <button value=${Plato.id}>${Plato.precio} <img src="./Iconos/shoppingCart/apple-touch-icon.png" style="width: 24px; height: 24px;" alt=""> </button> </li>`
                }
            });
            /*Si se abrio una lista con platos se cierra, sino se deja el div vacio*/
            (comidas.substring(0,4)==='<ul>' ? '</ul>' : '');
            
            html += comidas
            divComida.innerHTML = html;
        });
        
    } catch (error) {
        console.log(`Error: ${error}`);    
    }
} 
    
    cargarPlatos();

}

