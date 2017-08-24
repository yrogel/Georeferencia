<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FPGeoreferencia._Default" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainBreadcrumbs">
        <div class="container">
				<ul class="pull-left breadcrumb">
					<li>Administracion</li>
					<li class="active">Concesiones</li>
				</ul>
			</div><!--/container-->
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <a href='<%=ResolveUrl("~/Login") %>'>View Login</a>
    <div style="padding-left:200px;padding-top:10px;padding-right:200px;">
			<h5>Datos Titular</h5>
			<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>RUT</th>
								<th>Fono</th>
								<th>Direccion</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Titular_1</td>
								<td>1111111-1</td>
								<td>111111</td>
								<td>Direccion_1</td>
							</tr>
						</tbody>
			</table>
		</div>
    <div class="reg-header">
							<h5>Concesiones</h5>
				
				
				
						<div class="team-img">
							<button class="btn rounded btn-success" type="button" id="centro">Nuevo</button>							
						</div>
					
				
				
		</div>
    <table class="table table-bordered">
						<thead>
							<tr>
								<th>Codigo Centro</th>
								<th>Nombre de Centro</th>
								<th>Estado</th>
								<th>Archivos</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="http://localhost:8080/FPGeoreferencia/centrocultivo.html" data-toggle="tooltip" data-placement="bottom" title="Iniciar proceso">1</a></td>
								<td>Centro_1</td>
								<td>Activo</td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i>Agregar</button></td>
								<td><button class="btn btn-warning btn-xs" title="Editar datos del centro (Nombre,estado,etc)"><i class="fa fa-pencil"></i> Editar</button></td>
								
							</tr>
							<tr>
								<td><a href="#">2</a></td>
								<td>Centro_2</td>
								<td>Activo</td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i>Agregar</button></td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i> Editar</button></td>
								
							</tr>
							<tr>
								<td><a href="#">3</a></td>
								<td>Centro_3</td>
								<td>Activo</td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i>Agregar</button></td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i> Editar</button></td>
								
							</tr>
							<tr>
								<td><a href="#">4</a></td>
								<td>Centro_4</td>
								<td>Activo</td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i>Agregar</button></td>
								<td><button class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i> Editar</button></td>
								
							</tr>
						</tbody>
					</table>
</asp:Content>
