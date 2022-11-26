using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class RolS : IRolS
    {
        private readonly IGenericRepository<Rol> _repositorio;
        public RolS(IGenericRepository<Rol> repositorio)
        {
            _repositorio = repositorio;
        }
        public async Task<List<Rol>> Lista()
        {
            IQueryable<Rol> query = await _repositorio.Consultar();
            return query.ToList();
        }
    }
}