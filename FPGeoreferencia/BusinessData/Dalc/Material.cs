using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Material
    {
        public static string CreaMaterial(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsMaterial");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Material", "CreaMaterial", exception.Message);
                return "1";
            }
        }
        public static DataSet ObtenerMaterial()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetMaterial");
                DataSet material = database.ExecuteDataSet(cmd);

                return material;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Material", "ObtenerMaterial", exception.Message);
                return null;
            }
        }
    }
}