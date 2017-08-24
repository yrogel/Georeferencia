using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Usuario
    {
        public static string CreaUsuario(string login, string password, string rol, string nombre, string rut, string direccion, string telefono, string correo, string totalConseciones, string totalModulos)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsUsuario");
                database.AddInParameter(cmd, "login", DbType.String, login);
                database.AddInParameter(cmd, "password", DbType.String, password);
                database.AddInParameter(cmd, "rol", DbType.String, rol);
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "rut", DbType.String, rut);
                database.AddInParameter(cmd, "direccion", DbType.String, direccion);
                database.AddInParameter(cmd, "telefono", DbType.String, telefono);
                database.AddInParameter(cmd, "correo", DbType.String, correo);
                database.AddInParameter(cmd, "totalConseciones", DbType.Int32, totalConseciones);
                database.AddInParameter(cmd, "totalModulos", DbType.Int32, totalModulos);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Usuario", "CreaUsuario", exception.Message);
                return "1";
            }
        }
    }
}