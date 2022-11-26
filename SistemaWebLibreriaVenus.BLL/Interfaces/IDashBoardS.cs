using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IDashBoardS
    {
        Task<int> TotalVentasUltimaSemana();
        Task<string> TotalIngresoUltimaSemana();
        Task<int> TotalProductos();
        Task<int> TotalCategorias();
        Task<Dictionary<string, int>> VentasUltimasSemana();
        Task<Dictionary<string, int>> ProductosTopUltimaSemana();
    }
}