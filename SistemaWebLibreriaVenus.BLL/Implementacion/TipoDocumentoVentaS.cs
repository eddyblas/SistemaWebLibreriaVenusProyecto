using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class TipoDocumentoVentaS : ITipoDocumentoVentaS
    {
        private readonly IGenericRepository<TipoDocumentoVenta> _repositorio;

        public TipoDocumentoVentaS(IGenericRepository<TipoDocumentoVenta> repositorio)
        {
            _repositorio = repositorio;
        }
        public async Task<List<TipoDocumentoVenta>> Lista()
        {
            IQueryable<TipoDocumentoVenta> query = await _repositorio.Consultar();
            return query.ToList();
        }
    }
}