<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Con Mi Carta</title>

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.green.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">

    <link href="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.css" rel="stylesheet">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <script src="js/bootstrap-table.min.js"></script>

</head>

<body>

<div class="page-holder w-100 d-flex justify-content-center">
    <div class="row d-flex justify-content-center align-self-center">
        <div class="container">
            <div class="card" style="width: 30rem">
                <div class="card-body">
                    <h5 class="card-title">Iniciar Sessión</h5>
                    <form method="post" action="ingresar">
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" name="usuario"  aria-describedby="emailHelp" placeholder="ingrese usuario">
                            <!--small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small-->
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="ingrese contraseña">
                        </div>
                        <button type="submit" class="float-right btn btn-primary">Ingresar</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<!--script src="js/charts-home.js"></script-->
<script src="js/front.js"></script>
<script src="js/utils.js"></script>
<!-- Latest compiled and minified JavaScript -->


</body>

</html>