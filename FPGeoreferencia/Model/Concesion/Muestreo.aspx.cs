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
    public partial class Muestreo : System.Web.UI.Page
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

                ddlUbicacionCuelga.DataSource = BusinessData.Dalc.Cuelga.ObtenerUbicacionCuelga();
                ddlUbicacionCuelga.DataTextField = "Nombre";
                ddlUbicacionCuelga.DataValueField = "Id";
                ddlUbicacionCuelga.DataBind();
                ddlUbicacionCuelga.Items.Insert(0, new ListItem("Seleccione", "0"));

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
        public static string SaveOrUpdateMuestreo(string modulo, string linea, string hora, string minutos, string temperatura, string transparencia, string numeroIndividuoMts, string numeroIndividuoKg, string tallaPromedio, string numeroMuertosMts, string factorCondicion, string ubicacionCuelga, string coordenadasMuestreo, string fecha, string idMuestreo)
        {
            try
            {
                var horaMinutos = hora + ":" + minutos;
                if (BusinessData.Dalc.Muestreo.CreaOActualizaMuestreo(linea, horaMinutos, temperatura, transparencia, numeroIndividuoMts, numeroIndividuoKg, tallaPromedio, numeroMuertosMts, factorCondicion, ubicacionCuelga, coordenadasMuestreo, fecha, idMuestreo) == "0")
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
        public static string ObtenerMuestreo(string id)
        {
            try
            {
                BusinessData.Entities.Muestreo muestreo = BusinessData.Dalc.Muestreo.ObtenerMuestreo(id);
                return new JavaScriptSerializer().Serialize(muestreo);
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaFaunaAcompañante(string idMuestreo, string especie, string unidadMedida)
        {
            try
            {
                return BusinessData.Dalc.Especie.InsertaFaunaAcompañante(idMuestreo, especie, unidadMedida, "M");
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}