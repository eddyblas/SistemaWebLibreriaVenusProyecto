using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.Entity;
using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{
    [Authorize]
    public class VentasController : Controller
    {
        private readonly ITipoDocumentoVentaS _tipoDocumentoVentaS;
        private readonly IVentaServicio _ventaS;
        private readonly IMapper _mapper;
        private readonly IConverter _converter;
        public VentasController(ITipoDocumentoVentaS tipoDocumentoVentaS, IVentaServicio ventaS, IMapper mapper, IConverter converter)
        {
            _tipoDocumentoVentaS = tipoDocumentoVentaS;
            _ventaS = ventaS;
            _mapper = mapper;
            _converter = converter;
        }

        public IActionResult NewVenta()
        {
            return View();
        }

        public IActionResult HistorialVentas()
        {
            return View();
        }


        [HttpGet]
        public async Task<IActionResult> ListaTipoDocumentoVenta()
        {
            List<VMTipoDocumentoVenta> vmListaTipoDocuemnto = _mapper.Map<List<VMTipoDocumentoVenta>>(await _tipoDocumentoVentaS.Lista());
            return StatusCode(StatusCodes.Status200OK, vmListaTipoDocuemnto);
        }

        [HttpGet]

        public async Task<IActionResult> ObtenerProductos(string busqueda)
        {
            List<VMProducto> vmListaProducto = _mapper.Map<List<VMProducto>>(await _ventaS.ObtenerProductos(busqueda));
            return StatusCode(StatusCodes.Status200OK, vmListaProducto);
        }

        [HttpPost]
        public async Task<IActionResult> RegistrarVenta([FromBody] VMVenta modelo)
        {
            RespuestasGenericas<VMVenta> gResponse = new RespuestasGenericas<VMVenta>();

            try
            {
                ClaimsPrincipal claimUser = HttpContext.User;
                string idUsuario = claimUser.Claims
                    .Where(c => c.Type == ClaimTypes.NameIdentifier)
                    .Select(c => c.Value).SingleOrDefault();

                modelo.IdUsuario= int.Parse(idUsuario);
                VentaBookstore venta_creada = await _ventaS.Registrar(_mapper.Map<VentaBookstore>(modelo));
                modelo = _mapper.Map<VMVenta>(venta_creada);

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

        [HttpGet]

        public async Task<IActionResult> Historial(string numeroVenta, string fechaInicio, string fechaFin)
        {
            List<VMVenta> vmHistorialVenta = _mapper.Map<List<VMVenta>>(await _ventaS.Historial(numeroVenta, fechaInicio, fechaFin));
            return StatusCode(StatusCodes.Status200OK, vmHistorialVenta);
        }

        public IActionResult MostrarPDFVenta(string numeroVenta)
        {

            string urlPlantillaVista = $"{this.Request.Scheme}://{this.Request.Host}/Password/PDFVenta?numeroVenta={numeroVenta}";

            var pdf = new HtmlToPdfDocument()
            {
                GlobalSettings = new GlobalSettings()
                {
                    PaperSize = PaperKind.A4,
                    Orientation = Orientation.Portrait,
                },

                Objects =
                  {
                          new ObjectSettings()
                          {
                              Page=urlPlantillaVista
                          }
                  }
            };

            var archivoPDF = _converter.Convert(pdf);
            return File(archivoPDF, "application/pdf");


        }
    }
}