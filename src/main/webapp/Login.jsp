<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in</title>

  <!-- Bootstrap 5 (CDN) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <style>
    /* Pequeños ajustes para que se parezca más */
    body { background-color: #f5f7fb; }                 
    .login-card { max-width: 420px; border: 0; }        
    .login-card .card-body { padding: 2rem 2rem; }      
    .btn-primary { background-color: #2f6bff; border-color: #2f6bff; }
    .btn-primary:hover { filter: brightness(.95); }
  </style>
</head>

<body class="bg-body-tertiary">

	<%
		// Obtener mensaje en caso de error
		String mensaje = "";
		if (request.getAttribute("mensaje") != null){
			mensaje = (String)request.getAttribute("mensaje");
		}
	%>

  <!-- Contenedor a pantalla completa, centrado -->
  <div class="min-vh-100 d-flex align-items-center justify-content-center py-5">
    <div class="card login-card shadow-lg rounded-4">
      <div class="card-body">
        <h5 class="mb-4 fw-semibold">Iniciar sesión</h5>

        <!--  Campos Usuario y Contrasena -->
        <form action="ServletUsuario" method="post">
          <div class="mb-3">
            <label for="usuario" class="form-label small mb-1">Usuario</label>
            <input type="text" class="form-control" id="usuario" placeholder="Ingrese su usuario" name="usuario" onkeydown="return event.key !== ' ';" required>
          </div>

          <div class="mb-4">
            <label for="contrasena" class="form-label small mb-1">Contraseña</label>
            <input type="password" class="form-control" id="contrasena" placeholder="Ingrese su contraseña" name="contrasena" onkeydown="return event.key !== ' ';" required>
          </div>

          <button type="submit" name="btnIngresar" class="btn btn-primary w-100 py-2">Ingresar</button>
          
          <div class="mb-4">
          	<label style="color: red;"> <%= mensaje %></label>
          </div>
   
        </form>
        
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</body>
</html>