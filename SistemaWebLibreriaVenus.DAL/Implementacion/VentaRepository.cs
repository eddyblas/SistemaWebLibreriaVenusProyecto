using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SistemaWebLibreriaVenus.DAL.BDContext;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.DAL.Implementacion
{
    public class VentaRepository : GenericRepository<VentaBookstore>, IVentaRepository
    {
        private readonly BDLIBRERIAVENUSContext _dbContext;

        public VentaRepository(BDLIBRERIAVENUSContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<VentaBookstore> Registrar(VentaBookstore entidad)
        {
            VentaBookstore ventaGenerada = new VentaBookstore();
            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    foreach (DetalleVentaBoostore dv in entidad.DetalleVentaBoostores)
                    {
                        ProductoBookstore producto_encontrado = _dbContext.ProductoBookstores.Where(p => p.IdProducto == dv.IdProducto).First();
                        producto_encontrado.Stock = producto_encontrado.Stock - dv.Cantidad;
                        _dbContext.ProductoBookstores.Update(producto_encontrado);
                    }
                    await _dbContext.SaveChangesAsync();
                    NumeroCorrelativo correlativo = _dbContext.NumeroCorrelativos.Where(n => n.Gestion == "venta").First();
                    correlativo.UltimoNumero = correlativo.UltimoNumero + 1;
                    correlativo.FechaActualizacion = DateTime.Now;

                    _dbContext.NumeroCorrelativos.Update(correlativo);
                    await _dbContext.SaveChangesAsync();

                    string ceros = string.Concat(Enumerable.Repeat("0", correlativo.CantidadDigitos.Value));
                    string numeroVenta = ceros + correlativo.UltimoNumero.ToString();
                    numeroVenta = numeroVenta.Substring(numeroVenta.Length - correlativo.CantidadDigitos.Value, correlativo.CantidadDigitos.Value);

                    entidad.NumeroVenta = numeroVenta;
                    await _dbContext.VentaBookstores.AddAsync(entidad);
                    await _dbContext.SaveChangesAsync();
                    ventaGenerada = entidad;

                    transaction.Commit();

                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }

            return ventaGenerada;
        }

        public async Task<List<DetalleVentaBoostore>> Reporte(DateTime FechaInicio, DateTime FechaFin)
        {
            List<DetalleVentaBoostore> listaResumen = await _dbContext.DetalleVentaBoostores
                .Include(v => v.IdVentaNavigation)
                .ThenInclude(u => u.IdUsuarioNavigation)
                .Include(v => v.IdVentaNavigation)
                .ThenInclude(tdv => tdv.IdTipoDocumentoVentaNavigation)
                .Where(dv => dv.IdVentaNavigation.FechaRegistro.Value.Date >= FechaInicio.Date &&
                  dv.IdVentaNavigation.FechaRegistro.Value.Date <= FechaFin.Date).ToListAsync();

            return listaResumen;
        }
    }
}