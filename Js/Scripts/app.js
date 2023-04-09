window.onload = start();

import {Plato} from '../Class/Plato.js'

function start(){

//Carrito
let carrito = [];
let subTotal = 0;

//inputSubtotal mostrar precio
const inputSubT = document.getElementById('subtotal');

//Boton para ordenar al costado del inputSubTotal
const orderBtn = document.getElementById('order')

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
                    
                    comidas += (comidas.substring(0,4)==='<ul>' ? `` : `<ul>`) + `<li> <h4>${Plato.nombre}</h4> <button value=${Plato.id}>${Plato.precio}<img src="./Iconos/shoppingCart/apple-touch-icon.png" style="width: 24px; height: 24px;" alt=""> </button> </li>`
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

const agregarCarrito = (plato) =>{
    carrito.push(plato);
    subTotal += plato.precio;
    inputSubT.setAttribute('placeholder',`$${subTotal}`);
    console.log(carrito);
}

//Al realizar la orden el subtotal vuelve a 0
orderBtn.onclick = ()=>{
    console.log('Carrito Vaciado, Orden pedida, Subtotal restaurado a 0');
    inputSubT.setAttribute('placeholder',"$0");
    carrito = [];
    subTotal = 0;
}

orderBtn.addEventListener('click',(event)=>{
    inputSubT.setAttribute('placeholder',``);
})

const cargarPlatosCreate = async() => {
    let respuesta = await fetch('./Data/food.json');
    let platos = await respuesta.json();

    //Mapeo los platos y obtengo solamente las categorias de cada uno para su posterior filtrado
    let categorias = platos.map((plato) => plato.nombreCat)

    //Retorna las categorias donde su primer indice concuerda con el del elemento actual, evitando asi elementos repetidos, si Pescados con indice 14 se encuentra su primer valor al indice 3 no lo pasa
    categorias = categorias.filter((valor,indice) => {
        return categorias.indexOf(valor) === indice
    })  

    //Por cada categoria listada obtengo su div en el html y creo una lista ul
    categorias.forEach((cat) => {
        let divCat = document.getElementById(cat.toLowerCase());
        if(divCat != null){
            let listaCat = document.createElement('ul')

            //Por cada plato, comparo su categoria con la actual y si coincide le creo un item li en la lista ul
            platos.forEach((plato) =>{
                if(plato.nombreCat === cat){
                    let platoItem = document.createElement('li');           
                    let h4 = document.createElement('h4');
                    h4.textContent = plato.nombre;          
                    let button = document.createElement('button');
                    button.textContent = `$${plato.precio}`;
                    button.setAttribute('value',plato.idPlato); 
                    button.addEventListener('click',()=>{console.log(`boton cliqueado ${button.value}`);agregarCarrito (plato)})       
                    let shoppingCartImg = document.createElement('img');
                    shoppingCartImg.setAttribute('src',"./Iconos/shoppingCart/apple-touch-icon.png")
                    button.appendChild(shoppingCartImg);            
                    platoItem.appendChild(h4);
                    platoItem.appendChild(button);

                    listaCat.appendChild(platoItem);
                } 
            })
        divCat.appendChild(listaCat)
        }
    });

}

    const obtenerFoodFile = async() =>{
        //console.log(path.join(__dirname));
        //fs.readFile(path.join(__dirname))
    }
    cargarPlatosCreate()
    obtenerFoodFile()
}
