using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Muestreo
    {
        public static string CreaOActualizaMuestreo(string linea, string horaMinutos, string temperatura, string transparencia, string numeroIndividuoMts, string numeroIndividuoKg, string tallaPromedio, string numeroMuertosMts, string factorCondicion, string ubicacionCuelga, string especie, string coordenadasMuestreo, string fecha, string unidadMedida, string idMuestreo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("SaveOrUpdateMuestreo");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "idUbicacionCuelga", DbType.Decimal, ubicacionCuelga);
                database.AddInParameter(cmd, "fechaMuestreo", DbType.Date, fecha);
                database.AddInParameter(cmd, "horaMuestreo", DbType.Time, horaMinutos);
                database.AddInParameter(cmd, "temperatura", DbType.Decimal, temperatura);
                database.AddInParameter(cmd, "transparencia", DbType.String, transparencia);
                database.AddInParameter(cmd, "numeroIndividuosMt", DbType.Int32, numeroIndividuoMts);
                database.AddInParameter(cmd, "numeroIndividuosKg", DbType.Int32, numeroIndividuoKg);
                database.AddInParameter(cmd, "tallaPromedio", DbType.Decimal, tallaPromedio);
                database.AddInParameter(cmd, "numeroMuertos", DbType.Int32, numeroMuertosMts);
                database.AddInParameter(cmd, "factorCondicion", DbType.String, factorCondicion);
                database.AddInParameter(cmd, "utmEN", DbType.String, coordenadasMuestreo);
                database.AddInParameter(cmd, "unidadMedida", DbType.String, unidadMedida);
                database.AddInParameter(cmd, "especie", DbType.Decimal, especie);
                database.AddInParameter(cmd, "idMuestreo", DbType.Int32, idMuestreo);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Muestreo", "CreaOActualizaMuestreo", exception.Message);
                return "1";
            }
        }

        public static Entities.Muestreo ObtenerMuestreo(string id)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetMuestreoById");
                database.AddInParameter(cmd, "id", DbType.Decimal, id);
                var muestreo = new Entities.Muestreo();
                using (var dataReader = database.ExecuteReader(cmd))
                {
                    if (dataReader.Read())
                    {
                        if (!(dataReader["Id_Linea"] is DBNull) && (dataReader["Id_Linea"] != null))
                            muestreo.IdLinea = decimal.Parse(dataReader["Id_Linea"].ToString());
                        if (!(dataReader["Id_Ubicacion_Cuelga"] is DBNull) && (dataReader["Id_Ubicacion_Cuelga"] != null))
                            muestreo.IdUbicacionCuelga = decimal.Parse(dataReader["Id_Ubicacion_Cuelga"].ToString());
                        if (!(dataReader["Fecha_Muestreo"] is DBNull) && (dataReader["Fecha_Muestreo"] != null))
                        {
                            muestreo.FechaMuestreo = dataReader["Fecha_Muestreo"].ToString();
                            string[] fecha = muestreo.FechaMuestreo.Split(' ');
                            muestreo.FechaMuestreo = fecha[0];
                        }
                            
                        if (!(dataReader["Hora_Muestreo"] is DBNull) && (dataReader["Hora_Muestreo"] != null))
                        {
                            muestreo.HoraMuestreo = dataReader["Hora_Muestreo"].ToString();
                            string[] valores = muestreo.HoraMuestreo.Split(':');
                            muestreo.Hora = valores[0];
                            muestreo.Minutos = valores[1];
                        }
                            
                        if (!(dataReader["Temperatura"] is DBNull) && (dataReader["Temperatura"] != null))
                            muestreo.Temperatura = decimal.Parse(dataReader["Temperatura"].ToString());
                        if (!(dataReader["Transparencia"] is DBNull) && (dataReader["Transparencia"] != null))
                            muestreo.Transparencia = dataReader["Transparencia"].ToString();
                        if (!(dataReader["Numero_Individuos_Mt"] is DBNull) && (dataReader["Numero_Individuos_Mt"] != null))
                            muestreo.NumeroIndividuosMt = int.Parse(dataReader["Numero_Individuos_Mt"].ToString());
                        if (!(dataReader["Numero_Individuos_Kg"] is DBNull) && (dataReader["Numero_Individuos_Kg"] != null))
                            muestreo.NumeroIndividuosKg = int.Parse(dataReader["Numero_Individuos_Kg"].ToString());
                        if (!(dataReader["Talla_Promedio"] is DBNull) && (dataReader["Talla_Promedio"] != null))
                            muestreo.TallaPromedio = decimal.Parse(dataReader["Talla_Promedio"].ToString());
                        if (!(dataReader["Numero_Muertos"] is DBNull) && (dataReader["Numero_Muertos"] != null))
                            muestreo.NumeroMuertos = int.Parse(dataReader["Numero_Muertos"].ToString());
                        if (!(dataReader["Factor_Condicion"] is DBNull) && (dataReader["Factor_Condicion"] != null))
                            muestreo.FactorCondicion = dataReader["Factor_Condicion"].ToString();
                        if (!(dataReader["Utm_E_N"] is DBNull) && (dataReader["Utm_E_N"] != null))
                            muestreo.UtmEn = dataReader["Utm_E_N"].ToString();
                        if (!(dataReader["Id_Modulo"] is DBNull) && (dataReader["Id_Modulo"] != null))
                            muestreo.IdModulo = decimal.Parse(dataReader["Id_Modulo"].ToString());
                        if (!(dataReader["Id_Especie"] is DBNull) && (dataReader["Id_Especie"] != null))
                            muestreo.IdEspecie = decimal.Parse(dataReader["Id_Especie"].ToString());
                        if (!(dataReader["Unidad_Medida"] is DBNull) && (dataReader["Unidad_Medida"] != null))
                            muestreo.UnidadMedida = dataReader["Unidad_Medida"].ToString();
                    }
                }
                return muestreo;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Muestreo", "ObtenerMuestreo", exception.Message);
                return null;
            }
        }
    }
}