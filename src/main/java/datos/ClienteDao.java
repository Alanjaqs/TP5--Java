package datos;
import java.util.ArrayList;
import entidad.Cliente;

public interface ClienteDao {
	
	public ArrayList<Cliente> ObtenerClientes();
	public int AgregarCliente(Cliente cliente);
	
}
