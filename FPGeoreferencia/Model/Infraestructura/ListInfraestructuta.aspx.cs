using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Infraestructura
{
    public partial class ListInfraestructuta : System.Web.UI.Page
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

                ddlMaterial.DataSource = BusinessData.Dalc.Material.ObtenerMaterial();
                ddlMaterial.DataTextField = "Nombre";
                ddlMaterial.DataValueField = "Id";
                ddlMaterial.DataBind();
                ddlMaterial.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlProveedor.DataSource = BusinessData.Dalc.Proveedor.ObtenerProveedor();
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "Id";
                ddlProveedor.DataBind();
                ddlProveedor.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlVolumen.DataSource = BusinessData.Dalc.Volumen.ObtenerVolumen();
                ddlVolumen.DataTextField = "Valor";
                ddlVolumen.DataValueField = "Id";
                ddlVolumen.DataBind();
                ddlVolumen.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlLinea.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlModuloLineaMadre.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModuloLineaMadre.DataTextField = "Nombre";
                ddlModuloLineaMadre.DataValueField = "Id";
                ddlModuloLineaMadre.DataBind();
                ddlModuloLineaMadre.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlProveedorLineaMadre.DataSource = BusinessData.Dalc.Proveedor.ObtenerProveedor();
                ddlProveedorLineaMadre.DataTextField = "Nombre";
                ddlProveedorLineaMadre.DataValueField = "Id";
                ddlProveedorLineaMadre.DataBind();
                ddlProveedorLineaMadre.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlLineaLineaMadre.Items.Insert(0, new ListItem("Seleccione", "0"));

                ddlModuloFondeo.DataSource = BusinessData.Dalc.Modulo.ObtenerModuloByCentro(idCentroCultivo);
                ddlModuloFondeo.DataTextField = "Nombre";
                ddlModuloFondeo.DataValueField = "Id";
                ddlModuloFondeo.DataBind();
                ddlModuloFondeo.Items.Insert(0, new ListItem("Seleccione", "0"));                

                ddlLineaFondeo.Items.Insert(0, new ListItem("Seleccione", "0"));
                
            }
        }

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
        protected void GrillaLineaMadreCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }
        protected void GrillaFondeoCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
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
            //gridBoyas.DataBind();
        }

        [WebMethod]
        public static string InsertaBoya(string modulo, string linea, string cantidad, string volumen, string material, string espesor, string proveedor, string fecha)
        {
            try
            {
                if(BusinessData.Dalc.Boya.CreaBoya(linea, cantidad, volumen, material, espesor, proveedor, fecha)=="0")
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaLineaMadre(string modulo, string linea, string materialCabo, string diametroCabo, string largoCabo, string proveedor, string fecha)
        {
            try
            {
                if (BusinessData.Dalc.LineaMadre.CreaLineaMadre(linea, materialCabo, diametroCabo, largoCabo, proveedor, fecha) == "0")
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaFondeo(string modulo, string linea, string numero, string tamaño, string material, string forma, string profundidad, string materialCabo, string diametroCabo, string largoCabo)
        {
            try
            {
                if (BusinessData.Dalc.Fondeo.CreaFondeo(linea, numero, tamaño, material, forma, profundidad, materialCabo, diametroCabo, largoCabo) == "0")
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
    }
}