<?php
//Credencial de acceso. 
$DATABASE_HOST='localhost';
$DATABASE_USER='root';
$DATABASE_PASS='Luzoscura0531';
$DATABASE_NAME='Muunder'; //Nombre de la base de datos. 

//Conexion a la base de datos.

$conexion=mysqli_connect($DATABASE_HOST,$DATABASE_USER,$DATABASE_PASS,$DATABASE_NAME);
if(mysqli_connect_error()){
    //Error conexión. 
    exit('Fallo en la conexión MySQL: '.mysqli_connect_error());
} 

?>