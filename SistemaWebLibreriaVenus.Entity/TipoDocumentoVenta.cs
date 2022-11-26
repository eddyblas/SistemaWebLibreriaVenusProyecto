using System;
using System.Collections.Generic;

namespace SistemaWebLibreriaVenus.Entity
{
    public partial class TipoDocumentoVenta
    {
        public TipoDocumentoVenta()
        {
            VentaBookstores = new HashSet<VentaBookstore>();
        }

        public int IdTipoDocumentoVenta { get; set; }
        public string? Descripcion { get; set; }
        public bool? EsActivo { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<VentaBookstore> VentaBookstores { get; set; }
    }
}
