using System.Reflection;
using System.Runtime.Loader;

namespace SistemaWebLibreriaVenus.AplicacionWeb.Funcionalides.Extensiones
{
    public class CustomAssemblyLoadContext: AssemblyLoadContext
    {
        public IntPtr LoadUnmanagedLibrary(string absolutePath)
        {
            return LoadUnmanagedDll(absolutePath);
        }
    
        protected override Assembly Load(AssemblyName assemblyName)
        {
            throw new NotImplementedException();
        }
    }
}
