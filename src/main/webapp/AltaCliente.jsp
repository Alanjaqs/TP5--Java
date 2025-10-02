<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Cliente</title>
<!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .nav-link.active {
    background-color: #0d47a1 !important; /* azul más oscuro */
    font-weight: bold;
  }
</style>
</head>
<body class="bg-body-tertiary">

<div class="d-flex">
  <!-- MENU SIDEBAR -->
  <aside class="d-flex flex-column flex-shrink-0 p-3 text-white bg-primary"
         style="width:240px; min-height:100vh; position:sticky; top:0;">
    <span class="fs-5 fw-semibold mb-3">Menú</span>
    <hr class="border-light">
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a class="nav-link active text-white" href="AltaCliente.jsp">Alta de Cliente</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="ServletCliente">Listado de Clientes</a>
      </li>
    </ul>
  </aside>
  
  <%
		// Obtener mensaje en caso de exito/error
		String mensaje = "";
		if (request.getAttribute("mensaje") != null){
			mensaje = (String)request.getAttribute("mensaje");
		}
  %>

  <!-- CONTENIDO -->
  <main class="flex-grow-1 p-4">
    <h2 class="mb-4">Formulario de Cliente</h2>
    
    <!-- Label Usuario -->
    <div class="mb-4">
    	<label class="fw-bold" style="color: green;">Usuario: <%= session.getAttribute("nombreUsuario") %></label>
    </div>

    <div class="card shadow-sm">
      <div class="card-body">
        <form action="ServletCliente" method="post">
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">DNI *</label>
              <input type="text" class="form-control" placeholder="Ingrese su DNI" name="txtDni" pattern="^\d{6,8}$" title="El DNI debe tener entre 6 y 8 dígitos numéricos" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">CUIL *</label>
              <input type="text" class="form-control" placeholder="Ingrese su CUIL" name="txtCuil" pattern="^\d{11}$" title="El CUIL debe tener 11 dígitos numéricos" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Nombre *</label>
              <input type="text" class="form-control" placeholder="Ingrese su nombre" name="txtNombre" pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" title="Solo se permiten letras" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Apellido *</label>
              <input type="text" class="form-control" placeholder="Ingrese su apellido" name="txtApellido" pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" title="Solo se permiten letras" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Sexo *</label>
              <Select class="form-control" name="ddlSexo" required>
              		<option value="" selected disabled>-- Seleccione --</option>
              		<option value="M">M</option>
              		<option value="F">F</option>
              		<option value="Otro">Otro</option>
              </Select>
            </div>
            <div class="col-md-6">
              <label class="form-label">Nacionalidad *</label>
              <input type="text" class="form-control" placeholder="Ingrese su nacionalidad" name="txtNacionalidad" pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" title="Solo se permiten letras" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Fecha de nacimiento *</label>
              <input type="date" class="form-control" placeholder="Ingrese su fecha de nacimiento" name="txtFechaNacimiento" max="<%= java.time.LocalDate.now() %>" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Dirección *</label>
              <input type="text" class="form-control" placeholder="Ingrese su dirección" name="txtDireccion" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Localidad *</label>
              <input type="text" class="form-control" placeholder="Ingrese su localidad" name="txtLocalidad" pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" title="Solo se permiten letras" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Provincia *</label>
              <input type="text" class="form-control" placeholder="Ingrese su provincia" name="txtProvincia" pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" title="Solo se permiten letras" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Correo electronico *</label>
              <input type="email" class="form-control" placeholder="Ingrese su correo electrónico" name="txtCorreoElectronico" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Telefono *</label>
              <input type="text" class="form-control" placeholder="Ingrese su telefono" name="txtTelefono" pattern="^\d{10}$" title="El telefono debe tener 10 dígitos numéricos" required>
            </div>
            <!-- agregás los demás campos -->
          </div>
          <div class="mt-3">
            <button class="btn btn-primary">Guardar cliente</button>
          </div>
          
          <div class="mb-4">
          	<label style="color: green;"> <%= mensaje %></label>
          </div>
          
        </form>
      </div>
    </div>
  </main>
</div>

</body>
</html>