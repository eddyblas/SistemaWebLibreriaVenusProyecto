using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IProductoS
    {
        Task<List<ProductoBookstore>> Lista();
        Task<ProductoBookstore> Crear(ProductoBookstore entidad, Stream imagen = null, string NombreImagen = "");
        Task<ProductoBookstore> Editar(ProductoBookstore entidad, Stream imagen = null, string NombreImagen = "");
        Task<bool> Eliminar(int idProducto);
    }
}
