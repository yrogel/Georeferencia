using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class Coordenadas
    {
        public int Id { get; set; }
        public string UtmX { get; set; }
        public string UtmY { get; set; }

        public Coordenadas()
        {
            UtmX = null;
            UtmY = null;
            Id = 0;
        }
    }
}