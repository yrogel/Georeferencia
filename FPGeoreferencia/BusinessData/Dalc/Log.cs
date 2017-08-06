using System;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Log
    {
        public static void InsLog(string pagina, string metodo, string error)
        {
            var database = DatabaseFactory.CreateDatabase();
            var cmd = database.GetStoredProcCommand("InsLog");
            database.AddInParameter(cmd, "pagina", DbType.String, pagina);
            database.AddInParameter(cmd, "metodo", DbType.String, metodo);
            database.AddInParameter(cmd, "error", DbType.String, error);
            database.ExecuteNonQuery(cmd);
        }
    }
}