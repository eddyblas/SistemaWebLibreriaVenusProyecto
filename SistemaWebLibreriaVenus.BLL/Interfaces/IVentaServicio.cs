using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IVentaServicio
    {
        Task<List<ProductoBookstore>> ObtenerProductos(string busqueda);

        Task<VentaBookstore> Registrar(VentaBookstore entidad);

        Task<List<VentaBookstore>> Historial(string numeroVenta, string fechaInicio, string fechaFin);

        Task<VentaBookstore> Detalle(string numeroVenta);

        Task<List<DetalleVentaBoostore>> Reporte(string fechaInicio, string fechaFin);
    }
}