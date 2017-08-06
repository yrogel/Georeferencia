<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordenadas.aspx.cs" Inherits="FPGeoreferencia.Coordenadas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="<%: ResolveUrl("~/Scripts/modernizr-2.6.2.js") %>"></script>
        <script src="<%: ResolveUrl("~/Scripts/jquery-1.8.2.js") %>"></script>
        <script src="<%: ResolveUrl("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/Scripts/coordenada.js") %>"></script>
    <title></title>
    
    <script>
        //UTM a lat-Long
        function cmdUTM2Lat_click() {
            
            var latlon = new Array(2);
            var x, y, zone, southhemi;
            
            if (isNaN(parseFloat($("#<%= txtX.ClientID %>").val()))) {
                alert ("Por favor ingrese un valor valido para X.");
                return false;
            }

            x = parseFloat($("#<%= txtX.ClientID %>").val());

            if (isNaN(parseFloat($("#<%= txtY.ClientID %>").val()))) {
                alert ("Por favor ingrese un valor valido para Y.");
                return false;
            }

            y = parseFloat($("#<%= txtY.ClientID %>").val());

            //if (isNaN (parseInt (document.frmConverter.txtZone.value))) {
            //    alert ("Por favor ingrese una zona valida de UTM.");
            //    return false;
            //}

            zone = parseFloat (18);

            if ((zone < 1) || (60 < zone)) {
                alert ("El valor de zona de UTM esta fuera de rango.  " +
                       "Por favor ingrese un valor entre [1, 60].");
                return false;
            }

            
            //southhemi = true;

            UTMXYToLatLon (x, y, zone, true, latlon);

            $("#<%= txtLon.ClientID %>").val(RadToDeg(latlon[1]));
            $("#<%= txtLat.ClientID %>").val(RadToDeg(latlon[0]));

            return true;
        }
        </script>
</head>
<body>
    <form id="form1" name="frmConverter" runat="server">
    <div>
        <input type="text" name="txtX" ID="txtX" runat="server" placeholder="X" />
        <input type="text" name="txtY" ID="txtY" runat="server" placeholder="Y"/>
        
        LON<input type="text" name="txtLon" ID="txtLon" runat="server" placeholder="longitud" />
        LAT<input type="text" name="txtLat" ID="txtLat" runat="server" placeholder="latitud"/>
        
        <input type="button" id="btnGuardar" name="btnGuardar" onclick="cmdUTM2Lat_click()" value="convertir"/>
    </div>
    </form>
</body>
</html>
