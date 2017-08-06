using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FPGeoreferencia.BusinessData.Entities
{
    public class CentroCultivo
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Superficie { get; set; }
        public int Modulos { get; set; }
        public int Lineas { get; set; }
        public List<Coordenadas> Coordenadas { get; set; }

        public CentroCultivo()
        {
            Id = 0;
            Nombre = null;
            Direccion = null;
            Superficie = null;
            Modulos = 0;
            Lineas = 0;
            Coordenadas = null;
        }
    }
}