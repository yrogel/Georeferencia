using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FPGeoreferencia.Account
{
    public partial class ChangePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
            if (cliente == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }
                
            txtLogin.Text = cliente.Login;

            if (!IsPostBack)
            {
                txtPassword.Focus();
            }
        }

        protected void btnCambioClave_Click(object sender, EventArgs e)
        {
            string passwordActual = txtPassword.Text;
            string passwordNueva = txtPasswordNueva.Text;
            string correo = txtCorreo.Text;

            try
            {
                var cliente = (BusinessData.Entities.Cliente)Session["Cliente"];
                //se valida la password inicial con la ingresada
                if (cliente.Password.ToLower() == passwordActual.ToLower().Trim())
                {
                    if (BusinessData.Dalc.Cliente.CambiaClave(cliente, passwordNueva, correo))
                    {
                        Session.Clear();
                        Response.RedirectToRoute("Login");
                    }
                }
                else
                {
                    //mostrar mensaje indicando que la pass actual no coincide con la digitada
                    lblError.Text = "La clave actual no coincide con la ingresada";
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("ChangePass", "btnCambioClave_Click", exception.Message);
            }
        }
    }
}