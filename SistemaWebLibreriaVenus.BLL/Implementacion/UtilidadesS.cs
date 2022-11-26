using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using System.Security.Cryptography;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class UtilidadesS : IUtilidadesS
    {
        public string GenerarClave()
        {
            string clave = Guid.NewGuid().ToString("N").Substring(0, 6);
            return clave;
        }

        public string ConvertirSha256(string texto)
        {
            StringBuilder sb = new StringBuilder();
            if(texto ==null)
            {
                return "No se puede dejar los campos vacios";
            }

            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;

                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result)
                {
                    sb.Append(b.ToString("x2"));
                }
            }
            return sb.ToString();
        }


    }
}
