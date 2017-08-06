using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Especie
    {
        public static string CreaEspecie(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsEspecie");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Especie", "CreaEspecie", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerEspecie()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetEspecie");
                DataSet especies = database.ExecuteDataSet(cmd);

                return especies;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Especie", "ObtenerEspecie", exception.Message);
                return null;
            }
        }
    }
}