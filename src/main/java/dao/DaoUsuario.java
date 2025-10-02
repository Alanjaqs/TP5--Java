package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidad.Usuario;

public class DaoUsuario {

	// Datos conexion
		private String host = "jdbc:mysql://localhost:3306/";
		private String user = "root";
		private String pass = "root";
		private String dbName = "sistema_clientes";
		
	// Comprobar si existe usuario
	public boolean ValidarUsuario(Usuario usuario) {
		
		// IMPORTANTE
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		//
		
		boolean existe = false;
		Connection cn = null;
		
		try {
			cn = DriverManager.getConnection(host+dbName, user, pass);
			String query = "SELECT * FROM usuarios WHERE BINARY usuario=? AND BINARY contrasena=?";
			PreparedStatement pst = cn.prepareStatement(query);
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getContrasena());
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
	            existe = true;
	        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		
		return existe;
	}
}
