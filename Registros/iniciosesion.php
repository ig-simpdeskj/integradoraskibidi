

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>

    <form action="autentcacion.php" method="post">        
        <div class="form-floating mb-3">
            <input type="input" class="form-control" id="floatingInput" name="Nombre">
            <label for="floatingInput">Email address</label>
        </div>
    
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" name="Contrasenia" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <div>
            <input type="submit"> 
        </div>
    </form>

      
</body>
</html> 