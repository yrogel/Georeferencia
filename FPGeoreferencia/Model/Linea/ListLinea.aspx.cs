using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Linea
{
    public partial class ListLinea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idCentroCultivo = Page.RouteData.Values["Id"].ToString();
            HidIdCentroCultivo.Value = idCentroCultivo;
            lblCentroCultivo.Text = idCentroCultivo;

            if (!IsPostBack)
            {
                ddlModuloByCentro.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModuloByCentro.DataTextField = "Nombre";
                ddlModuloByCentro.DataValueField = "Id";
                ddlModuloByCentro.DataBind();

                ddlModulo.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModulo.DataTextField = "Nombre";
                ddlModulo.DataValueField = "Id";
                ddlModulo.DataBind();
                ddlModulo.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlTipoLinea.DataSource = BusinessData.Dalc.Linea.ObtenerTipoLinea();
                ddlTipoLinea.DataTextField = "Nombre";
                ddlTipoLinea.DataValueField = "Id";
                ddlTipoLinea.DataBind();
                ddlTipoLinea.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlTipoCuelga.DataSource = BusinessData.Dalc.Linea.ObtenerTipoCuelga();
                ddlTipoCuelga.DataTextField = "Nombre";
                ddlTipoCuelga.DataValueField = "Id";
                ddlTipoCuelga.DataBind();
                ddlTipoCuelga.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlEspecie.DataSource = BusinessData.Dalc.Especie.ObtenerEspecie();
                ddlEspecie.DataTextField = "Nombre";
                ddlEspecie.DataValueField = "Id";
                ddlEspecie.DataBind();
                ddlEspecie.Items.Insert(0, new ListItem("Seleccione", "0"));
                
            }
        }

        [WebMethod]
        public static string InsertaLinea(string modulo, string nombre, string metros, string tipoLinea, string totalCuelgas, string largoCuelga, string tipoCuelga, string utmEInicio, string utmEFin, string utmNInicio, string utmNFin, string idCentroCultivo, string especie)
        {
            try
            {
                decimal estado;
                if (BusinessData.Dalc.Linea.CreaLinea(nombre,modulo,metros,totalCuelgas,largoCuelga,utmEInicio,utmEFin,utmNInicio,utmNFin,tipoLinea,tipoCuelga, especie,out estado))
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
                BusinessData.Dalc.Log.InsLog("ListLinea", "InsertaLinea", exception.Message);
                return exception.Message;
            }
        }

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }

        protected void Modulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridLineas.DataBind();
        }
    }
}