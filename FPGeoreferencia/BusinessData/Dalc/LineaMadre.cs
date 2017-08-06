using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class LineaMadre
    {
        public static string CreaLineaMadre(string linea, string materialCabo, string diametroCabo, string largoCabo, string proveedor, string fecha)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsLineaMadre");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "idProveedor", DbType.Decimal, proveedor);
                database.AddInParameter(cmd, "materialCabo", DbType.String, materialCabo);
                database.AddInParameter(cmd, "diametroCabo", DbType.Decimal, diametroCabo);
                database.AddInParameter(cmd, "largoCabo", DbType.Decimal, largoCabo);
                database.AddInParameter(cmd, "fechaInstalacion", DbType.DateTime, fecha);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("LineaMadre", "CreaLineaMadre", exception.Message);
                return "1";
            }
        }
    }
}