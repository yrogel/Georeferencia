using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class Cosecha
    {
        public decimal IdLinea { get; set; }
        public decimal IdTipoCosecha { get; set; }
        public decimal IdFormaCosecha { get; set; }
        public decimal KgSucioMetro { get; set; }
        public decimal KgSucioCuelga { get; set; }
        public decimal KgLimpioMetro { get; set; }
        public decimal KgLimpioCuelga { get; set; }
        public string FactorCondicion { get; set; }
        public decimal TallaPromedio { get; set; }
        public decimal NumeroIndividuosMt { get; set; }
        public decimal NumeroIndividuosKg { get; set; }
        public string FechaCosecha { get; set; }
        public decimal IdModulo { get; set; }
        public decimal IdEspecie { get; set; }
        public string UnidadMedida { get; set; }
    }
}