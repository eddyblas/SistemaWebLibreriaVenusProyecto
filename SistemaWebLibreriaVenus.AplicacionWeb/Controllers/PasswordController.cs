using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;
using SistemaWebLibreriaVenus.BLL.Interfaces;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Controllers
{

    public class PasswordController : Controller
    {
        private readonly IMapper _mapper;
        private readonly INegocioS _negocioS;
        private readonly IVentaServicio _ventaServicio;

        public PasswordController(IMapper mapper, INegocioS negocioS, IVentaServicio ventaServicio)
        {
            _mapper = mapper;
            _negocioS = negocioS;
            _ventaServicio = ventaServicio;
        }

        public IActionResult EnviarClave(string correo, string clave)
        {
            ViewData["Correo"] = correo;
            ViewData["Clave"] = clave;
            ViewData["Url"] = $"{this.Request.Scheme}://{this.Request.Host}";
            return View();
        }

        public async Task<IActionResult> PDFVenta(string numeroVenta)
        {
            VMVenta vmVenta = _mapper.Map<VMVenta>(await _ventaServicio.Detalle(numeroVenta));
            VMNegocio vmNegocio = _mapper.Map<VMNegocio>(await _negocioS.Obtener());
            VMPDFVenta modelo = new VMPDFVenta();
            modelo.negocio = vmNegocio;
            modelo.venta = vmVenta;

            return View(modelo);
        }

        public IActionResult RestablecerClave(string clave)
        {
            ViewData["Clave"] = clave;
            return View();
        }
    }
}