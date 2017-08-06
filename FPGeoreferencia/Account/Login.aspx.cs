using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FPGeoreferencia.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtLogin.Focus();
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtPassword.Text;
            try
            {
                BusinessData.Entities.Cliente cliente = BusinessData.Dalc.Cliente.ValidaCliente(login, password);
                if (cliente.Id != 0)
                {
                    Session.Add("Cliente", cliente);
                    //se obliga al cliente a cambiar su clave cuando ingresa por primera vez al sistema
                    Response.RedirectToRoute(cliente.CambioClave == 0 ? "ChangePass" : "Index");
                }
                else
                {
                    //Usuario o Contraseña con error
                    lblError.Text = "Usuario o Contraseña son incorrectos";
                }
            }
            catch (Exception exception)
            {
                BusinessData.Dalc.Log.InsLog("Login", "btnLogin_Click", exception.Message);
            }
        }
    }
}