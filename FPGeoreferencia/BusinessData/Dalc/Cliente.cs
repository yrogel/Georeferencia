using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FPGeoreferencia.BusinessData.Dalc
{
    public class Cliente
    {
        public static Entities.Cliente ValidaCliente(string login, string password)
        {
            var cliente = new Entities.Cliente();

            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("ValidaCliente");
                database.AddInParameter(cmd, "login", DbType.String, login);
                database.AddInParameter(cmd, "password", DbType.String, password);
                
                using (var dataReader = database.ExecuteReader(cmd))
                {
                    if (dataReader.Read())
                    {
                        if (!(dataReader["Id"] is DBNull) && (dataReader["Id"] != null))
                            cliente.Id = (decimal)dataReader["Id"];
                        if (!(dataReader["Id_Rol"] is DBNull) && (dataReader["Id_Rol"] != null))
                            cliente.IdRol = (decimal)dataReader["Id_Rol"];
                        if (!(dataReader["Nombre"] is DBNull) && (dataReader["Nombre"] != null))
                            cliente.Nombre = (string)dataReader["Nombre"];
                        if (!(dataReader["Direccion"] is DBNull) && (dataReader["Direccion"] != null))
                            cliente.Direccion = (string)dataReader["Direccion"];
                        if (!(dataReader["Rut"] is DBNull) && (dataReader["Rut"] != null))
                            cliente.Rut = (string)dataReader["Rut"];
                        if (!(dataReader["Telefono"] is DBNull) && (dataReader["Telefono"] != null))
                            cliente.Telefono = (string)dataReader["Telefono"];
                        if (!(dataReader["Estado"] is DBNull) && (dataReader["Estado"] != null))
                            cliente.Estado = (int)dataReader["Estado"];
                        if (!(dataReader["Cambio_Clave"] is DBNull) && (dataReader["Cambio_Clave"] != null))
                            cliente.CambioClave = (int)dataReader["Cambio_Clave"];
                        if (!(dataReader["Correo"] is DBNull) && (dataReader["Correo"] != null))
                            cliente.Correo = (string)dataReader["Correo"];
                        cliente.Login = login;
                        cliente.Password = password;
                    }
                }
            }
            catch(Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cliente", "ValidaCliente", exception.Message);
            }

            return cliente;
        }

        public static bool CambiaClave(Entities.Cliente cliente, string password, string correo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("UpdPasswordCliente");
                database.AddInParameter(cmd, "id", DbType.Decimal, cliente.Id);
                database.AddInParameter(cmd, "pass", DbType.String, password);
                database.AddInParameter(cmd, "correo", DbType.String, correo);
                database.ExecuteNonQuery(cmd);
                return true;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cliente", "CambiaClave", exception.Message);
                return false;
            }
        }

        public static bool ValidaCorreo(string correo)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("ValidateEmail");
                database.AddInParameter(cmd, "correo", DbType.String, correo);
                database.AddOutParameter(cmd, "estado", DbType.Decimal, 9);
                database.ExecuteNonQuery(cmd);

                int estado = int.Parse(database.GetParameterValue(cmd, "estado").ToString());
                return estado == 1;
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cliente", "ValidaCorreo", exception.Message);
                return false;
            }
        }

        public static void ActualizarContraseña(string correo, string password)
        {
            try
            {
                var database = DatabaseFactory.CreateDatabase();
                var cmd = database.GetStoredProcCommand("UpdPassword");
                database.AddInParameter(cmd, "correo", DbType.String, correo);
                database.AddInParameter(cmd, "password", DbType.String, password);
                database.ExecuteNonQuery(cmd);
            }
            catch (Exception exception)
            {
                //insertar log de error
                Log.InsLog("Cliente", "ActualizarContraseña", exception.Message);
            }
        }
    }
}