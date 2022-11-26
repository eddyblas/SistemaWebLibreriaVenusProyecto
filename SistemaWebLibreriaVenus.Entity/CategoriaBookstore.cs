using System;
using System.Collections.Generic;

namespace SistemaWebLibreriaVenus.Entity
{
    public partial class CategoriaBookstore
    {
        public CategoriaBookstore()
        {
            ProductoBookstores = new HashSet<ProductoBookstore>();
        }

        public int IdCategoria { get; set; }
        public string? Descripcion { get; set; }
        public bool? EsActivo { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<ProductoBookstore> ProductoBookstores { get; set; }
    }
}
