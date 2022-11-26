using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Net;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.Entity;

namespace SistemaWebLibreriaVenus.BLL.Implementacion
{
    public class UsuarioS : IUsuarioS
    {

        private readonly IGenericRepository<Usuario> _repositorio;
        private readonly IFireBaseS _fireBaseService;
        private readonly IUtilidadesS _utilidadesService;
        private readonly ICorreoElectronico _correoElectronico;

        public UsuarioS(IGenericRepository<Usuario> repositorio, IFireBaseS fireBaseService, IUtilidadesS utilidadesService, ICorreoElectronico correoElectronico)
        {
            _repositorio = repositorio;
            _fireBaseService = fireBaseService;
            _utilidadesService = utilidadesService;
            _correoElectronico = correoElectronico;
        }

        public async Task<List<Usuario>> Lista()
        {
            IQueryable<Usuario> query = await _repositorio.Consultar();
            return query.Include(r => r.IdRolNavigation).ToList();
        }

        public async Task<Usuario> Crear(Usuario entidad, Stream Foto = null, string NombreFoto = "", string UrlCorreoP = "")
        {
            Usuario existe_usuario = await _repositorio.Obtener(u => u.Correo == entidad.Correo);

            if (existe_usuario != null)
                throw new TaskCanceledException("El correo ya existe");
            try
            {
                string clave_generada = _utilidadesService.GenerarClave();
                entidad.Clave = _utilidadesService.ConvertirSha256(clave_generada);
                entidad.NombreFoto = NombreFoto;

                if (Foto != null)
                {
                    string UrlFoto = await _fireBaseService.SubirStorage(Foto, "carpeta_usuario", NombreFoto);
                    entidad.UrlFoto = UrlFoto;
                }

                Usuario usuario_creado = await _repositorio.Crear(entidad);

                if (usuario_creado.IdUsuario == 0)
                    throw new TaskCanceledException("No se pudo crear el Usuario");

                if (UrlCorreoP != "")
                {
                    UrlCorreoP = UrlCorreoP.Replace("[correo]", usuario_creado.Correo).Replace("[clave]", clave_generada);
                    string htmlCorreo = "";
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(UrlCorreoP);
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        using (Stream dataStream = response.GetResponseStream())
                        {
                            StreamReader readerStream = null;

                            if (response.CharacterSet == null)
                            {
                                readerStream = new StreamReader(dataStream);
                            }
                            else
                            {
                                readerStream = new StreamReader(dataStream, Encoding.GetEncoding(response.CharacterSet));
                            }
                            htmlCorreo = readerStream.ReadToEnd();
                            response.Close();
                            readerStream.Close();
                        }
                    }
                    if (htmlCorreo != "")
                        await _correoElectronico.EnviarCorreo(usuario_creado.Correo, "Cuenta Creada", htmlCorreo);
                }
                IQueryable<Usuario> query = await _repositorio.Consultar(u => u.IdUsuario == usuario_creado.IdUsuario);
                usuario_creado = query.Include(r => r.IdRolNavigation).First();
                return usuario_creado;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<Usuario> Editar(Usuario entidad, Stream Foto = null, string NombreFoto = "")
        {
            Usuario existe_usuario = await _repositorio.Obtener(u => u.Correo == entidad.Correo && u.IdUsuario != entidad.IdUsuario);

            if (existe_usuario != null)
                throw new TaskCanceledException("El correo ya existe");
            try
            {
                IQueryable<Usuario> queryUsuario = await _repositorio.Consultar(u => u.IdUsuario == entidad.IdUsuario);
                Usuario usuario_editar = queryUsuario.First();
                usuario_editar.Nombre = entidad.Nombre;
                usuario_editar.Correo = entidad.Correo;
                usuario_editar.Telefono = entidad.Telefono;
                usuario_editar.IdRol = entidad.IdRol;

                if (usuario_editar.NombreFoto == "")
                    usuario_editar.NombreFoto = NombreFoto;
                if (Foto != null)
                {
                    string urlFoto = await _fireBaseService.SubirStorage(Foto, "carpeta_usuario", usuario_editar.NombreFoto);
                    usuario_editar.UrlFoto = urlFoto;
                }

                bool respuesta = await _repositorio.Editar(usuario_editar);

                if (!respuesta)
                    throw new TaskCanceledException("No se pudo modificar el Usuario");

                Usuario usuario_editado = queryUsuario.Include(r => r.IdRolNavigation).First();

                return usuario_editado;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(int IdUsuario)
        {
            try
            {
                Usuario usuario_encontrado = await _repositorio.Obtener(u => u.IdUsuario == IdUsuario);
                if (usuario_encontrado == null)
                    throw new TaskCanceledException("El usuario no existe");
                string nombreFoto = usuario_encontrado.NombreFoto;
                bool respuesta = await _repositorio.Eliminar(usuario_encontrado);

                if (respuesta)
                    await _fireBaseService.EliminarStorage("carpeta_usuario", nombreFoto);
                return true;
            }
            catch
            {
                throw;
            }
        }

        public async Task<Usuario> GetByCredenciales(string correo, string clave)
        {
            string clave_encriptada = _utilidadesService.ConvertirSha256(clave);
            Usuario usuario_encontrado = await _repositorio.Obtener(u => u.Correo.Equals(correo) && u.Clave.Equals(clave_encriptada));
            return usuario_encontrado;
        }

        public async Task<Usuario> GetByID(int IdUsuario)
        {
            IQueryable<Usuario> query = await _repositorio.Consultar(u => u.IdUsuario == IdUsuario);
            Usuario resultado = query.Include(r => r.IdRolNavigation).FirstOrDefault();
            return resultado;
        }

        public async Task<bool> CambiarClave(int IdUsuario, string ClaveActual, string ClaveNueva)
        {
            try
            {
                Usuario usuario_encontrado = await _repositorio.Obtener(u => u.IdUsuario == IdUsuario);

                if (usuario_encontrado == null)
                    throw new TaskCanceledException("El Usuario no existe");
                if (usuario_encontrado.Clave != _utilidadesService.ConvertirSha256(ClaveActual))
                    throw new TaskCanceledException("La contraseña ingresada como actual no es correcta");
                usuario_encontrado.Clave= _utilidadesService.ConvertirSha256(ClaveNueva);
                bool respuesta= await _repositorio.Editar(usuario_encontrado);
                return respuesta;

            }
            catch(Exception ex)
            {
                throw;
            }
        }

   


        public async Task<bool> GuardarPerfil(Usuario entidad)
        {
            try
            {
                Usuario usuario_encontrado = await _repositorio.Obtener(u => u.IdUsuario == entidad.IdUsuario);
                if (usuario_encontrado == null)
                    throw new TaskCanceledException("El usuario no existe");
                usuario_encontrado.Correo = entidad.Correo;
                usuario_encontrado.Telefono=entidad.Telefono;

                bool respuesta= await _repositorio.Editar(usuario_encontrado);

                return respuesta;
            }
            catch
            {
                throw;
            }
        }

        
        public async Task<bool> RestablecerClave(string correo, string UrlCorreoP)
        {
            try
            {
                Usuario usuario_encontrado = await _repositorio.Obtener(u => u.Correo == correo);
                if (usuario_encontrado == null)
                    throw new TaskCanceledException("No se ha encontrado ningun Usuario asociado al correo");
                string clave_generada = _utilidadesService.GenerarClave();
                usuario_encontrado.Clave = _utilidadesService.ConvertirSha256(clave_generada);
                UrlCorreoP = UrlCorreoP.Replace("[clave]", clave_generada);
                string htmlCorreo = "";
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(UrlCorreoP);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream dataStream = response.GetResponseStream())
                    {
                        StreamReader readerstream = null;

                        if (response.CharacterSet == null)
                            readerstream = new StreamReader(dataStream);
                        else
                            readerstream = new StreamReader(dataStream, Encoding.GetEncoding(response.CharacterSet));
                        htmlCorreo = readerstream.ReadToEnd();
                        response.Close();
                        readerstream.Close();
                    }
                }

                bool correo_enviado = false;
                if (htmlCorreo != "")
                  correo_enviado=  await _correoElectronico.EnviarCorreo(correo, "Contraseña Restablecida", htmlCorreo);
                if (!correo_enviado)
                    throw new TaskCanceledException("Tenemos Problemas por favor intentalo de nuevo mas tarde");

                bool respuesta = await _repositorio.Editar(usuario_encontrado);
                return respuesta;
            }
            catch
            {
                throw;
            }
        }
    }
}
