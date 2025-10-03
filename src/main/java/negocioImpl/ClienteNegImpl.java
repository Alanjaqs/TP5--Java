package negocioImpl;

import java.util.ArrayList;
import entidad.Cliente;
import negocio.ClienteNeg;
import datos.ClienteDao;
import datosImpl.ClienteDaoImpl;

public class ClienteNegImpl implements ClienteNeg {
	
	private ClienteDao daoCliente = new ClienteDaoImpl();
	
	@Override
	public ArrayList<Cliente> ObtenerClientes(){
		return daoCliente.ObtenerClientes();
	}
	
	@Override
	public int AgregarCliente(Cliente cliente) {
		return daoCliente.AgregarCliente(cliente);
	}
}
