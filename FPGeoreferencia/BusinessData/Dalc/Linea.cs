using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Linea
    {
        public static bool CreaLinea(string nombre, string idModulo, string metros, string totalCuelgas, string largoCuelga, string utmEInicio, string utmEFin, string utmNInicio, string utmNFin, string tipoLinea, string tipoCuelga, out decimal estado)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsLinea");
                database.AddInParameter(cmd, "idModulo", DbType.Decimal, idModulo);
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "metros", DbType.Decimal, metros);
                database.AddInParameter(cmd, "totalCuelgas", DbType.Int32, totalCuelgas);
                database.AddInParameter(cmd, "largoCuelga", DbType.Decimal, largoCuelga);
                database.AddInParameter(cmd, "utmEInicio", DbType.String, utmEInicio);
                database.AddInParameter(cmd, "utmEFin", DbType.String, utmEFin);
                database.AddInParameter(cmd, "utmNInicio", DbType.String, utmNInicio);
                database.AddInParameter(cmd, "utmNFin", DbType.String, utmNFin);
                database.AddInParameter(cmd, "tipoLinea", DbType.Decimal, tipoLinea);
                database.AddInParameter(cmd, "tipoCuelga", DbType.Decimal, tipoCuelga);
                database.AddOutParameter(cmd, "estado", DbType.Decimal, 9);
                database.ExecuteNonQuery(cmd);

                estado = decimal.Parse(database.GetParameterValue(cmd, "estado").ToString());

                return true;
            }
            catch (Exception exception)
            {
                //insertar log de error
                estado = 2;
                Log.InsLog("Linea", "CreaLinea", exception.Message);
                return false;
            }
        }

        public static DataSet ObtenerTipoLinea()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetTipoLinea");
                DataSet tipoLineas = database.ExecuteDataSet(cmd);

                return tipoLineas;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Linea", "ObtenerTipoLinea", exception.Message);
                return null;
            }
        }

        public static DataSet ObtenerTipoCuelga()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetTipoCuelga");
                DataSet tipoCuelgas = database.ExecuteDataSet(cmd);

                return tipoCuelgas;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Linea", "ObtenerTipoCuelga", exception.Message);
                return null;
            }
        }

        public static DataSet ObtenerLineasByModulo(string modulo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetLineaByModulo");
                database.AddInParameter(cmd, "id_modulo", DbType.Decimal, modulo);
                DataSet lineas = database.ExecuteDataSet(cmd);

                return lineas;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Linea", "ObtenerLineasByModulo", exception.Message);
                return null;
            }
        }

        public static List<Entities.Linea> ObtenerLineas(string modulo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetLineaByModulo");
                database.AddInParameter(cmd, "id_modulo", DbType.Decimal, modulo);
                var lineas = new List<Entities.Linea>();
                using (var dataReader = database.ExecuteReader(cmd))
                {
                    while (dataReader.Read())
                    {
                        var linea = new Entities.Linea();

                        if (!(dataReader["Id"] is DBNull) && (dataReader["Id"] != null))
                            linea.Id = int.Parse(dataReader["Id"].ToString());
                        if (!(dataReader["Nombre"] is DBNull) && (dataReader["Nombre"] != null))
                            linea.Nombre = dataReader["Nombre"].ToString();
                        lineas.Add(linea);
                    }
                }
                return lineas;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Linea", "ObtenerLineas", exception.Message);
            }
            return null;
        }

        public static string CreaTipoLinea(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsTipoLinea");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Linea", "CreaTipoLinea", exception.Message);
                return "1";
            }
        }
    }
}