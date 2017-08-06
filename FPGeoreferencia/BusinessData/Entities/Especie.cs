using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class Especie
    {
        public decimal Id { get; set; }
        public string Nombre { get; set; }
        public Especie()
        {
            Id = 0;
            Nombre = null;
        }
    }
}