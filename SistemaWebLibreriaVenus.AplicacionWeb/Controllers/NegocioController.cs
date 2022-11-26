using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{
    [Authorize]
    public class NegocioController : Controller
    {
        private readonly IMapper _mapper;
        private readonly INegocioS _negocioS;

        public NegocioController(IMapper mapper, INegocioS negocioS)
        {
            _mapper = mapper;
            _negocioS = negocioS;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Obtener()
        {
            RespuestasGenericas<VMNegocio> gResponse = new RespuestasGenericas<VMNegocio>();

            try
            {
                VMNegocio vmNegocio = _mapper.Map<VMNegocio>(await _negocioS.Obtener());
                gResponse.Estado = true;
                gResponse.Objeto = vmNegocio;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPost]
        public async Task<IActionResult> GuardarCambios([FromForm] IFormFile logo, [FromForm] string modelo)
        {
            RespuestasGenericas<VMNegocio> gResponse = new RespuestasGenericas<VMNegocio>();

            try
            {
                VMNegocio vmNegocio = JsonConvert.DeserializeObject<VMNegocio>(modelo);

                string nombreLogo = "";
                Stream logoStream = null;

                if (logo != null)
                {
                    string nombre_en_codigo = Guid.NewGuid().ToString("N");
                    string extension = Path.GetExtension(logo.FileName);
                    nombreLogo = string.Concat(nombre_en_codigo, extension);
                    logoStream = logo.OpenReadStream();
                }

                NegocioBookstore negocio_editado = await _negocioS.GuardarCambios(_mapper.Map<NegocioBookstore>(vmNegocio), logoStream, nombreLogo);
                vmNegocio = _mapper.Map<VMNegocio>(negocio_editado);
                gResponse.Estado = true;
                gResponse.Objeto = vmNegocio;
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