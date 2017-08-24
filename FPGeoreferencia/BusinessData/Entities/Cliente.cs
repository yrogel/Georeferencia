using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class Cliente
    {
        public decimal Id { get; set; }
        public decimal IdRol { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Rut { get; set; }
        public string Telefono { get; set; }
        public int Estado { get; set; }
        public int CambioClave { get; set; }
        public string Correo { get; set; }
        public int TotalCentroCultivo { get; set; }

        public Cliente()
        {
            Id = 0;
            IdRol = 0;
            Login = null;
            Password = null;
            Nombre = null;
            Direccion = null;
            Rut = null;
            Telefono = null;
            Estado = 0;
            CambioClave = 0;
            Correo = null;
            TotalCentroCultivo = 0;
        }
    }
}