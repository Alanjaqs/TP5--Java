package negocioImpl;
import negocio.UsuarioNeg;
import datos.UsuarioDao;
import datosImpl.UsuarioDaoImpl;
import entidad.Usuario;

public class UsuarioNegImpl implements UsuarioNeg {
	
	private UsuarioDao daoUsuario = new UsuarioDaoImpl();
	
	@Override
	public boolean ValidarUsuario(Usuario usuario) {
		return daoUsuario.ValidarUsuario(usuario);
	}
}
