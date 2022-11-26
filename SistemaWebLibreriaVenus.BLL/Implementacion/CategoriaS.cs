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
    public class CategoriaS : ICategoriaS
    {
        private readonly IGenericRepository<CategoriaBookstore> _repository;

        public CategoriaS(IGenericRepository<CategoriaBookstore> repository)
        {
            _repository = repository;
        }
        public async Task<List<CategoriaBookstore>> Lista()
        {
            IQueryable<CategoriaBookstore> query = await _repository.Consultar();
            return query.ToList();
        }
        public async Task<CategoriaBookstore> Crear(CategoriaBookstore entidad)
        {
            try
            {
                CategoriaBookstore categoria_creada = await _repository.Crear(entidad);
                if (categoria_creada.IdCategoria == 0)
                    throw new TaskCanceledException("No se pudo crear la categoria");
                return categoria_creada;
            }
            catch
            {
                throw;
            }
        }

        public async Task<CategoriaBookstore> Editar(CategoriaBookstore entidad)
        {
            try
            {
                CategoriaBookstore categoria_encontrada = await _repository.Obtener(c => c.IdCategoria == entidad.IdCategoria);
                categoria_encontrada.Descripcion = entidad.Descripcion;
                categoria_encontrada.EsActivo = entidad.EsActivo;
                bool respuesta = await _repository.Editar(categoria_encontrada);

                if (!respuesta)
                    throw new TaskCanceledException("No se pudo Modificar la categoria");

                return categoria_encontrada;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(int idCategoria)
        {
            try
            {
                CategoriaBookstore categoria_encontrada = await _repository.Obtener(c => c.IdCategoria == idCategoria);
                if (categoria_encontrada == null)
                    throw new TaskCanceledException("La categoria no existe");
                bool respuesta = await _repository.Eliminar(categoria_encontrada);
                return respuesta;
            }
            catch
            {
                throw;
            }

        }


    }
}