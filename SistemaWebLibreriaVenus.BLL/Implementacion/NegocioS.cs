using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class NegocioS : INegocioS
    {
        private readonly IGenericRepository<NegocioBookstore> _repositorio;
        private readonly IFireBaseS _firebase;

        public NegocioS(IGenericRepository<NegocioBookstore> repositorio, IFireBaseS firebase)
        {
            _repositorio = repositorio;
            _firebase = firebase;
        }
        public async Task<NegocioBookstore> Obtener()
        {
            try
            {
                NegocioBookstore negocio_encontrado = await _repositorio.Obtener(n => n.IdNegocio == 1);
                return negocio_encontrado;
            }
            catch
            {
                throw;
            }
        }
        public async Task<NegocioBookstore> GuardarCambios(NegocioBookstore entidad, Stream Logo = null, string NombreLogo = "")
        {
            try
            {
                NegocioBookstore negocio_encontrado = await _repositorio.Obtener(n => n.IdNegocio == 1);

                negocio_encontrado.NumeroDocumento = entidad.NumeroDocumento;
                negocio_encontrado.Nombre = entidad.Nombre;
                negocio_encontrado.Correo = entidad.Correo;
                negocio_encontrado.Direccion = entidad.Direccion;
                negocio_encontrado.Telefono = entidad.Telefono;
                negocio_encontrado.PorcentajeImpuesto = entidad.PorcentajeImpuesto;
                negocio_encontrado.SimboloMoneda = entidad.SimboloMoneda;
                negocio_encontrado.NombreLogo = negocio_encontrado.NombreLogo == "" ? NombreLogo : negocio_encontrado.NombreLogo;

                if (Logo != null)
                {
                    string urlFoto = await _firebase.SubirStorage(Logo, "carpeta_logo", negocio_encontrado.NombreLogo);
                    negocio_encontrado.UrlLogo = urlFoto;
                }

                await _repositorio.Editar(negocio_encontrado);
                return negocio_encontrado;
            }
            catch
            {
                throw;
            }

        }
    }
}