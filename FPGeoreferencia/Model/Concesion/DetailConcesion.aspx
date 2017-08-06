<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailConcesion.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.DetailConcesion" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript"
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOD-mkWwXKxVxiZr4wPFyYDnEijtcwN4w">
    </script>
    <script src="<%: ResolveUrl("~/Scripts/coordenada.js") %>"></script>

</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainBreadcrumbs">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Administración</li>
			<li>Concesiones</li>
            <li class="active">Centro Cultivo</li>
		</ul>
	</div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <div class="reg-header">
	    <div class="team-img">
		    <button class="btn rounded btn-success" type="button" id="btnVolver"><i class="fa fa-reply-all"></i></button>
            <asp:Button ID="btnModulo" class="btn rounded btn-success" runat="server" OnClick="btnModulo_Click" Text="Módulo"/> 
		    <asp:Button ID="btnLinea" class="btn rounded btn-success" runat="server" OnClick="btnLinea_Click" Text="Línea"/>
            <asp:Button ID="btnInfraestructura" class="btn rounded btn-success" runat="server" OnClick="btnInfraestructura_Click" Text="Infraestructura"/>
		    <asp:Button ID="btnSiembra" class="btn rounded btn-success" runat="server" OnClick="btnSiembra_Click" Text="Siembra"/>
		    <asp:Button ID="btnMuestreo" class="btn rounded btn-success" runat="server" OnClick="btnMuestreo_Click" Text="Muestreo"/>
		    <asp:Button ID="btnCosecha" class="btn rounded btn-success" runat="server" OnClick="btnCosecha_Click" Text="Cosecha"/>
	    </div>		
	</div>
    
    <div class="margin-bottom-20"></div>

    <div class="panel panel-info margin-bottom-40">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-tasks"></i>Código Centro - <strong><asp:Label runat="server" ID="lblCentroCultivo"></asp:Label></strong></h3>
		</div>
						
		<table class="table">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Dirección</th>
					<th>Superficie HA(Hectareas)</th>
					<th>Total Módulos</th>
					<th>Total Lineas</th>
                    <th>Coordenadas UTM Concesion</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><asp:Label runat="server" ID="LblNombre"></asp:Label></td>
                    <td><asp:Label runat="server" ID="LblDireccion"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblSuperficie"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblModulos"></asp:Label></td>
                    <td><asp:Label runat="server" ID="LblLineas"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblCoordenadas"></asp:Label></td>
				</tr>
			</tbody>
		</table>
	</div>
    
    <asp:HiddenField ID="HidIdCentroCultivo" runat="server" />
    
    <div runat="server" id="mensaje">
        <strong><asp:Label runat="server" ID="lblError" /></strong>
    </div>

    <div class="headline"><h3>Ubicación Centro Cultivo</h3></div>

    <!-- div donde se dibuja el mapa-->
    <div id="map_canvas" style="width: auto; height: 600px; border: 1px solid black; overflow: hidden;"></div>

    <script>

        function initialize(coordenadasValue) {
            //console.log(coordenadasValue);
            var contentString = '<div id="content">' +
                '<div id="siteNotice">' +
                '</div>' +
                '<h1 id="firstHeading" class="firstHeading">' + $("#<%= LblNombre.ClientID %>").text() + '</h1>' +
                '<div id="bodyContent">' +
                '<p><b>Direccion</b>: '+ $("#<%= LblDireccion.ClientID %>").text() +'<br>' +
                '<b>Superfie(HA)</b>: ' + $("#<%= LblSuperficie.ClientID %>").text() + '<br>' +
                '<b>Total modulos</b>: ' + $("#<%= LblModulos.ClientID %>").text() + '<br> ' +
                '<b>Total lineas</b>: ' + $("#<%= LblLineas.ClientID %>").text() + '<br> ' +
                '</p>' +
                '</div>' +
                '</div>';
            
            //creamos el objeto con una latitud cualquiera
            var latLng = new google.maps.LatLng(coordenadasValue[0]["lat"], coordenadasValue[0]["lng"]);
            
            //Definimos algunas opciones del mapa a crear
            var myOptions = {
                center: latLng,//centro del mapa
                zoom: 11,//zoom del mapa
                mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
            };
            
            var infowindow = new google.maps.InfoWindow({
                content: contentString,
                maxWidth: 200,
                position: latLng
            });
            
            //creamos el mapa con las opciones anteriores y le pasamos el elemento div
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

            //var flightPlanCoordinates = [
            //  { lat: -43.01684722222222, lng: -73.35018888888888 },
            //  { lat: -43.018122222222225, lng: -73.3431611111111 },
            //  { lat: -43.020941666666666, lng: -73.34418055555555 },
            //  { lat: -43.019666666666666, lng: -73.35120833333333 },
            //  { lat: -43.01684722222222, lng: -73.35018888888888 }
            //];
            //var x = new Object();
            //var flightPlanCoordinates = [];

            //for (var i = 0; i < coordenadasValue.length; i++) {
                
            //    //console.log('latitud: ' + coordenadasValue[i]["latitud"] + ' - longitud: ' + coordenadasValue[i]["longitud"]);
            //    x.lat = coordenadasValue[i]["latitud"];
            //    x.lng = coordenadasValue[i]["longitud"];
            //    //console.log(x.lat + ' - ' + x.long);
            //    flightPlanCoordinates[i] = x;
            //}
            //console.log(flightPlanCoordinates);
            
            var centroCultivo = new google.maps.Polygon({
                paths: coordenadasValue,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35
            });
            
            centroCultivo.addListener('click', function () {
                infowindow.open(map, centroCultivo);
            });
            
            centroCultivo.setMap(map);
        }

        $(document).ready(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            var centroCultivo = $("#<%= HidIdCentroCultivo.ClientID %>").val();
            var obj = { "id": centroCultivo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Concesion/DetailConcesion.aspx/ObtenerCoordenadas")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: OnError
            });

            $('#btnVolver').click(function () {
                window.location.href = '<%=ResolveUrl("~/Concesion/Listado")%>';
            });
        });

        function OnSuccess(data) {
            //console.log(data.d);
            //console.log(data);

            var coordenadas = JSON.parse(data.d);
            //alert(coordenadas.length);
            if (coordenadas.length > 0) {
                var coordenadasValue = [];

                for (var i = 0; i < coordenadas.length; i++) {
                    //console.log('Id: ' + coordenadas[i]["Id"] + ' - utmX: ' + coordenadas[i]["UtmX"] + ' - utmY: ' + coordenadas[i]["UtmY"]);
                    coordenadasValue[i] = UtmToLongLat(coordenadas[i]["UtmX"], coordenadas[i]["UtmY"]);
                    //console.log(UtmToLongLat(coordenadas[i]["UtmX"], coordenadas[i]["UtmY"]));
                }
                //console.log(coordenadasValue);
                initialize(coordenadasValue);
            } else {
                $("#<%= lblError.ClientID %>").text("La concesión no tiene coordenadas UTM configuradas para visualizar su ubicación.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-info fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            }
        }

        function OnError(data) {
            //alert('error');
            //alert(data.d);
            console.log(data);
        }

        //UTM a lat-Long
        function UtmToLongLat(utmX, utmY) {

            var latlon = new Array(2);
            var x, y, zone, southhemi;

            x = parseFloat(utmX);
            y = parseFloat(utmY);
            zone = parseFloat(18);

            //if ((zone < 1) || (60 < zone)) {
            //    alert("El valor de zona de UTM esta fuera de rango.  " +
            //           "Por favor ingrese un valor entre [1, 60].");
            //    return false;
            //}

            //southhemi = true;

            UTMXYToLatLon(x, y, zone, true, latlon);

            var vector = new Object();
            vector['lng'] = RadToDeg(latlon[1]);
            vector['lat'] = RadToDeg(latlon[0]);
            return vector;
        }

        function ObtenerCentroCultivo() {
            var centroCultivo = $("#<%= LblDireccion.ClientID %>").val();
            var obj = { "id": centroCultivo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Concesion/DetailConcesion.aspx/ObtenerCentroCultivo")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: OnError
            });
        }
    </script>
</asp:Content>