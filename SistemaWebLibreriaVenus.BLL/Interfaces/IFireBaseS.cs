using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Interfaces
{
    public interface IFireBaseS
    {
        Task<string> SubirStorage(Stream StreamArchivo, string CarpetaDestino, string NombreArchivo);
        Task<bool> EliminarStorage(string CarpetaDestino, string NombreArchivo);
    }
}
