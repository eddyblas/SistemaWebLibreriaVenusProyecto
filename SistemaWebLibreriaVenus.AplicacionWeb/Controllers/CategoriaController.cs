using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{
    [Authorize]
    public class CategoriaController : Controller
    {

        private readonly IMapper _mapper;
        private readonly ICategoriaS _categoriaS;

        public CategoriaController(IMapper mapper, ICategoriaS categoriaS)
        {
            _mapper = mapper;
            _categoriaS = categoriaS;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]

        public async Task<IActionResult> Lista()
        {
            List<VMCategoria> vmCategoriaLista = _mapper.Map<List<VMCategoria>>(await _categoriaS.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmCategoriaLista });
        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromBody] VMCategoria modelo)
        {
            RespuestasGenericas<VMCategoria> gResponse = new RespuestasGenericas<VMCategoria>();

            try
            {
                CategoriaBookstore categoria_creada = await _categoriaS.Crear(_mapper.Map<CategoriaBookstore>(modelo));
                modelo = _mapper.Map<VMCategoria>(categoria_creada);

                gResponse.Estado = true;
                gResponse.Objeto = modelo;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPut]
        public async Task<IActionResult> Editar([FromBody] VMCategoria modelo)
        {
            RespuestasGenericas<VMCategoria> gResponse = new RespuestasGenericas<VMCategoria>();

            try
            {
                CategoriaBookstore categoria_editada = await _categoriaS.Editar(_mapper.Map<CategoriaBookstore>(modelo));
                modelo = _mapper.Map<VMCategoria>(categoria_editada);

                gResponse.Estado = true;
                gResponse.Objeto = modelo;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpDelete]
        public async Task<IActionResult> Eliminar(int IdCategoria)
        {
            RespuestasGenericas<string> gResponse = new RespuestasGenericas<string>();
            try
            {
                gResponse.Estado = await _categoriaS.Eliminar(IdCategoria);

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