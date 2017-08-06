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

                ddlEspecie.DataSource = BusinessData.Dalc.Especie.ObtenerEspecie();
                ddlEspecie.DataTextField = "Nombre";
                ddlEspecie.DataValueField = "Id";
                ddlEspecie.DataBind();
                ddlEspecie.Items.Insert(0, new ListItem("Seleccione", "0"));
            }
        }

        [WebMethod]
        public static string InsertaModulo(string nombre, string cantidadLineas, string largoLinea, string largoCuelga, string especie, string utmEInicio, string utmEFin, string utmNInicio, string utmNFin, string idCentroCultivo)
        {
            try
            {
                decimal estado;
                if (BusinessData.Dalc.Modulo.CreaModulo(int.Parse(idCentroCultivo), int.Parse(especie), nombre,
                    int.Parse(cantidadLineas), largoLinea, decimal.Parse(largoCuelga), utmEInicio, utmEFin, utmNInicio,
                    utmNFin, out estado))
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

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
    }
}