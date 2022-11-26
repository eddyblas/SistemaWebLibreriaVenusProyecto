using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.DAL.Interfaces
{
    public interface IVentaRepository : IGenericRepository<VentaBookstore>
    {
        Task<VentaBookstore> Registrar(VentaBookstore entidad);
        Task<List<DetalleVentaBoostore>> Reporte(DateTime FechaInicio, DateTime FechaFin);
    }
}
