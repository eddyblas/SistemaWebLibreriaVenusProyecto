using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IUtilidadesS
    {
        string GenerarClave();
        string ConvertirSha256(string texto);
    }
}