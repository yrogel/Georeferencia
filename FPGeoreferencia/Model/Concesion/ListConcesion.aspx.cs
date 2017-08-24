using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Concesion
{
    public partial class ListConcesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
            if (cliente == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }
                
            if (!IsPostBack)
            {
                lblNombre.Text = cliente.Nombre;
                LblDireccion.Text = cliente.Direccion;
                LblCorreo.Text = cliente.Correo;
                LblRut.Text = cliente.Rut;
                LblTelefono.Text = cliente.Telefono;
                Hididuser.Value = cliente.Id.ToString();
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

        [WebMethod]
        public static string InsertaConcesion(string codigo, string nombre, string direccion, string superficie, string idCliente)
        {
            try
            {
                //se crear el centro de cultivo
                if (BusinessData.Dalc.Concesion.CreaCentroCultivo(int.Parse(codigo), nombre, direccion, superficie, decimal.Parse(idCliente)))
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ListConcesion", "InsertaConcesion", exception.Message);
                return exception.Message;
            }
        }

        [WebMethod]
        public static string InsertaCoordenadas(string concesion, string utmX, string utmY)
        {
            try
            {
                //se crean las coordenadas del centro cultivo
                if (BusinessData.Dalc.Concesion.CreaCoordenadas(concesion,utmX,utmY))
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ListConcesion", "InsertaCoordenadas", exception.Message);
                return exception.Message;
            }
        }

        [WebMethod]
        public static string ValidaTotalConcesion(string idCliente)
        {
            try
            {
                //se valida la cantidad de concesiones que el cliente puede crear
                if (BusinessData.Dalc.Concesion.ValidaTotalConcesion(idCliente))
                    return "0";
                return "1";
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ListConcesion", "InsertaConcesion", exception.Message);
                return exception.Message;
            }
        }
    }
}