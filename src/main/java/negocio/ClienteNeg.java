package negocio;

import java.util.ArrayList;
import entidad.Cliente;

public interface ClienteNeg {
	public ArrayList<Cliente> ObtenerClientes();
	public int AgregarCliente(Cliente cliente);
}
