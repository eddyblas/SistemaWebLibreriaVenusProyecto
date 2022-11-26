using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface ICategoriaS
    {
        Task<List<CategoriaBookstore>> Lista();
        Task<CategoriaBookstore> Crear(CategoriaBookstore entidad);
        Task<CategoriaBookstore> Editar(CategoriaBookstore entidad);
        Task<bool> Eliminar(int idCategoria);
    }
}
