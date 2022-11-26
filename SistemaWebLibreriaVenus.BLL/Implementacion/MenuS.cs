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
    public class MenuS : IMenuS
    {
        private readonly IGenericRepository<Menu> _repositorioMenu;
        private readonly IGenericRepository<RolMenu> _reposRolMenu;
        private readonly IGenericRepository<Usuario> _repositorioUsuario;

        public MenuS(IGenericRepository<Menu> repositorioMenu, IGenericRepository<RolMenu> reposRolMenu, IGenericRepository<Usuario> repositorioUsuario)
        {
            _repositorioMenu = repositorioMenu;
            _reposRolMenu = reposRolMenu;
            _repositorioUsuario = repositorioUsuario;
        }
        public async Task<List<Menu>> ObtenerMenus(int idUsuario)
        {
            IQueryable<Usuario> tbUsuario = await _repositorioUsuario.Consultar(u => u.IdUsuario == idUsuario);
            IQueryable<RolMenu> tbRolMenu = await _reposRolMenu.Consultar();
            IQueryable<Menu> tbMenu= await _repositorioMenu.Consultar();

            IQueryable<Menu> MenuPadre = (from u in tbUsuario
                             join rm in tbRolMenu on u.IdRol equals rm.IdRol
                             join m in tbMenu on rm.IdMenu equals m.IdMenu
                             join mpadre in tbMenu on m.IdMenuPadre equals mpadre.IdMenu
                             select mpadre).Distinct().AsQueryable();
            IQueryable<Menu> MenuHijos = (from u in tbUsuario
                             join rm in tbRolMenu on u.IdRol equals rm.IdRol
                             join m in tbMenu on rm.IdMenu equals m.IdMenu
                             where m.IdMenu != m.IdMenuPadre
                             select m).Distinct().AsQueryable();

            List<Menu> listaMenu= (from mpadre in MenuPadre
                           select new Menu()
                           {
                               Descripcion = mpadre.Descripcion,
                               Icono = mpadre.Icono,
                               Controlador = mpadre.Controlador,
                               PaginaAccion = mpadre.PaginaAccion,
                               InverseIdMenuPadreNavigation= (from mhijo in MenuHijos
                                                              where mhijo.IdMenuPadre == mpadre.IdMenu
                                                              select mhijo).ToList()
                           }).ToList();
            return listaMenu;
        }
    }
}
