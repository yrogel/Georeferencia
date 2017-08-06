using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using FPGeoreferencia.BusinessData.Utils;

namespace FPGeoreferencia.Account
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        [WebMethod]
        public static string RecuperarClave(string correo)
        {
            try
            {
                if (BusinessData.Dalc.Cliente.ValidaCorreo(correo))
                {
                    var random = new Random(DateTime.Now.Millisecond);
                    int contraseña = random.Next(100000, 999999);
                    var correoObj = new Correo();
                    var mnsj = new MailMessage { Subject = ConfigurationManager.AppSettings["Asunto"] };

                    mnsj.To.Add(new MailAddress(correo));
                    mnsj.From = new MailAddress(ConfigurationManager.AppSettings["Correo"], ConfigurationManager.AppSettings["AliasCorreo"]);
                    mnsj.Body = string.Format(ConfigurationManager.AppSettings["Mensaje"], "<strong>" + contraseña + "</strong>");
                    mnsj.IsBodyHtml = true;
                    mnsj.BodyEncoding = Encoding.UTF8;
                    correoObj.MandarCorreo(mnsj);
                    //lblError.Text = "Su nueva contraseña fue enviada con exito.";
                    BusinessData.Dalc.Cliente.ActualizarContraseña(correo, contraseña.ToString());
                    return "0";
                }
                return "1";
            }
            catch (SmtpException exception)
            {
                BusinessData.Dalc.Log.InsLog("RecuperarContraseña", "RecuperarClave", exception.Message);
                return "2";
            }
        }
    }
}