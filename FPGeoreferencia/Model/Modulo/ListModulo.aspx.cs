using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Modulo
{
    public partial class ListModulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idCentroCultivo = Page.RouteData.Values["Id"].ToString();
            HidIdCentroCultivo.Value = idCentroCultivo;
            lblCentroCultivo.Text = idCentroCultivo;

            if (!IsPostBack)
            {
                var concesion = BusinessData.Dalc.Concesion.ObtenerCentroCultivo(1, decimal.Parse(idCentroCultivo));
            }
        }

        [WebMethod]
        public static string InsertaModulo(string nombre, string idCentroCultivo)
        {
            try
            {
                decimal estado;
                if (BusinessData.Dalc.Modulo.CreaModulo(int.Parse(idCentroCultivo), nombre, out estado))
                {
                    if (estado == 0)
                        return "0";
                   
                    if (estado == 1)
                        return "1";
                }
                return "2";
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ListModulo", "InsertaModulo", exception.Message);
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaCoordenadas(string modulo, string utmX, string utmY)
        {
            try
            {
                //se crean las coordenadas del centro cultivo
                if (BusinessData.Dalc.Modulo.CreaCoordenadas(modulo, utmX, utmY))
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ListConcesion", "InsertaCoordenadas", exception.Message);
                return exception.Message;
            }
        }

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }

        protected void GrillasCoordenadaCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
    }
}