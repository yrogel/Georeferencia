using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace FPGeoreferencia.BusinessData.Utils
{
    public class Correo
    {
        readonly SmtpClient _server = new SmtpClient(ConfigurationManager.AppSettings["ServidorCorreo"], int.Parse(ConfigurationManager.AppSettings["Puerto"]));
        public Correo()
        {
            _server.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Correo"], ConfigurationManager.AppSettings["Password"]);
            _server.EnableSsl = true;
        }
 
        public void MandarCorreo(MailMessage mensaje)
        {
            _server.Send(mensaje);
        }
    }
        
}