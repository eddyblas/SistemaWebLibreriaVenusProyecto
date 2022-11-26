using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using System.Security.Claims;
using SistemaWebLibreriaVenus.AplicacionWeb.Models;


namespace SistemaWebLibreriaVenus.AplicacionWeb.Funcionalidades.ViewComponents
{
    public class MenuViewComponent:ViewComponent
    {
        private readonly IMenuS _menuS;
        private readonly IMapper _mapper;

        public MenuViewComponent(IMenuS menuS, IMapper mapper)
        {
            _menuS = menuS;
            _mapper = mapper;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            ClaimsPrincipal claimUser = HttpContext.User;
            List<VMMenu> listaMenus;

            if (claimUser.Identity.IsAuthenticated)
            {
                string idUsuario = claimUser.Claims
                   .Where(c => c.Type == ClaimTypes.NameIdentifier)
                   .Select(c => c.Value).SingleOrDefault();
                listaMenus= _mapper.Map<List<VMMenu>>(await _menuS.ObtenerMenus(int.Parse(idUsuario)));
            }
            else
            {
                listaMenus = new List<VMMenu> { };
            }

            return View(listaMenus);
        }
    }
}
