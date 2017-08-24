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

    public class CoordenadasLinea
    {
        public int Id { get; set; }
        public string UtmEInicio { get; set; }
        public string UtmEFin { get; set; }
        public string UtmNInicio { get; set; }
        public string UtmNFin { get; set; }

        public CoordenadasLinea()
        {
            UtmEInicio = null;
            UtmEFin = null;
            UtmNInicio = null;
            UtmNFin = null;
            Id = 0;
        }
    }
}