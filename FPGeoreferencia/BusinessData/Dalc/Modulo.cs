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
        public static bool CreaModulo(int idCentroCultivo, int idEspecie, string nombre, int cantidadLineas, string largoLinea, decimal largoCuelga, string utmEInicio, string utmEFin, string utmNInicio, string utmNFin, out decimal estado)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsModulo");
                database.AddInParameter(cmd, "Id_Centro_Cultivo", DbType.Decimal, idCentroCultivo);
                database.AddInParameter(cmd, "Id_Especie", DbType.Decimal, idEspecie);
                database.AddInParameter(cmd, "Nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "Cantidad_Lineas", DbType.Int32, cantidadLineas);
                database.AddInParameter(cmd, "Largo_Linea", DbType.String, largoLinea);
                database.AddInParameter(cmd, "Largo_Cuelga", DbType.Decimal, largoCuelga);
                database.AddInParameter(cmd, "Coordenada_E_Inicio", DbType.String, utmEInicio);
                database.AddInParameter(cmd, "Coordenada_E_Fin", DbType.String, utmEFin);
                database.AddInParameter(cmd, "Coordenada_N_Inicio", DbType.String, utmNInicio);
                database.AddInParameter(cmd, "Coordenada_N_Fin", DbType.String, utmNFin);
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
    }
}