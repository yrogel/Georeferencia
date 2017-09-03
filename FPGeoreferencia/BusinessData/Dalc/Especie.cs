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

        public static string InsertaFaunaAcompañante(string idTipo, string especie, string unidadMedida, string tipo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsFaunaAcompañante");
                database.AddInParameter(cmd, "idEspecie", DbType.Decimal, especie);
                database.AddInParameter(cmd, "idTipo", DbType.Decimal, idTipo);
                database.AddInParameter(cmd, "unidadMedida", DbType.String, unidadMedida);
                database.AddInParameter(cmd, "tipo", DbType.String, tipo);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Especie", "InsertaFaunaAcompañante", exception.Message);
                return "1";
            }
        }
    }
}