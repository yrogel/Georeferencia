using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Siembra
    {
        public static string CreaSiembra(string linea, string densidad, string tipoSiembra, string origenSemilla, string tamañoSemilla, string proveedor, string fecha)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsSiembra");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "idProveedor", DbType.Decimal, proveedor);
                database.AddInParameter(cmd, "idTipoSiembra", DbType.Decimal, tipoSiembra);
                database.AddInParameter(cmd, "origenSemilla", DbType.String, origenSemilla);
                database.AddInParameter(cmd, "tamañoSemilla", DbType.Decimal, tamañoSemilla);
                database.AddInParameter(cmd, "fechaSiembra", DbType.DateTime, fecha);
                database.AddInParameter(cmd, "densidad", DbType.Decimal, densidad);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Siembra", "CreaSiembra", exception.Message);
                return "1";
            }
        }
    }
}