export class Plato{

    constructor(nombre,descripcion,precio,platoDia,categoria){
        this.nombre = nombre
        this.descripcion = descripcion
        this.precio = Number(precio)
        this.platoDia = platoDia
        this.categoria = categoria
    }

    getNombre(){
        return this.nombre;
    }

    setPlatoDia(status){
        this.platoDia = status;
    }

    presentacion() {
        let presentacionTxt = 'Soy el plato ' + this.getNombre() + ', pertenezco a la categoria ' + this.categoria +', me describo como: ' + this.descripcion + (this.platoDia ? ', soy el plato del dia' : ', no soy el plato del dia, esperame') + ' y mi precio es $' + this.precio;
        
        return presentacionTxt;
    }
}