using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Implementacion;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class VentaServicio : IVentaServicio
    {
        private readonly IGenericRepository<ProductoBookstore> _repositorioProducto;
        private readonly IVentaRepository _repositorioVenta;

        public VentaServicio(IGenericRepository<ProductoBookstore> repositorioProducto, IVentaRepository repositorioVenta)
        {
            _repositorioProducto = repositorioProducto;
            _repositorioVenta = repositorioVenta;
        }
        public async Task<List<ProductoBookstore>> ObtenerProductos(string busqueda)
        {

            IQueryable<ProductoBookstore> query = await _repositorioProducto.Consultar(p =>
            p.EsActivo == true && p.Stock > 0 &&
            string.Concat(p.CodigoBarra, p.Marca, p.Descripcion).Contains(busqueda));

            return query.Include(c => c.IdCategoriaNavigation).ToList();
        }

        public async Task<VentaBookstore> Registrar(VentaBookstore entidad)
        {
            try
            {
                return await _repositorioVenta.Registrar(entidad);
            }
            catch
            {
                throw;
            }
        }


        public async Task<List<VentaBookstore>> Historial(string numeroVenta, string fechaInicio, string fechaFin)
        {
            IQueryable<VentaBookstore> query = await _repositorioVenta.Consultar();
            fechaInicio = fechaInicio is null ? "" : fechaInicio;
            fechaFin = fechaFin is null ? "" : fechaFin;

            if (fechaInicio != "" && fechaFin != "")
            {
                DateTime fech_inicio = DateTime.ParseExact(fechaInicio, "dd/MM/yyyy", new CultureInfo("es-NI"));
                DateTime fech_fin = DateTime.ParseExact(fechaFin, "dd/MM/yyyy", new CultureInfo("es-NI"));

                return query.Where(v =>
                v.FechaRegistro.Value.Date >= fech_inicio.Date &&
                v.FechaRegistro.Value.Date <= fech_fin.Date
                )
                    .Include(tdv => tdv.IdTipoDocumentoVentaNavigation)
                    .Include(u => u.IdUsuarioNavigation)
                    .Include(dv => dv.DetalleVentaBoostores)
                    .ToList();

            }
            else
            {
                return query.Where(v => v.NumeroVenta == numeroVenta
                )
                    .Include(tdv => tdv.IdTipoDocumentoVentaNavigation)
                    .Include(u => u.IdUsuarioNavigation)
                    .Include(dv => dv.DetalleVentaBoostores)
                    .ToList();
            }
        }


        public async Task<VentaBookstore> Detalle(string numeroVenta)
        {
            try
            {
                IQueryable<VentaBookstore> query = await _repositorioVenta.Consultar(v => v.NumeroVenta == numeroVenta);
                return query
                    .Include(tdv => tdv.IdTipoDocumentoVentaNavigation)
                    .Include(u => u.IdUsuarioNavigation)
                    .Include(dv => dv.DetalleVentaBoostores)
                    .First();
            }
            catch
            {
                throw;
            }

        }


        public async Task<List<DetalleVentaBoostore>> Reporte(string fechaInicio, string fechaFin)
        {
            try
            {
                DateTime fech_inicio = DateTime.ParseExact(fechaInicio, "dd/MM/yyyy", new CultureInfo("es-NI"));
                DateTime fech_fin = DateTime.ParseExact(fechaFin, "dd/MM/yyyy", new CultureInfo("es-NI"));

                List<DetalleVentaBoostore> lista = await _repositorioVenta.Reporte(fech_inicio, fech_fin);

                return lista;
            }
            catch
            {
                throw;
            }

        }
    }
}