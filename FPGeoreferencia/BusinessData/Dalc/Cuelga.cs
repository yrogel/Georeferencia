using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Cuelga
    {
        public static string CreaTipoCuelga(string nombre, string metros)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsTipoCuelga");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "metros", DbType.String, metros);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cuelga", "CreaTipoCuelga", exception.Message);
                return "1";
            }
        }
        public static string CreaUbicacionCuelga(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsUbicacionCuelga");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cuelga", "CreaUbicacionCuelga", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerUbicacionCuelga()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetUbicacionCuelga");
                DataSet material = database.ExecuteDataSet(cmd);

                return material;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cuelga", "ObtenerUbicacionCuelga", exception.Message);
                return null;
            }
        }
    }
}