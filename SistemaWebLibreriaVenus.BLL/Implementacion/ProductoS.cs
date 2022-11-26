using Microsoft.EntityFrameworkCore;
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
    public class ProductoS : IProductoS
    {
        private readonly IGenericRepository<ProductoBookstore> _repository;
        private readonly IFireBaseS _fireBaseS;


        public ProductoS(IGenericRepository<ProductoBookstore> repository, IFireBaseS fireBaseS)
        {
            _repository = repository;
            _fireBaseS = fireBaseS;

        }

        public async Task<List<ProductoBookstore>> Lista()
        {
            IQueryable<ProductoBookstore> query = await _repository.Consultar();
            return query.Include(c => c.IdCategoriaNavigation).ToList();
        }

        public async Task<ProductoBookstore> Crear(ProductoBookstore entidad, Stream imagen = null, string NombreImagen = "")
        {
            ProductoBookstore producto_existe = await _repository.Obtener(p => p.CodigoBarra == entidad.CodigoBarra);

            if (producto_existe != null)
                throw new TaskCanceledException("El Codigo de Barra ya existe");
            try
            {
                entidad.NombreImagen = NombreImagen;
                if (imagen != null)
                {
                    string urlImagen = await _fireBaseS.SubirStorage(imagen, "carpeta_producto", NombreImagen);
                    entidad.UrlImagen = urlImagen;
                }

                ProductoBookstore producto_creado = await _repository.Crear(entidad);

                if (producto_creado.IdProducto == 0)
                    throw new TaskCanceledException("No se pudo crear el producto");

                IQueryable<ProductoBookstore> query = await _repository.Consultar(p => p.IdProducto == producto_creado.IdProducto);

                producto_creado = query.Include(c => c.IdCategoriaNavigation).First();

                return producto_creado;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<ProductoBookstore> Editar(ProductoBookstore entidad, Stream imagen = null, string NombreImagen = "")
        {
            ProductoBookstore producto_existe = await _repository.Obtener(p => p.CodigoBarra == entidad.CodigoBarra && p.IdProducto != entidad.IdProducto);
            if (producto_existe != null)
                throw new TaskCanceledException("El codigo de barra ya existe");

            try
            {
                IQueryable<ProductoBookstore> query = await _repository.Consultar(p => p.IdProducto == entidad.IdProducto);

                ProductoBookstore producto_editar = query.First();
                producto_editar.CodigoBarra = entidad.CodigoBarra;
                producto_editar.Marca = entidad.Marca;
                producto_editar.Descripcion = entidad.Descripcion;
                producto_editar.IdCategoria = entidad.IdCategoria;
                producto_editar.Stock = entidad.Stock;
                producto_editar.Precio = entidad.Precio;
                producto_editar.EsActivo = entidad.EsActivo;

                if (producto_editar.NombreImagen == "")
                {
                    producto_editar.NombreImagen = NombreImagen;
                }

                if (imagen != null)
                {
                    string urlImagen = await _fireBaseS.SubirStorage(imagen, "carpeta_producto", producto_editar.NombreImagen);
                    producto_editar.UrlImagen = urlImagen;
                }

                bool respuesta = await _repository.Editar(producto_editar);

                if (!respuesta)
                    throw new TaskCanceledException("No se pudo modificar el producto");

                ProductoBookstore producto_editado = query.Include(c => c.IdCategoriaNavigation).First();

                return producto_editado;
            }
            catch
            {
                throw;
            }

        }

        public async Task<bool> Eliminar(int idProducto)
        {
            try
            {
                ProductoBookstore producto_encontrado = await _repository.Obtener(p => p.IdProducto == idProducto);

                if (producto_encontrado == null)
                    throw new TaskCanceledException("El producto existe");

                string nombreImagen = producto_encontrado.NombreImagen;

                bool respuesta = await _repository.Eliminar(producto_encontrado);

                if (respuesta)
                    await _fireBaseS.EliminarStorage("carpeta_producto", nombreImagen);

                return true;
            }
            catch
            {
                throw;
            }
        }


    }
}