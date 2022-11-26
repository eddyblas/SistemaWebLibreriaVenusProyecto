using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface INegocioS
    {
        Task<NegocioBookstore> Obtener();
        Task<NegocioBookstore> GuardarCambios(NegocioBookstore entidad, Stream Logo = null, string NombreLogo = "");
    }
}
