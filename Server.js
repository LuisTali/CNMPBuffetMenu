//Node.js
const express = require('express');
const path = require('path');

const app = express();

//app.use(express.static('./index.html'))
//app.use(express.static(path.resolve('./style.css')))
app.use(express.static(path.resolve(__dirname,'./Styles')));
//Chequear como hacer andar y que carguen los recursos de estilos

app.get('/',(req,res)=>{
    res.sendFile(path.resolve('./index.html'))
})

app.listen(5000,(req,res)=>{
    console.log(path.resolve(__dirname, './Styles'));
    console.log('Server is listening in port 5000');
})