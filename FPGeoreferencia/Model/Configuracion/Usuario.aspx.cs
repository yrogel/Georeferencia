using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Configuracion
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlRol.DataSource = BusinessData.Dalc.Rol.ObtenerRol();
                ddlRol.DataTextField = "Nombre";
                ddlRol.DataValueField = "Id";
                ddlRol.DataBind();
                ddlRol.Items.Insert(0, new ListItem("Seleccione", "0"));
            }
        }

        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }

        [WebMethod]
        public static string InsertaUsuario(string login, string password, string rol, string nombre, string rut, string direccion, string telefono, string correo, string totalConcesiones, string totalModulos)
        {
            try
            {
                if (BusinessData.Dalc.Usuario.CreaUsuario(login, password, rol, nombre, rut, direccion, telefono, correo, totalConcesiones, totalModulos) == "0")
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