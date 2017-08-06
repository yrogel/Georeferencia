using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class TipoSiembra
    {
        public static string CreaTipoSiembra(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsTipoSiembra");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("TipoSiembra", "CreaTipoSiembra", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerTipoSiembra()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetTipoSiembra");
                DataSet tipoSiembra = database.ExecuteDataSet(cmd);

                return tipoSiembra;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("TipoSiembra", "ObtenerTipoSiembra", exception.Message);
                return null;
            }
        }
    }
}