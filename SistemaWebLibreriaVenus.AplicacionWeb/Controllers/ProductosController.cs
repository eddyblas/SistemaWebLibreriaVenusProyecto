using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.Entity;
using System.Data;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{
    [Authorize]
    public class ProductosController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IProductoS _productoS;


        public ProductosController(IMapper mapper, IProductoS productoS)
        {
            _mapper = mapper;
            _productoS = productoS;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]

        public async Task<IActionResult> Lista()
        {
            List<VMProducto> vmProductoLista = _mapper.Map<List<VMProducto>>(await _productoS.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmProductoLista });

        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromForm] IFormFile imagen, [FromForm] string modelo)
        {
            RespuestasGenericas<VMProducto> gResponse = new RespuestasGenericas<VMProducto>();

            try
            {
                VMProducto vmProducto = JsonConvert.DeserializeObject<VMProducto>(modelo);

                string nombreImagen = "";
                Stream imagenStream = null;

                if (imagen != null)
                {
                    string nombre_en_codigo = Guid.NewGuid().ToString("N");
                    string extension = Path.GetExtension(imagen.FileName);
                    nombreImagen = string.Concat(nombre_en_codigo, extension);
                    imagenStream = imagen.OpenReadStream();
                }

                ProductoBookstore producto_creado = await _productoS.Crear(_mapper.Map<ProductoBookstore>(vmProducto), imagenStream, nombreImagen);
                vmProducto = _mapper.Map<VMProducto>(producto_creado);

                gResponse.Estado = true;
                gResponse.Objeto = vmProducto;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPut]
        public async Task<IActionResult> Editar([FromForm] IFormFile imagen, [FromForm] string modelo)
        {
            RespuestasGenericas<VMProducto> gResponse = new RespuestasGenericas<VMProducto>();

            try
            {
                VMProducto vmProducto = JsonConvert.DeserializeObject<VMProducto>(modelo);

                string nombreImagen = "";
                Stream imagenStream = null;

                if (imagen != null)
                {
                    string nombre_en_codigo = Guid.NewGuid().ToString("N");
                    string extension = Path.GetExtension(imagen.FileName);
                    nombreImagen = string.Concat(nombre_en_codigo, extension);
                    imagenStream = imagen.OpenReadStream();
                }

                ProductoBookstore producto_editado = await _productoS.Editar(_mapper.Map<ProductoBookstore>(vmProducto), imagenStream, nombreImagen);
                vmProducto = _mapper.Map<VMProducto>(producto_editado);

                gResponse.Estado = true;
                gResponse.Objeto = vmProducto;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpDelete]
        public async Task<IActionResult> Eliminar(int IdProducto)
        {
            RespuestasGenericas<string> gResponse = new RespuestasGenericas<string>();

            try
            {
                gResponse.Estado = await _productoS.Eliminar(IdProducto);

            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }
            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

    }
}

