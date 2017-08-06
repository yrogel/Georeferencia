using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Boya
    {
        public static string CreaBoya(string linea, string cantidad, string volumen, string material, string espesor, string proveedor, string fecha)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsBoya");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "idProveedor", DbType.Decimal, proveedor);
                database.AddInParameter(cmd, "idMaterial", DbType.Decimal, material);
                database.AddInParameter(cmd, "cantidad", DbType.Int32, cantidad);
                database.AddInParameter(cmd, "volumen", DbType.Int32, volumen);
                database.AddInParameter(cmd, "espesor", DbType.Decimal, espesor);
                database.AddInParameter(cmd, "fechaIngresoAgua", DbType.DateTime, fecha);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Boya", "CreaBoya", exception.Message);
                return "1";
            }
        }
    }
}