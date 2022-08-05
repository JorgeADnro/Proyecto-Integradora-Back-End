var express = require('express');
const bodyParser = require('body-parser')
var mysql = require('mysql');
var cors = require('cors');


var app = express();

app.use(express.json());
app.use(cors());

var conexion = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'1234',
    database: 'didactic'
});

conexion.connect(function(err){
    if(err){
        throw err;
    }else{
        console.log('Conexión exitosa')
    }
});

app.get('/', function(req,res){
    res.send('Ruta inicio');
});

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Personas
//Mostrar todas las personas
app.get('/personas', (req,res) =>{
    conexion.query('SELECT * FROM personas', (err,filas)=>{
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//Mostrar una de las personas
app.get('/personas/:cvePersona', (req,res) =>{
    conexion.query('SELECT * FROM personas WHERE cvePersona = ?',[req.params.cvePersona], (err,fila)=>{
        if(err){
            throw err;
        }else{
            res.send(fila);
            //res.send(fila[0].nombre);
        }
    });
});

//Insertar personas
app.post('/personas', (req,res) => {
    let data = {cvePersona:req.body.cvePersona,nombre:req.body.nombre,apellidoPat:req.body.apellidoPat,apellidoMat:req.body.apellidoMat,email:req.body.email,facebook:req.body.facebook,fechaNacimiento:req.body.fechaNacimiento,usuario:req.body.usuario,tipoPersona:req.body.tipoPersona,cveAreaAcademica:req.body.cveAreaAcademica};
    let sql = "INSERT INTO personas SET ?";
    conexion.query(sql,data,function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    }); 
});

//Editar personas
app.put('/personas/:cvePersona', (req,res) => {
    let cvePersona = req.params.cvePersona;
    let nombre = req.body.nombre;
    let apellidoPat = req.body.apellidoPat;
    let apellidoMat = req.body.apellidoMat;
    let email = req.body.email;
    let facebook = req.body.facebook;
    let fechaNacimiento = req.body.fechaNacimiento;
    let usuario = req.body.usuario;
    let tipoPersona = req.body.tipoPersona;
    let cveAreaAcademica = req.body.cveAreaAcademica;

    let sql = "UPDATE personas SET nombre = ?,apellidoPat = ?,apellidoMat = ?,email = ?,facebook = ?,fechaNacimiento = ?,usuario = ?,tipoPersona = ?,cveAreaAcademica = ? WHERE cvePersona = ?";
    conexion.query(sql,[nombre,apellidoPat,apellidoMat,email,facebook,fechaNacimiento,usuario,tipoPersona,cveAreaAcademica,cvePersona], function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    });
}); 

//eliminar personas
app.delete('/personas/:cvePersona', (req,res) => {
    conexion.query("DELETE FROM personas WHERE cvePersona = ?", [req.params.cvePersona], function(err,filas){
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});


app.listen('3000',function(){
    console.log('Server on port 3000')
});


/*
<td><img src="../../../assets/pics/logotipoUTNG.png" alt="logotipoUTNG" width="70px" lang="80px"></td>
              <td>Ingresar nombre del curso</td>
              <td>Ingresar nombre del docente</td>
              <td><a href="../ver-temas"><img src="../../../assets/pics/lupa.png" alt="Lupa" width="55px" height="35px"></a></td>
              <td><button id="button2">Matricularme</button></td>
*/

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Cursos
//Mostrar todos los cursos
app.get('/curso', (req,res) =>{
    conexion.query('SELECT * FROM curso', (err,filas)=>{
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//Mostrar uno de los cursos
app.get('/curso/:cveCurso', (req,res) =>{
    conexion.query('SELECT * FROM curso WHERE cveCurso = ?',[req.params.cveCurso], (err,fila)=>{
        if(err){
            throw err;
        }else{
            res.send(fila);
            //res.send(fila[0].nombre);
        }
    });
});

//Insertar curso
app.post('/curso', (req,res) => {
    let data = {cveCurso:req.body.cveCurso,cvePersona:req.body.cvePersona,nombre:req.body.nombre,descripcion:req.body.descripcion,numHoras:req.body.numHoras,activo:req.body.activo,estatus:req.body.estatus,fechaCreado:req.body.fechaCreado,fechaRevision:req.body.fechaRevision,comentarios:req.body.comentarios,tipoCurso:req.body.tipoCurso};
    let sql = "INSERT INTO curso SET ?";
    conexion.query(sql,data,function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    }); 
});

//Editar curso
app.put('/curso/:cveCurso', (req,res) => {
    let cveCurso = req.params.cveCurso;
    let cvePersona = req.body.cvePersona;
    let nombre = req.body.nombre;
    let descripcion = req.body.descripcion;
    let numHoras = req.body.numHoras;
    let activo = req.body.activo;
    let estatus = req.body.estatus;
    let fechaCreado = req.body.fechaCreado;
    let fechaRevision = req.body.fechaRevision;
    let comentarios = req.body.comentarios;
    let tipoCurso = req.body.tipoCurso;

    let sql = "UPDATE curso SET cvePersona = ?,nombre = ?,descripcion = ?,numHoras = ?,activo = ?,estatus = ?,fechaCreado = ?,fechaRevision = ?,comentarios = ?,tipoCurso = ? WHERE cveCurso = ?";
    conexion.query(sql,[cvePersona,nombre,descripcion,numHoras,activo,estatus,fechaCreado,fechaRevision,comentarios,tipoCurso,cveCurso], function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    });
}); 

//eliminar curso
app.delete('/curso/:cveCurso', (req,res) => {
    conexion.query("DELETE FROM curso WHERE cveCurso = ?", [req.params.cveCurso], function(err,filas){
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Alumno curso
app.get('/alumno_curso', (req,res) =>{
    conexion.query('SELECT * FROM alumno_curso', (err,filas)=>{
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//Mostrar uno de los cursos
app.get('/alumno_curso/:cveAlumnoCurso', (req,res) =>{
    conexion.query('SELECT * FROM alumno_curso WHERE cveAlumnoCurso = ?',[req.params.cveAlumnoCurso], (err,fila)=>{
        if(err){
            throw err;
        }else{
            res.send(fila);
            //res.send(fila[0].nombre);
        }
    });
});

//Insertar Alumno curso
app.post('/alumno_curso', (req,res) => {
    let data = {cveAlumnoCurso:req.body.cveAlumnoCurso,cveCurso:req.body.cveCurso,cvePersona:req.body.cvePersona,estatus:req.body.estatus,calificacionCurso:req.body.calificacionCurso,comentarioCurso:req.body.comentarioCurso,calificacionPlataforma:req.body.calificacionPlataforma,comentarioPlataforma:req.body.comentarioPlataforma};
    let sql = "INSERT INTO alumno_curso SET ?";
    conexion.query(sql,data,function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    }); 
});

//Editar Alumno curso
app.put('/alumno_curso/:cveAlumnoCurso', (req,res) => {
    let cveAlumnoCurso = req.params.cveAlumnoCurso;
    let cveCurso = req.body.cveCurso;
    let cvePersona = req.body.cvePersona;
    let estatus = req.body.estatus;
    let calificacionCurso = req.body.calificacionCurso;
    let comentarioCurso = req.body.comentarioCurso;
    let calificacionPlataforma = req.body.calificacionPlataforma;
    let comentarioPlataforma = req.body.comentarioPlataforma;

    let sql = "UPDATE alumno_curso SET cveCurso = ?,cvePersona = ?,estatus = ?,calificacionCurso = ?,comentarioCurso = ?,calificacionPlataforma = ?,comentarioPlataforma = ? WHERE cveAlumnoCurso = ?";
    conexion.query(sql,[cveCurso,cvePersona,estatus,calificacionCurso,comentarioCurso,calificacionPlataforma,comentarioPlataforma,cveAlumnoCurso], function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    });
}); 

//eliminar Alumno curso
app.delete('/alumno_curso/:cveAlumnoCurso', (req,res) => {
    conexion.query("DELETE FROM alumno_curso WHERE cveAlumnoCurso = ?", [req.params.cveAlumnoCurso], function(err,filas){
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Area Conocimiento
app.get('/area_conocimiento', (req,res) =>{
    conexion.query('SELECT * FROM area_conocimiento', (err,filas)=>{
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//Mostrar uno de los cursos
app.get('/area_conocimiento/:cveArea', (req,res) =>{
    conexion.query('SELECT * FROM area_conocimiento WHERE cveArea = ?',[req.params.cveArea], (err,fila)=>{
        if(err){
            throw err;
        }else{
            res.send(fila);
            //res.send(fila[0].nombre);
        }
    });
});

//Insertar Alumno curso
app.post('/area_conocimiento', (req,res) => {
    let data = {cveArea:req.body.cveArea,descripcion:req.body.descripcion,activo:req.body.activo};
    let sql = "INSERT INTO area_conocimiento SET ?";
    conexion.query(sql,data,function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    }); 
});

//Editar Alumno curso
app.put('/area_conocimiento/:cveArea', (req,res) => {
    let cveArea = req.params.cveArea;
    let descripcion = req.body.descripcion;
    let activo = req.body.activo;
    
    let sql = "UPDATE area_conocimiento SET descripcion = ?,activo = ? WHERE cveArea = ?";
    conexion.query(sql,[descripcion,activo,cveArea], function(err,results){
        if(err){
            throw err;
        }else{
            res.send(results);
        }
    });
}); 

//eliminar Alumno curso
app.delete('/area_conocimiento/:cveArea', (req,res) => {
    conexion.query("DELETE FROM area_conocimiento WHERE cveArea = ?", [req.params.cveArea], function(err,filas){
        if(err){
            throw err;
        }else{
            res.send(filas);
        }
    });
});

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------