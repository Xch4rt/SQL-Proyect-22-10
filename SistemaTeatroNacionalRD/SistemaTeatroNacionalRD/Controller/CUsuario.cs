using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SistemaTeatroNacionalRD.Model;

namespace SistemaTeatroNacionalRD.Controller
{
    class CUsuario
    {
        public static DataTable Validar_acceso(string usuario, string contraseña)
        {
            return new MUsuario().Validar_acceso(usuario, contraseña);
        }
    

    }
}

