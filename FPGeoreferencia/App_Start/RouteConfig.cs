using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace FPGeoreferencia
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.EnableFriendlyUrls();
            routes.RouteExistingFiles = true;
            //alias - estructura - ruta fisica
            routes.MapPageRoute("Login", "Login", "~/Account/Login.aspx");
            routes.MapPageRoute("ChangePass", "CambioClave", "~/Account/ChangePass.aspx");
            routes.MapPageRoute("RecuperarContraseña", "RecuperarContraseña", "~/Account/RecuperarContraseña.aspx");
            routes.MapPageRoute("Index", "Inicio", "~/Index.aspx");
            //concesion
            routes.MapPageRoute("Concesion", "Concesion/Listado", "~/Model/Concesion/ListConcesion.aspx");
            routes.MapPageRoute("ConcesionDetalle", "Concesion/Detalle/{IdCentroCultivo}", "~/Model/Concesion/DetailConcesion.aspx");
            routes.MapPageRoute("ConcesionModulo", "Concesion/Modulo/{Id}", "~/Model/Modulo/ListModulo.aspx");
            routes.MapPageRoute("ConcesionLinea", "Concesion/Linea/{Id}", "~/Model/Linea/ListLinea.aspx");
            routes.MapPageRoute("ConcesionInfraestructura", "Concesion/Infraestructura/{Id}", "~/Model/Infraestructura/ListInfraestructuta.aspx");
            routes.MapPageRoute("ConcesionSiembra", "Concesion/Siembra/{Id}", "~/Model/Concesion/Siembra.aspx");
            routes.MapPageRoute("ConcesionMuestreo", "Concesion/Muestreo/{Id}", "~/Model/Concesion/Muestreo.aspx");
            routes.MapPageRoute("ConcesionCosecha", "Concesion/Cosecha/{Id}", "~/Model/Concesion/Cosecha.aspx");
            //configuracion
            routes.MapPageRoute("ConfiguracionUsuario", "Configuracion/Usuario", "~/Model/Configuracion/Usuario.aspx");
            routes.MapPageRoute("ConfiguracionEspecie", "Configuracion/FaunaAcompañante", "~/Model/Configuracion/Especie.aspx");
            routes.MapPageRoute("ConfiguracionFormaCosecha", "Configuracion/FormaCosecha", "~/Model/Configuracion/FormaCosecha.aspx");
            routes.MapPageRoute("ConfiguracionMaterial", "Configuracion/Material", "~/Model/Configuracion/Material.aspx");
            routes.MapPageRoute("ConfiguracionProveedor", "Configuracion/Proveedor", "~/Model/Configuracion/Proveedor.aspx");
            routes.MapPageRoute("ConfiguracionTipoCosecha", "Configuracion/TipoCosecha", "~/Model/Configuracion/TipoCosecha.aspx");
            routes.MapPageRoute("ConfiguracionTipoCuelga", "Configuracion/TipoCuelga", "~/Model/Configuracion/TipoCuelga.aspx");
            routes.MapPageRoute("ConfiguracionTipoLinea", "Configuracion/TipoLinea", "~/Model/Configuracion/TipoLinea.aspx");
            routes.MapPageRoute("ConfiguracionTipoSiembra", "Configuracion/TipoSiembra", "~/Model/Configuracion/TipoSiembra.aspx");
            routes.MapPageRoute("ConfiguracionTipoVolumen", "Configuracion/TipoVolumen", "~/Model/Configuracion/TipoVolumen.aspx");
            routes.MapPageRoute("ConfiguracionUbicacionCuelga", "Configuracion/UbicacionCuelga", "~/Model/Configuracion/UbicacionCuelga.aspx");
        }
    }
}
