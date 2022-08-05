<?php
function conectar(){
    $host="localhost";
    $user="root";
    $pass="";

    $bd="alumnos";

    $con=mysqli_connect($host,$user,$pass);

    return $con;
}
?>