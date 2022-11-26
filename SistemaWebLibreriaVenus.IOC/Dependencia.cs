using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SistemaWebLibreriaVenus.DAL.BDContext;
using Microsoft.EntityFrameworkCore;
using SistemaWebLibreriaVenus.DAL.Interfaces;
using SistemaWebLibreriaVenus.DAL.Implementacion;
using SistemaWebLibreriaVenus.BLL.Interfaces;
using SistemaWebLibreriaVenus.BLL.Implementacion;


namespace SistemaWebLibreriaVenus.IOC
{
    public static class Dependencia
    {
        public static void InyectarDependencia(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<BDLIBRERIAVENUSContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("CadenaSQL"));
            });

            services.AddTransient(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            services.AddScoped<IVentaRepository, VentaRepository>();
            services.AddScoped<ICorreoElectronico, CorreoElectronicoS>();
            services.AddScoped<IFireBaseS, FireBaseS>();
            services.AddScoped<IUtilidadesS, UtilidadesS>();
            services.AddScoped<IRolS, RolS>();
            services.AddScoped<IUsuarioS, UsuarioS>();
            services.AddScoped<INegocioS, NegocioS>();
            services.AddScoped<ICategoriaS, CategoriaS>();
            services.AddScoped<IProductoS, ProductoS>();
            services.AddScoped<ITipoDocumentoVentaS, TipoDocumentoVentaS>();
            services.AddScoped<IVentaServicio, VentaServicio>();
            services.AddScoped<IDashBoardS, DashBoardS>();
            services.AddScoped<IMenuS, MenuS>();

        }
    }
}