<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entidad.Cliente" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado Clientes</title>
<!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
<!-- Para usar Datatable -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function () {
    $('#table_id').DataTable({
      "language": {
        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      }
    });
  });
</script>
  
  <!-- Hover azul oscuro en sidebar -->
  <style>
  .nav-link.active {
    background-color: #0d47a1 !important;
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
     	<a class="nav-link text-white" href="AltaCliente.jsp">Alta de Cliente</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active text-white" href="ServletCliente">Listado de Clientes</a>
      </li>
    </ul>
  </aside>
  
  <%
  	// Cargo la lista de clientes
  	ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();
  	if(request.getAttribute("listaClientes") != null){
  		listaClientes = (ArrayList<Cliente>)request.getAttribute("listaClientes");
  	}
  %>

  <!-- CONTENIDO -->
  <main class="flex-grow-1 p-4">
    <h2 class="mb-4">Formulario de Cliente</h2>
    
    <!-- Label Usuario -->
    <div class="mb-4">
    	<label class="fw-bold" style="color: green;">Usuario: <%= session.getAttribute("nombreUsuario") %></label>
    </div>
    
    <!-- Listado clientes (cantidad)  -->
    <div class="mb-4">
    	<h4>Listado de Clientes <%= "(" + listaClientes.size() + ")" %></h4>
    </div>

    <div class="card shadow-sm">
      <div class="card-body">
        <div class="table-responsive">
          <!--  TABLA CLIENTES -->
          <table id="table_id" class="table table-hover align-middle">
            <thead>
              <tr>
                <th>DNI</th>
                <th>CUIL</th>
                <th>Nombre y Apellido</th>
                <th>Sexo</th>
                <th>Fecha de Nacimento</th>
                <th>Dirección</th>
                <th>Nacionalidad</th>
                <th>Localidad</th>
                <th>Provincia</th>
                <th>Correo Electrónico</th>
                <th>Telefono</th>
              </tr>
            </thead>
            <tbody>
            <%
            	if(listaClientes != null){
            		for(Cliente cliente : listaClientes){
            %>
            
              <tr>
                <td><%= cliente.getDni() %></td>
                <td><%= cliente.getCuil() %></td>
                <td><%= cliente.getNombre() + " " + cliente.getApellido() %></td>
                <td><%= cliente.getSexo() %></td>
				<td><%= cliente.getFechaNacimiento() %></td>
				<td><%= cliente.getDireccion() %></td>
				<td><%= cliente.getNacionalidad() %></td>
				<td><%= cliente.getLocalidad() %></td>
				<td><%= cliente.getProvincia() %></td>
				<td><%= cliente.getCorreoElectronico() %></td>
				<td><%= cliente.getTelefono() %></td>
              </tr>
           <%
            		}
            	}
           %>
           </tbody>
          </table>
        </div>
      </div>
    </div>
  </main>
</div>

<!--  -->

</body>
</html>