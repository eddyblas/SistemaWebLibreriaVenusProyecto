using Microsoft.EntityFrameworkCore;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class DashBoardS : IDashBoardS
    {
        private readonly IVentaRepository _ventaRepository;
        private readonly IGenericRepository<DetalleVentaBoostore> _repositorioDetalle;
        private readonly IGenericRepository<CategoriaBookstore> _repositorioCategoria;
        private readonly IGenericRepository<ProductoBookstore> _repositorioProducto;
        private DateTime FechaInicio = DateTime.Now;

        public DashBoardS(IVentaRepository ventaRepository, IGenericRepository<DetalleVentaBoostore> repositorioDetalle, IGenericRepository<CategoriaBookstore> repositorioCategoria, IGenericRepository<ProductoBookstore> repositorioProducto)
        {
            _ventaRepository = ventaRepository;
            _repositorioDetalle = repositorioDetalle;
            _repositorioCategoria = repositorioCategoria;
            _repositorioProducto = repositorioProducto;
            FechaInicio = FechaInicio.AddDays(-7);
        }

        public async Task<int> TotalVentasUltimaSemana()
        {
            try
            {
                IQueryable<VentaBookstore> query = await _ventaRepository.Consultar(v => v.FechaRegistro.Value.Date >= FechaInicio.Date);
                int total = query.Count();
                return total;
            }
            catch
            {
                throw;
            }
        }

        public async Task<string> TotalIngresoUltimaSemana()
        {
            try
            {
                IQueryable<VentaBookstore> query = await _ventaRepository.Consultar(v => v.FechaRegistro.Value.Date >= FechaInicio.Date);
                decimal resultado = query
                    .Select(v => v.Total)
                    .Sum(v => v.Value);

                return Convert.ToString(resultado, new CultureInfo("es-Es"));
            }
            catch
            {
                throw;
            }
        }

        public async Task<int> TotalProductos()
        {
            try
            {
                IQueryable<ProductoBookstore> query = await _repositorioProducto.Consultar();
                int total = query.Count();
                return total;

            }
            catch
            {
                throw;
            }
        }


        public async Task<Dictionary<string, int>> ProductosTopUltimaSemana()
        {
            try
            {
                IQueryable<DetalleVentaBoostore> query = await _repositorioDetalle.Consultar();
                Dictionary<string, int> resultado = query
                    .Include(v => v.IdVentaNavigation)
                    .Where(dv => dv.IdVentaNavigation.FechaRegistro.Value.Date >= FechaInicio.Date)
                    .GroupBy(dv => dv.DescripcionProducto).OrderByDescending(g => g.Count())
                    .Select(dv => new { producto = dv.Key, total = dv.Count() }).Take(4)
                    .ToDictionary(keySelector: r => r.producto, elementSelector: r => r.total);
                return resultado;
            }
            catch
            {
                throw;
            }
        }

        public async Task<int> TotalCategorias()
        {
            try
            {
                IQueryable<CategoriaBookstore> query = await _repositorioCategoria.Consultar();
                int total = query.Count();
                return total;

            }
            catch
            {
                throw;
            }
        }




        public async Task<Dictionary<string, int>> VentasUltimasSemana()
        {
            try
            {
                IQueryable<VentaBookstore> query = await _ventaRepository.Consultar(v => v.FechaRegistro.Value.Date >= FechaInicio.Date);
                Dictionary<string, int> resultado = query
                    .GroupBy(v => v.FechaRegistro.Value.Date).OrderByDescending(g => g.Key)
                    .Select(dv => new { fecha = dv.Key.ToString("dd/MM/yyyy"), total = dv.Count() })
                    .ToDictionary(keySelector: r => r.fecha, elementSelector: r => r.total);
                return resultado;
            }
            catch
            {
                throw;
            }
        }
    }
}