using System.ComponentModel.DataAnnotations;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Models
{
    public class VMUsuarioLogin
    {
        [EmailAddress]
        public string? Correo { get; set; }
        public string? Clave { get; set; }
        public bool MantenerSesion { get; set; }
    }
}