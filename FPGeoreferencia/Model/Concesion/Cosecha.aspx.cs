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
    public partial class Cosecha : System.Web.UI.Page
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

                ddlModulo.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModulo.DataTextField = "Nombre";
                ddlModulo.DataValueField = "Id";
                ddlModulo.DataBind();
                ddlModulo.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlTipoCosecha.DataSource = BusinessData.Dalc.Cosecha.ObtenerTipoCosecha();
                ddlTipoCosecha.DataTextField = "Nombre";
                ddlTipoCosecha.DataValueField = "Id";
                ddlTipoCosecha.DataBind();
                ddlTipoCosecha.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlFormaCosecha.DataSource = BusinessData.Dalc.Cosecha.ObtenerFormaCosecha();
                ddlFormaCosecha.DataTextField = "Nombre";
                ddlFormaCosecha.DataValueField = "Id";
                ddlFormaCosecha.DataBind();
                ddlFormaCosecha.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlLinea.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlEspecie.DataSource = BusinessData.Dalc.Especie.ObtenerEspecie();
                ddlEspecie.DataTextField = "Nombre";
                ddlEspecie.DataValueField = "Id";
                ddlEspecie.DataBind();
                ddlEspecie.Items.Insert(0, new ListItem("Seleccione", "0"));
            }
        }

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
        protected void GrillasEspeciesCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
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
        public static string SaveOrUpdateCosecha(string modulo, string linea, string tipoCosecha, string formaCosecha,string kgSucioMetro, string kgSucioCuelga, string kgLimpioMetro, string kgLimpioCuelga, string numeroIndividuoMts, string numeroIndividuoKg, string tallaPromedio, string factorCondicion, string fecha, string idCosecha)
        {
            try
            {
                if (BusinessData.Dalc.Cosecha.CreaOActualizaCosecha(linea, tipoCosecha, formaCosecha, kgSucioMetro, kgSucioCuelga, kgLimpioMetro, kgLimpioCuelga, numeroIndividuoMts, numeroIndividuoKg, tallaPromedio, factorCondicion, fecha, idCosecha) == "0")
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerCosecha(string id)
        {
            try
            {
                BusinessData.Entities.Cosecha cosecha = BusinessData.Dalc.Cosecha.ObtenerCosecha(id);
                return new JavaScriptSerializer().Serialize(cosecha);
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaFaunaAcompañante(string idCosecha, string especie, string unidadMedida)
        {
            try
            {
                return BusinessData.Dalc.Especie.InsertaFaunaAcompañante(idCosecha, especie, unidadMedida,"C");
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}