using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class Muestreo
    {
        public decimal IdLinea { get; set; }
        public decimal IdUbicacionCuelga { get; set; }
        public string FechaMuestreo { get; set; }
        public string HoraMuestreo { get; set; }
        public string Hora { get; set; }
        public string Minutos { get; set; }
        public decimal Temperatura { get; set; }
        public string Transparencia { get; set; }
        public int NumeroIndividuosMt { get; set; }
        public int NumeroIndividuosKg { get; set; }
        public decimal TallaPromedio { get; set; }
        public int NumeroMuertos { get; set; }
        public string FactorCondicion { get; set; }
        public string UtmEn { get; set; }
        public decimal IdModulo { get; set; }
        
    }
}