package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import entidad.Cliente;

public class DaoCliente {
	
	// Datos conexion
	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "root";
	private String dbName = "sistema_clientes";
	
	// Metodos
	
	// Listar
	public ArrayList<Cliente> ObtenerClientes(){
		
		// IMPORTANTE
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		//
		
		ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();
		Connection cn = null;
			
		try {
			cn = DriverManager.getConnection(host+dbName, user, pass);
			Statement st = cn.createStatement();
			String query = "SELECT * FROM clientes";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setIdCliente(rs.getInt("id_cliente"));
				cliente.setDni(rs.getString("dni"));
				cliente.setCuil(rs.getString("cuil"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setSexo(rs.getString("sexo"));
				cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
			    cliente.setDireccion(rs.getString("direccion"));
			    cliente.setNacionalidad(rs.getString("nacionalidad"));
			    cliente.setLocalidad(rs.getString("localidad"));
			    cliente.setProvincia(rs.getString("provincia"));
			    cliente.setCorreoElectronico(rs.getString("correo_electronico"));
			    cliente.setTelefono(rs.getString("telefono"));
			    
			    listaClientes.add(cliente);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			return listaClientes;
		
	}
	
	// Agregar
	public int AgregarCliente(Cliente cliente) {
		
		// IMPORTANTE
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		//
		
		Connection cn = null;
		int filas = 0;
		
		try {
			cn = DriverManager.getConnection(host+dbName, user, pass);
			String query = "INSERT INTO clientes (dni, cuil, nombre, apellido, sexo, fecha_nacimiento, direccion, nacionalidad, localidad, provincia, correo_electronico, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = cn.prepareStatement(query);
			pst.setString(1, cliente.getDni());
	        pst.setString(2, cliente.getCuil());
	        pst.setString(3, cliente.getNombre());
	        pst.setString(4, cliente.getApellido());
	        pst.setString(5, cliente.getSexo());
	        LocalDate fn = cliente.getFechaNacimiento();
	        pst.setDate(6, java.sql.Date.valueOf(fn)); 
	        pst.setString(7, cliente.getDireccion());
	        pst.setString(8, cliente.getNacionalidad());
	        pst.setString(9, cliente.getLocalidad());
	        pst.setString(10, cliente.getProvincia());
	        pst.setString(11, cliente.getCorreoElectronico());
	        pst.setString(12, cliente.getTelefono());
			filas = pst.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return filas;
	}
}
