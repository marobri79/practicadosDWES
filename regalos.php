<?php
$usuario = "root";
$password = "";
$servidor = "localhost";
$basededatos = "practica2";


// creación de la conexión a la base de datos con mysql_connect()
$conexion = mysqli_connect( $servidor, $usuario, "" ) or die ("No se ha podido conectar al servidor de Base de datos");
    
// Selección del a base de datos a utilizar
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

// establecer y realizar consulta. guardamos en variable.
$consulta = "SELECT * FROM `juguetes`";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");
$var=0;
?>

<!DOCTYPE html>
<html>
<body>

<head>
  <h1> Datos de los reglaos  </h1> 
<table width="90%" border="1px" align="center">
    <tr align="center">
    
    <td>Nombre de los Juguetes</td>
    <td>Precio de los Juguetes</td>
   
    </tr>
  
    <?php 
    while ($columna = mysqli_fetch_array( $resultado )){
        ?>
            <tr>
            <td><?php echo $columna['nombre_juguetes'] ?></td><td><?php echo $columna['precio_juguetes'] ?><td><?php echo $total?>
            </tr>
            <?php   
        }

     ?>
    </table>



</body>

</html>