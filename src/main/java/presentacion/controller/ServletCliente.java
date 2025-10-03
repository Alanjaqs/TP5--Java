package presentacion.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datosImpl.ClienteDaoImpl;
import entidad.Cliente;
/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Logica para lista de clientes
		ClienteDaoImpl daoCliente = new ClienteDaoImpl();
		ArrayList<Cliente> listaClientes= daoCliente.ObtenerClientes();
		
		request.setAttribute("listaClientes", listaClientes);
		RequestDispatcher rd = request.getRequestDispatcher("ListadoClientes.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Logica para agregar clientes
		
		// Traigo todos los valores
		String dni = request.getParameter("txtDni");
		String cuil = request.getParameter("txtCuil");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		String sexo = request.getParameter("ddlSexo");
		String fechaStr = request.getParameter("txtFechaNacimiento");
		LocalDate fechaNacimiento = null;
		fechaNacimiento = LocalDate.parse(fechaStr);
		String direccion = request.getParameter("txtDireccion");
		String nacionalidad = request.getParameter("txtNacionalidad");
		String localidad = request.getParameter("txtLocalidad");
		String provincia = request.getParameter("txtProvincia");
		String correoElectronico = request.getParameter("txtCorreoElectronico");
		String telefono = request.getParameter("txtTelefono");
		
		// Creo objeto Cliente y DaoCliente
		ClienteDaoImpl daoCliente = new ClienteDaoImpl();
		Cliente cliente = new Cliente(dni, cuil, nombre, apellido, sexo, fechaNacimiento, direccion, nacionalidad, localidad, provincia, correoElectronico, telefono);
		int filas = daoCliente.AgregarCliente(cliente);
		
		if(filas == 1) {
			String mensaje = "El cliente fue agregado con exito";
			request.setAttribute("mensaje", mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("AltaCliente.jsp");
    		rd.forward(request, response);
		}
		else {
			String mensaje = "Hubo un problema, el cliente no pudo ser agregado";
			request.setAttribute("mensaje", mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("AltaCliente.jsp");
    		rd.forward(request, response);
		}
		
	}

}
