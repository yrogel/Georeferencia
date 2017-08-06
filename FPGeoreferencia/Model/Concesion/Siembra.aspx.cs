using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Concesion
{
    public partial class Siembra : System.Web.UI.Page
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

                ddLineasByModulo.DataSource = BusinessData.Dalc.Linea.ObtenerLineasByModulo(ddlModuloByCentro.SelectedValue);
                ddLineasByModulo.DataTextField = "Nombre";
                ddLineasByModulo.DataValueField = "Id";
                ddLineasByModulo.DataBind();
                ddLineasByModulo.Items.Insert(0, new ListItem("Seleccione", "0"));
                //gridBoyas.DataBind();

                ddlModulo.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModulo.DataTextField = "Nombre";
                ddlModulo.DataValueField = "Id";
                ddlModulo.DataBind();
                ddlModulo.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlProveedor.DataSource = BusinessData.Dalc.Proveedor.ObtenerProveedor();
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "Id";
                ddlProveedor.DataBind();
                ddlProveedor.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlLinea.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlTipoSiembra.DataSource = BusinessData.Dalc.TipoSiembra.ObtenerTipoSiembra();
                ddlTipoSiembra.DataTextField = "Nombre";
                ddlTipoSiembra.DataValueField = "Id";
                ddlTipoSiembra.DataBind();
                ddlTipoSiembra.Items.Insert(0, new ListItem("Seleccione", "0"));
            }
        }
        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
        protected void Modulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddLineasByModulo.DataSource = BusinessData.Dalc.Linea.ObtenerLineasByModulo(ddlModuloByCentro.SelectedValue);
            ddLineasByModulo.DataTextField = "Nombre";
            ddLineasByModulo.DataValueField = "Id";
            ddLineasByModulo.DataBind();
            ddLineasByModulo.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerLineaByModulo(string modulo)
        {
            try
            {
                var lineas = BusinessData.Dalc.Linea.ObtenerLineas(modulo);
                return new JavaScriptSerializer().Serialize(lineas);
            }
            catch (Exception exception)
            {
                return null;
            }
        }

        [WebMethod]
        public static string InsertaSiembra(string modulo, string linea, string densidad, string tipoSiembra, string origenSemilla, string tamañoSemilla, string proveedor, string fecha)
        {
            try
            {
                if (BusinessData.Dalc.Siembra.CreaSiembra(linea, densidad, tipoSiembra, origenSemilla, tamañoSemilla, proveedor, fecha) == "0")
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}