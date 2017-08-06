using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Proveedor
    {
        public static string CreaProveedor(string nombre, string rut, string direccion, string telefono)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsProveedor");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "rut", DbType.String, rut);
                database.AddInParameter(cmd, "direccion", DbType.String, direccion);
                database.AddInParameter(cmd, "telefono", DbType.String, telefono);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Proveedor", "CreaProveedor", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerProveedor()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetProveedor");
                DataSet proveedor = database.ExecuteDataSet(cmd);

                return proveedor;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Proveedor", "ObtenerProveedor", exception.Message);
                return null;
            }
        }
    }
}