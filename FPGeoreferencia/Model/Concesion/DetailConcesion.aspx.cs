using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FPGeoreferencia.Model.Concesion
{
    public partial class DetailConcesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
            string idCentroCultivo = Page.RouteData.Values["IdCentroCultivo"].ToString();
            HidIdCentroCultivo.Value = idCentroCultivo;
            lblCentroCultivo.Text = idCentroCultivo;
            if (cliente == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }

            if (!IsPostBack)
            {
                var concesion = BusinessData.Dalc.Concesion.ObtenerCentroCultivo(cliente.Id, decimal.Parse(idCentroCultivo));
                LblNombre.Text = concesion.Nombre;
                LblDireccion.Text = concesion.Direccion;
                LblSuperficie.Text = concesion.Superficie;
                LblModulos.Text = concesion.Modulos.ToString();
                LblLineas.Text = concesion.Lineas.ToString();

                var builder = new StringBuilder();
                foreach (var coordenada in concesion.Coordenadas)
                {
                    builder.Append(coordenada.UtmX + " <b>-</b> " + coordenada.UtmY).Append("<br>");
                }
                LblCoordenadas.Text = builder.ToString();
            }
            
        }

        protected void btnModulo_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionModulo", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnModulo_Click", exception.Message);
            }
        }

        protected void btnLinea_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionLinea", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnLinea_Click", exception.Message);
            }
        }

        protected void btnInfraestructura_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionInfraestructura", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnInfraestructura_Click", exception.Message);
            }
        }

        protected void btnSiembra_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionSiembra", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnSiembra_Click", exception.Message);
            }
        }

        protected void btnMuestreo_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionMuestreo", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnMuestreo_Click", exception.Message);
            }
        }

        protected void btnCosecha_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                if (cliente.Id != 0)
                {
                    Response.RedirectToRoute("ConcesionCosecha", new { Id = HidIdCentroCultivo.Value });
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("DetailConcesion", "btnCosecha_Click", exception.Message);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerCoordenadas(string id)
        {
            try
            {
                List<BusinessData.Entities.Coordenadas> coordenadas = BusinessData.Dalc.Concesion.ObtenerCoordenadas(id);
                return new JavaScriptSerializer().Serialize(coordenadas);
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}