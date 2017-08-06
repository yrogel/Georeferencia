using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Cosecha
    {
        public static string CreaOActualizaCosecha(string linea, string tipoCosecha, string formaCosecha, string kgSucioMetro, string kgSucioCuelga, string kgLimpioMetro, string kgLimpioCuelga, string numeroIndividuoMts, string numeroIndividuoKg, string tallaPromedio, string factorCondicion, string especie, string fecha, string unidadMedida, string idCosecha)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("SaveOrUpdateCosecha");
                database.AddInParameter(cmd, "idLinea", DbType.Decimal, linea);
                database.AddInParameter(cmd, "tipoCosecha", DbType.Decimal, tipoCosecha);
                database.AddInParameter(cmd, "formaCosecha", DbType.Decimal, formaCosecha);
                database.AddInParameter(cmd, "kgSucioMetro", DbType.Decimal, kgSucioMetro);
                database.AddInParameter(cmd, "kgSucioCuelga", DbType.Decimal, kgSucioCuelga);
                database.AddInParameter(cmd, "kgLimpioMetro", DbType.Decimal, kgLimpioMetro);
                database.AddInParameter(cmd, "kgLimpioCuelga", DbType.Decimal, kgLimpioCuelga);
                database.AddInParameter(cmd, "numeroIndividuoMts", DbType.Decimal, numeroIndividuoMts);
                database.AddInParameter(cmd, "numeroIndividuoKg", DbType.Decimal, numeroIndividuoKg);
                database.AddInParameter(cmd, "tallaPromedio", DbType.Decimal, tallaPromedio);
                database.AddInParameter(cmd, "factorCondicion", DbType.String, factorCondicion);
                database.AddInParameter(cmd, "fecha", DbType.Date, fecha);
                database.AddInParameter(cmd, "unidadMedida", DbType.String, unidadMedida);
                database.AddInParameter(cmd, "especie", DbType.Decimal, especie);
                database.AddInParameter(cmd, "idCosecha", DbType.Decimal, idCosecha);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "CreaOActualizaCosecha", exception.Message);
                return "1";
            }
        }

        public static Entities.Cosecha ObtenerCosecha(string id)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetCosechaById");
                database.AddInParameter(cmd, "id", DbType.Decimal, id);
                var cosecha = new Entities.Cosecha();
                using (var dataReader = database.ExecuteReader(cmd))
                {
                    if (dataReader.Read())
                    {
                        if (!(dataReader["Id_Linea"] is DBNull) && (dataReader["Id_Linea"] != null))
                            cosecha.IdLinea = decimal.Parse(dataReader["Id_Linea"].ToString());
                        if (!(dataReader["Id_Tipo_Cosecha"] is DBNull) && (dataReader["Id_Tipo_Cosecha"] != null))
                            cosecha.IdTipoCosecha = decimal.Parse(dataReader["Id_Tipo_Cosecha"].ToString());
                        if (!(dataReader["Fecha_Cosecha"] is DBNull) && (dataReader["Fecha_Cosecha"] != null))
                        {
                            cosecha.FechaCosecha = dataReader["Fecha_Cosecha"].ToString();
                            string[] fecha = cosecha.FechaCosecha.Split(' ');
                            cosecha.FechaCosecha = fecha[0];
                        }
                        if (!(dataReader["Id_Forma_Cosecha"] is DBNull) && (dataReader["Id_Forma_Cosecha"] != null))
                            cosecha.IdFormaCosecha = decimal.Parse(dataReader["Id_Forma_Cosecha"].ToString());
                        if (!(dataReader["Kg_Sucio_Metro"] is DBNull) && (dataReader["Kg_Sucio_Metro"] != null))
                            cosecha.KgSucioMetro = decimal.Parse(dataReader["Kg_Sucio_Metro"].ToString());
                        if (!(dataReader["Kg_Sucio_Cuelga"] is DBNull) && (dataReader["Kg_Sucio_Cuelga"] != null))
                            cosecha.KgSucioCuelga = decimal.Parse(dataReader["Kg_Sucio_Cuelga"].ToString());
                        if (!(dataReader["Kg_Limpio_Metro"] is DBNull) && (dataReader["Kg_Limpio_Metro"] != null))
                            cosecha.KgLimpioMetro = decimal.Parse(dataReader["Kg_Limpio_Metro"].ToString());
                        if (!(dataReader["Kg_Limpio_Cuelga"] is DBNull) && (dataReader["Kg_Limpio_Cuelga"] != null))
                            cosecha.KgLimpioCuelga = decimal.Parse(dataReader["Kg_Limpio_Cuelga"].ToString());
                        if (!(dataReader["Factor_Condicion"] is DBNull) && (dataReader["Factor_Condicion"] != null))
                            cosecha.FactorCondicion = dataReader["Factor_Condicion"].ToString();
                        if (!(dataReader["Talla_Promedio"] is DBNull) && (dataReader["Talla_Promedio"] != null))
                            cosecha.TallaPromedio = decimal.Parse(dataReader["Talla_Promedio"].ToString());
                        if (!(dataReader["Numero_Individuos_Kg"] is DBNull) && (dataReader["Numero_Individuos_Kg"] != null))
                            cosecha.NumeroIndividuosKg = decimal.Parse(dataReader["Numero_Individuos_Kg"].ToString());
                        if (!(dataReader["Numero_Individuos_Mt"] is DBNull) && (dataReader["Numero_Individuos_Mt"] != null))
                            cosecha.NumeroIndividuosMt = decimal.Parse(dataReader["Numero_Individuos_Mt"].ToString());
                        if (!(dataReader["Id_Modulo"] is DBNull) && (dataReader["Id_Modulo"] != null))
                            cosecha.IdModulo = decimal.Parse(dataReader["Id_Modulo"].ToString());
                        if (!(dataReader["Id_Especie"] is DBNull) && (dataReader["Id_Especie"] != null))
                            cosecha.IdEspecie = decimal.Parse(dataReader["Id_Especie"].ToString());
                        if (!(dataReader["Unidad_Medida"] is DBNull) && (dataReader["Unidad_Medida"] != null))
                            cosecha.UnidadMedida = dataReader["Unidad_Medida"].ToString();
                    }
                }
                return cosecha;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "ObtenerCosecha", exception.Message);
                return null;
            }
        }

        public static DataSet ObtenerTipoCosecha()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetTipoCosecha");
                DataSet tipoCosecha = database.ExecuteDataSet(cmd);

                return tipoCosecha;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "ObtenerTipoCosecha", exception.Message);
                return null;
            }
        }

        public static DataSet ObtenerFormaCosecha()
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("GetFormaCosecha");
                DataSet formaCosecha = database.ExecuteDataSet(cmd);

                return formaCosecha;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "ObtenerFormaCosecha", exception.Message);
                return null;
            }
        }

        public static string CreaFormaCosecha(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsFormaCosecha");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "CreaFormaCosecha", exception.Message);
                return "1";
            }
        }

        public static string CreaTipoCosecha(string nombre)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("InsTipoCosecha");
                database.AddInParameter(cmd, "nombre", DbType.String, nombre);
                database.ExecuteNonQuery(cmd);

                return "0";
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cosecha", "CreaFormaCosecha", exception.Message);
                return "1";
            }
        }
    }
}