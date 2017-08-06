using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Volumen
    {
        public static string CreaTipoVolumen(string valor)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsTipoVolumen");
                database.AddInParameter(cmd, "valor", DbType.String, valor);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Volumen", "CreaTipoVolumen", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerVolumen()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetVolumen");
                DataSet volumen = database.ExecuteDataSet(cmd);

                return volumen;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Volumen", "ObtenerVolumen", exception.Message);
                return null;
            }
        }
    }
}