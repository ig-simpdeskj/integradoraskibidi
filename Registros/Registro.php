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
    echo "nmms, pendeja ¿Como no puedes?";
} 

$_request_method = $_SERVER['REQUEST_METHOD'];

/*switch($_request_method){
    case 'Get'://Consultar
        echo'<h1>Peticion Get</h1>';
        break;
    case 'POST'://Guardar
        echo'<h1>Peticion Post</h1>';
        $nombre = $_POST['nombre'];
        $apaterno = $_POST['Apellido_Paterno'];
        $amaterno = $_POST['Apellido_Materno'];
        $fecha_nacimiento = $_POST['fecnacimiento'];
        $correo = $_POST['Mail'];
        $telefono = $_POST['telefono'];
        $contrasena = $_POST['contrasenia'];
        $ubicacion = $_POST['ubi'];

        $sql = "insert into registro_usario (nombres, apellido_pat, apellido_mat, Fecha_nacimiento, correo, telefono, ubicacion, contrasena)
                values ('$nombre', '$apaterno', '$amaterno', '$fecha_nacimiento', '$correo', '$telefono', '$ubicacion', '$contrasena'),";
        $resultado = $conexion -> query($sql);
        
        if(!$resultado){
            die("Error en la transacción: " . $conexion->error);
        }
        break;
        default:
            echo ("Bienvenido a Muunder");
        
        echo $nombre " ";
        echo $apaterno;
        echo $amaterno;
        echo $fecha_nacimiento;
        echo $correo;
        echo $telefono;
        echo $contrasena;
        echo $ubicacion;
    }
            */
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Registro</title>
    <script src="https://kit.fontawesome.com/5a1c57d7ef.js" crossorigin="anonymous"></script>

    <style>
        body {
                flex-direction: row;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
    
            main {
                display: flex;
                flex-direction: row;
                flex: 1;
                margin: 10px;
            }
    
            .Barra{
                width: 35%;
            }
    
            .Navegacion{
                display: flex;
            }
            
            li{
                list-style-type: None;
            }

            .barrita{
                width: 30%;
            }


        form{
            width: 1000px;
            background-color: blue;
        }

        .Fila{
            width: 750px;
            background-color: beige;
            padding: 20px;
            display: flex;
        }
    </style>
</head>
<body>

<body>
    <header>
        <ul class="Navegacion">
            <li><a href="Inicio.html"><img src="../Inicio/Vaca.jpg" width="20 px"></a></li>
            <li><input type="search" placeholder="Buscar..."></li>
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
            <li> <a href="Ganado.html"> Ganado </a></li>
            <li> <a href="Perfil.html"> Perfil </a></li>
        </ul>
    </header>
    
    <main>
        <section>
            <form action="Registro.php" method="POST">
                <h3> Registro.  </h3>
                <div class="Cuadro_registro">
                    <div class="Fila">
                        <div> 
                            <label for="Nombre">Nombres: 
                            <br>
                            <input type="text" placeholder="Nombre" id="Nombre" name="nombre">
                        </div>
                        <div>
                            <label for="Apellido_Paterno">Apellido Paterno: 
                            <br>
                            <input type="text" placeholder="Apellido Paterno" id="Apellido_Paterno" name="Apellido_Paterno">
                        </div>
                    </div>

                    <div class="Fila">
                        <div> 
                            <label for="Apellido_Materno">Apellido Materno: 
                            <br>
                            <input type="text" placeholder="Apellido Materno" id="Apellido_Materno" name="Apellido_Materno">
                        </div>
                        <div> 
                            <label for="fecnacimiento"> Fecha de nacimiento: 
                            <br>
                            <input type="date" placeholder="Fecha de nacimiento" id="fecnacimiento" name="fecnacimiento">
                            <?php
                                // Establece el límite de edad
                                $edad_minima = 18;

                                // Verifica si el formulario fue enviado y si se recibió la fecha de nacimiento
                                if (isset($_POST['  '])) {
                                    // Obtiene la fecha de nacimiento ingresada
                                    $fecha_nacimiento = $_POST['fecnacimiento'];
                                    
                                    // Convierte la fecha de nacimiento a un objeto DateTime
                                    $fecha_nacimiento_obj = new DateTime($fecha_nacimiento);
                                    // Obtiene la fecha actual
                                    $fecha_actual = new DateTime();

                                    // Calcula la diferencia en años entre la fecha actual y la fecha de nacimiento
                                    $edad = $fecha_actual->diff($fecha_nacimiento_obj)->y;

                                    // Verifica si la edad es mayor o igual a 18 años
                                    if ($edad >= $edad_minima) {
                                        echo "Registro exitoso. Tienes $edad años.";
                                        // Aquí podrías proceder con el registro en la base de datos o cualquier otra acción
                                    } else {
                                        echo "Debes tener al menos $edad_minima años para registrarte. Tu edad es $edad años.";
                                    }
                                } else {
                                    echo "Por favor, selecciona tu fecha de nacimiento.";
                                }
                            ?>
                        </div>
                    </div>

                    <div class="Fila">
                        <div> 
                            <label for="Mail">Correo electronico: 
                            <br>
                            <input type="email" placeholder="Correo" id="Mail" name="Mail">
                        </div>
                        <div> 
                            <label for="telefono">Telefono: 
                            <br>
                            <input type="text" placeholder="Numero de celular" id="telefono" name="telefono">
                        </div>
                    </div>

                    <div class="Fila">
                        <div> 
                            <label for="ubicacion">Ubicación: 
                            <br>
                            <select name="ubi" id="estado">
                                <option value="">Seleccione un estado</option>
                                <option value="Aguascalientes">Aguascalientes</option>
                                <option value="Baja California">Baja California</option>
                                <option value="Baja California Sur">Baja California Sur</option>
                                <option value="Campeche">Campeche</option>
                                <option value="Chiapas">Chiapas</option>
                                <option value="Chihuahua">Chihuahua</option>
                                <option value="Ciudad de México">Ciudad de México</option>
                                <option value="Coahuila">Coahuila</option>
                                <option value="Colima">Colima</option>
                                <option value="Durango">Durango</option>
                                <option value="Estado de México">Estado de México</option>
                                <option value="Guanajuato">Guanajuato</option>
                                <option value="Guerrero">Guerrero</option>
                                <option value="Hidalgo">Hidalgo</option>
                                <option value="Jalisco">Jalisco</option>
                                <option value="Michoacán">Michoacán</option>
                                <option value="Morelos">Morelos</option>
                                <option value="Nayarit">Nayarit</option>
                                <option value="Nuevo León">Nuevo León</option>
                                <option value="Oaxaca">Oaxaca</option>
                                <option value="Puebla">Puebla</option>
                                <option value="Querétaro">Querétaro</option>
                                <option value="Quintana Roo">Quintana Roo</option>
                                <option value="San Luis Potosí">San Luis Potosí</option>
                                <option value="Sinaloa">Sinaloa</option>
                                <option value="Sonora">Sonora</option>
                                <option value="Tabasco">Tabasco</option>
                                <option value="Tamaulipas">Tamaulipas</option>
                                <option value="Tlaxcala">Tlaxcala</option>
                                <option value="Veracruz">Veracruz</option>
                                <option value="Yucatán">Yucatán</option>
                                <option value="Zacatecas">Zacatecas</option>
                            </select>



                            <input type="password" placeholder="Estado" id="ubicacion" name="ubi">
                        </div>
                    </div>

                    <div class="Fila">
                        <div> 
                            <label for="contraseña">Contraseña: 
                            <br>
                            <input type="password" placeholder="Contraseña" name="contrasenia">
                        </div>
                    </div>

                    <div class="Fila">
                        <div>
                            <label for="contraseña">Confirmar contraseña: 
                            <br>
                            <input type="password" placeholder="Contraseña" id="contrasenia" name="contrasenia">
                        </div>
                    </div>

                    
                </div>
                <input type="submit" value="Registrar">
            </form>
        </section>
    </body>
</html> 