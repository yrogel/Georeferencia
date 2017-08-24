using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Modulo
    {
        public static bool CreaModulo(int idCentroCultivo, string nombre, out decimal estado)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsModulo");
                database.AddInParameter(cmd, "Id_Centro_Cultivo", DbType.Decimal, idCentroCultivo);
                database.AddInParameter(cmd, "Nombre", DbType.String, nombre);
                database.AddOutParameter(cmd, "estado", DbType.Decimal, 9);
                database.ExecuteNonQuery(cmd);

                estado = decimal.Parse(database.GetParameterValue(cmd, "estado").ToString());

                return true;
            }
            catch (Exception exception)
            {
                //insertar log de error
                estado = 2;
                Log.InsLog("Modulo", "CreaModulo", exception.Message);
                return false;
            }
        }

        public static DataSet ObtenerModuloByCentro(string idCentroCultivo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetModuloByCode");
                database.AddInParameter(cmd, "id_centro_cultivo", DbType.Decimal, idCentroCultivo);
                DataSet modulos = database.ExecuteDataSet(cmd);

                return modulos;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Modulo", "ObtenerModuloByCentro", exception.Message);
                return null;
            }
        }

        public static bool CreaCoordenadas(string modulo, string utmX, string utmY)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsCoordenadasModulo");
                database.AddInParameter(cmd, "modulo", DbType.Int32, modulo);
                database.AddInParameter(cmd, "utmX", DbType.String, utmX);
                database.AddInParameter(cmd, "utmY", DbType.String, utmY);

                database.ExecuteNonQuery(cmd);

                return true;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Modulo", "CreaCoordenadas", exception.Message);
                return false;
            }
        }
    }
}