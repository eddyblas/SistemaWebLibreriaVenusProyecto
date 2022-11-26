using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{
    [Authorize]
    public class DashBoardController : Controller
    {
        private readonly IDashBoardS _dashboardS;

        public DashBoardController(IDashBoardS dashboardS)
        {
            _dashboardS = dashboardS;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]

        public async Task<IActionResult> ObtenerResumen()
        {
            RespuestasGenericas<VMDashBoard> gResponse = new RespuestasGenericas<VMDashBoard>();

            try
            {
                VMDashBoard vmDashboard = new VMDashBoard();
                vmDashboard.TotalVentas = await _dashboardS.TotalVentasUltimaSemana();
                vmDashboard.TotalIngresos = await _dashboardS.TotalIngresoUltimaSemana();
                vmDashboard.TotalProductos = await _dashboardS.TotalProductos();
                vmDashboard.TotalCategorias = await _dashboardS.TotalCategorias();

                List<VMVentasSemana> listaVentasSemana = new List<VMVentasSemana>();
                List<VMProductosSemana> listaProductosSemana = new List<VMProductosSemana>();

                foreach (KeyValuePair<string, int> item in await _dashboardS.VentasUltimasSemana())
                {
                    listaVentasSemana.Add(new VMVentasSemana()
                    {
                        Fecha = item.Key,
                        Total = item.Value,
                    });
                }

                foreach (KeyValuePair<string, int> item in await _dashboardS.ProductosTopUltimaSemana())
                {
                    listaProductosSemana.Add(new VMProductosSemana()
                    {
                        Producto = item.Key,
                        Cantidad = item.Value,
                    });
                }

                vmDashboard.VentasUltimaSemana = listaVentasSemana;
                vmDashboard.ProductosTopUltimaSemana = listaProductosSemana;


                gResponse.Estado = true;
                gResponse.Objeto = vmDashboard;
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