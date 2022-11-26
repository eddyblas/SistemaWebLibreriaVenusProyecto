using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IMenuS
    {
        Task<List<Menu>> ObtenerMenus(int idUsuario);
    }
}
