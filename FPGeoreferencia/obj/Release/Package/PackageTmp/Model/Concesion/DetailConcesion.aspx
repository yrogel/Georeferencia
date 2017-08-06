<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailConcesion.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.DetailConcesion" %>

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
		    <button class="btn rounded btn-success" type="button" id="infraestructura">Infraestructura</button>
		    <button class="btn rounded btn-success" type="button" id="siembra">Siembra</button>
		    <button class="btn rounded btn-success" type="button" id="muestreo">Muestreo</button>
		    <button class="btn rounded btn-success" type="button" id="cosecha">Cosecha</button>
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

    <div class="headline"><h3>Ubicación Centro Cultivo</h3></div>
	<div class="map margin-bottom-90">
		<img src="/Content/assets/img/centro.png" width="800px" height="400px"/>
	</div>
    
    <script>
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location.href = '/Administracion/Concesion';
            });
        });
    </script>
</asp:Content>
