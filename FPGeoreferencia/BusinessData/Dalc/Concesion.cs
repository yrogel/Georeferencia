using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using FPGeoreferencia.BusinessData.Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Concesion
    {
        public static bool CreaCentroCultivo(int codigo, string nombre, string direccion, string superficie, decimal idCliente)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsCentroCultivo");
                database.AddInParameter(cmd, "id", DbType.Decimal, codigo);
                database.AddInParameter(cmd, "id_cliente", DbType.Decimal, idCliente);
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.AddInParameter(cmd, "direccion", DbType.String, direccion);
                database.AddInParameter(cmd, "superficie", DbType.String, superficie);
                object resultado = database.ExecuteScalar(cmd);
                
                return resultado.ToString() == "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Concesion", "CreaCentroCultivo", exception.Message);
                return false;
            }
        }

        public static CentroCultivo ObtenerCentroCultivo(decimal idCliente, decimal idCentroCultivo)
        {
            var centroCultivo = new CentroCultivo();
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetCentroCultivoByCode");
                database.AddInParameter(cmd, "id_cliente", DbType.Decimal, idCliente);
                database.AddInParameter(cmd, "id_centro_cultivo", DbType.Decimal, idCentroCultivo);

                using (var dataReader = database.ExecuteReader(cmd))
                {
                    if (dataReader.Read())
                    {
                        if (!(dataReader["Id"] is DBNull) && (dataReader["Id"] != null))
                            centroCultivo.Id = (int) dataReader["Id"];
                        if (!(dataReader["Nombre"] is DBNull) && (dataReader["Nombre"] != null))
                            centroCultivo.Nombre = (string) dataReader["Nombre"];
                        if (!(dataReader["Direccion"] is DBNull) && (dataReader["Direccion"] != null))
                            centroCultivo.Direccion = (string) dataReader["Direccion"];
                        if (!(dataReader["Superficie"] is DBNull) && (dataReader["Superficie"] != null))
                            centroCultivo.Superficie = (string) dataReader["Superficie"];
                        if (!(dataReader["Total_Modulos"] is DBNull) && (dataReader["Total_Modulos"] != null))
                            centroCultivo.Modulos = (int) dataReader["Total_Modulos"];
                        if (!(dataReader["Total_Lineas"] is DBNull) && (dataReader["Total_Lineas"] != null))
                            centroCultivo.Lineas = (int) dataReader["Total_Lineas"];
                        centroCultivo.Coordenadas = ObtenerCoordenadas(idCentroCultivo.ToString());
                    }
                }
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Concesion", "ObtenerCentroCultivo", exception.Message);
            }
            return centroCultivo;
        }

        public static bool CreaCoordenadas(string concesion, string utmX, string utmY)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsCoordenadas");
                database.AddInParameter(cmd, "concesion", DbType.Decimal, concesion);
                database.AddInParameter(cmd, "utmX", DbType.String, utmX);
                database.AddInParameter(cmd, "utmY", DbType.String, utmY);
               
                database.ExecuteNonQuery(cmd);

                return true;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Concesion", "CreaCoordenadas", exception.Message);
                return false;
            }
        }

        public static List<Entities.Coordenadas> ObtenerCoordenadas(string idCentroCultivo)
        {
            var listCoordenadas = new List<Entities.Coordenadas>();
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetCoordenadas");
                database.AddInParameter(cmd, "id_concesion", DbType.Decimal, idCentroCultivo);

                using (var dataReader = database.ExecuteReader(cmd))
                {
                    while (dataReader.Read())
                    {
                        var coordenada = new Entities.Coordenadas();
                        if (!(dataReader["Id"] is DBNull) && (dataReader["Id"] != null))
                            coordenada.Id = int.Parse(dataReader["Id"].ToString());
                        if (!(dataReader["Coordenada_X"] is DBNull) && (dataReader["Coordenada_X"] != null))
                            coordenada.UtmX = (string)dataReader["Coordenada_X"];
                        if (!(dataReader["Coordenada_Y"] is DBNull) && (dataReader["Coordenada_Y"] != null))
                            coordenada.UtmY = (string)dataReader["Coordenada_Y"];
                        listCoordenadas.Add(coordenada);
                    }
                }
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Concesion", "ObtenerCoordenadas", exception.Message);
            }
            return listCoordenadas;
        }

        public static bool ValidaTotalConcesion(string idCliente)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("ValidaTotalConcesion");
                database.AddInParameter(cmd, "idCliente", DbType.Decimal, idCliente);

                object resultado = database.ExecuteScalar(cmd);

                return resultado.ToString() == "1";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Concesion", "ValidaTotalConcesion", exception.Message);
                return false;
            }
        }
    }
}