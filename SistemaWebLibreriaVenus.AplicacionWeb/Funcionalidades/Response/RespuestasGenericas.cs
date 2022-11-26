﻿using System.Reflection;
using System.Runtime.Loader;
namespace SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Response
{
    public class RespuestasGenericas<TObject>
    {
        public bool Estado { get; set; }
        public string? Mensaje { get; set; }
        public TObject? Objeto { get; set; }
        public List<TObject>? ListaObjeto { get; set; }
    }
}