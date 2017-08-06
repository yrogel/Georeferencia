using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Rol
    {
        public static DataSet ObtenerRol()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetRol");
                DataSet roles = database.ExecuteDataSet(cmd);

                return roles;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Rol", "ObtenerRol", exception.Message);
                return null;
            }
        }
    }
}