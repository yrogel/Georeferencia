﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace FPGeoreferencia.Model.Configuracion
{
    public partial class TipoVolumen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GrillasCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            (sender as ASPxGridView).DataBind();
        }

        [WebMethod]
        public static string InsertaTipoVolumen(string valor)
        {
            try
            {
                if (BusinessData.Dalc.Volumen.CreaTipoVolumen(valor) == "0")
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