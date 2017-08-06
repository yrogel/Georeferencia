using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Fondeo
    {
        public static string CreaFondeo(string linea, string numero, string tamaño, string material, string forma, string profundidad, string materialCabo, string diametroCabo, string largoCabo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsFondeo");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "numero", DbType.String, numero);
                database.AddInParameter(cmd, "tamaño", DbType.Decimal, tamaño);
                database.AddInParameter(cmd, "material", DbType.String, material);
                database.AddInParameter(cmd, "forma", DbType.String, forma);
                database.AddInParameter(cmd, "profunfidad", DbType.Decimal, profundidad);
                database.AddInParameter(cmd, "materialCabo", DbType.String, materialCabo);
                database.AddInParameter(cmd, "diametroCabo", DbType.Decimal, diametroCabo);
                database.AddInParameter(cmd, "largoCabo", DbType.Decimal, largoCabo);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Fondeo", "CreaFondeo", exception.Message);
                return "1";
            }
        }
    }
}