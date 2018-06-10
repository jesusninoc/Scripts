```JavaScript
// Para realizar el siguiente código se ha utilizado el enlace: https://codeburst.io/build-a-weather-website-in-30-minutes-with-node-js-express-openweather-a317f904897b

// Importante, instalar:
// EJS (Embedded JavaScript)
// npm install ejs --save

// Express
// npm install --save express
const express = require('express');

// Body-parser
// npm install body-parser --save
const bodyParser = require('body-parser');

// Node-powershell
// npm i -S node-powershell
const shell = require('node-powershell');
const app = express();

// Cargar el CSS y el fichero EJS
/*
|-- process
   |-- views
      |-- index.ejs
   |-- public
      |-- css
         |-- style.css
   |-- package.json
   |-- index.js
*/

app.use(express.static('public'));
app.set('view engine', 'ejs')

// Cargar el fichero index.ejs, que contiene el siguiente código
/*
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Test</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    
  </head>
  <body>
    <div class="container">
      <fieldset>
        <form action="/" method="post">
          <input name="process" type="text" class="ghost-input" placeholder="Enter a Process" required>
          <input type="submit" class="ghost-button" value="Show process">
        </form>
      </fieldset>
    </div>
  </body>
</html>
*/

// Aceptar respuestas
app.use(bodyParser.urlencoded({ extended: true }));

// Mostrar la web con petición GET
app.get('/', function (req, res) {
  res.render('index');
})

// Código que se va a añadir en la respuesta para seguir pidiendo procesos
let codigo = '<!DOCTYPE html><html>  <head>    <meta charset="utf-8">    <title>Test</title>    <link rel="stylesheet" type="text/css" href="/css/style.css">      </head>  <body>    <div class="container">      <fieldset>        <form action="/" method="post">          <input name="process" type="text" class="ghost-input" placeholder="Enter a Process" required>          <input type="submit" class="ghost-button" value="Show process">        </form>      </fieldset>    </div>  </body></html>';

// Preparar la petición a PowerShell
let ps = new shell({
  executionPolicy: 'Bypass',
  noProfile: true
});

// Mostrar la petición POST y devolver la ejecución del comando sobre el que se quiere obtener información
app.post('/', function (req, res) {
  ps.addCommand('Get-Process -name ' + req.body.process + ' | ConvertTo-Html -Property Name, Path, Company')
  ps.invoke()
  .then(output => {
    res.send(codigo+output);
})
.catch(err => {
  console.log(err);
  ps.dispose();
}); 
})

// Dejar el servidor en el puerto 3000
app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})```
```XHTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Test</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    
  </head>
  <body>
    <div class="container">
      <fieldset>
        <form action="/" method="post">
          <input name="process" type="text" class="ghost-input" placeholder="Enter a Process" required>
          <input type="submit" class="ghost-button" value="Show process">
        </form>
      </fieldset>
    </div>
  </body>
</html>```
```CSS
/*
  Styles from this codepen:
  https://codepen.io/official_naveen/pen/rgknI
*/

body {
  width: 800px;
  margin: 0 auto;
  font-family: 'Open Sans', sans-serif;
}
.container {
  width: 600px;
  margin: 0 auto;
}
fieldset {
  display: block;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;
  -webkit-padding-before: 0em;
  -webkit-padding-start: 0em;
  -webkit-padding-end: 0em;
  -webkit-padding-after: 0em;
  border: 0px;
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  min-width: -webkit-min-content;
  padding: 30px;
}
.ghost-input, p {
  display: block;
  font-weight:300;
  width: 100%;
  font-size: 25px;
  border:0px;
  outline: none;
  width: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  color: #4b545f;
  background: #fff;
  font-family: Open Sans,Verdana;
  padding: 10px 15px;
  margin: 30px 0px;
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition: all 0.1s ease-in-out;
  -ms-transition: all 0.1s ease-in-out;
  -o-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
.ghost-input:focus {
  border-bottom:1px solid #ddd;
}
.ghost-button {
  background-color: transparent;
  border:2px solid #ddd;
  padding:10px 30px;
  width: 100%;
  min-width: 350px;
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition: all 0.1s ease-in-out;
  -ms-transition: all 0.1s ease-in-out;
  -o-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
.ghost-button:hover {
  border:2px solid #515151;
}
p {
  color: #E64A19;
}```
