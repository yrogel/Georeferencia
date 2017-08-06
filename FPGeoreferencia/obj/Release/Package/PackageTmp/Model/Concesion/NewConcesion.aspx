<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewConcesion.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.NewConcesion" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainBreadcrumbs">
        <div class="container">
			<ul class="pull-left breadcrumb">
				<li>Administración</li>
				<li>Concesiones</li>
                <li class="active">Nuevo</li>
			</ul>
		</div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>
        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode;
            return (key >= 48 && key <= 57);
        }
    </script>
    <div class="row">
	    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					
			<div class="reg-header">
				<h2>Centro Cultivo</h2>
				<p>Ingrese toda la informacion requerida (<span class="color-red">*</span>)</p>
                    
                <div runat="server" id="mensaje">
                    <strong><asp:Label runat="server" ID="lblError" /></strong>
				</div>
					
			</div>
                    
            <div class="row">
				<div class="col-sm-6">
					<label>Código<span class="color-red">*</span></label>
                    <input type="text" name="txtCodigo" ID="txtCodigo" onKeyPress="return soloNumeros(event)" runat="server" class="form-control margin-bottom-5" required/>
                        
				</div>
				<div class="col-sm-6">
					<label>Nombre<span class="color-red">*</span></label>
					<input type="text" name="txtNombre" ID="txtNombre" runat="server" class="form-control margin-bottom-5" required/>
                        
				</div>
			</div>
                        
            <label>Dirección<span class="color-red">*</span></label>
		    <input type="text" name="txtDireccion" ID="txtDireccion" runat="server" class="form-control margin-bottom-5" required/>
						
			<div class="row">
				<div class="col-sm-6">
					<label>Coordenada UTM E<span class="color-red">*</span></label>
					<input type="text" name="txtUtmE" ID="txtUtmE" runat="server" class="form-control margin-bottom-5" required/>		
				</div>
				<div class="col-sm-6">
					<label>Coordenada UTM N<span class="color-red">*</span></label>
					<input type="text" name="txtUtmN" ID="txtUtmN" runat="server" class="form-control margin-bottom-5" required/>
				</div>
			</div>
                    
            <div class="row">
				<div class="col-sm-6">
					<label>Superficie<span class="color-red">*</span></label>
					<input type="text" name="txtSuperficie" ID="txtSuperficie" runat="server" class="form-control margin-bottom-5" required/>	
				</div>
				<div class="col-sm-6">
					<label>Total Modulos<span class="color-red">*</span></label>
					<input type="text" name="txtModulos" ID="txtModulos" onKeyPress="return soloNumeros(event)" runat="server" class="form-control margin-bottom-5" required/>
				</div>
			</div>
                    
            <div class="row">
				<div class="col-sm-6">
					<label>Total Lineas<span class="color-red">*</span></label>
					<input type="text" name="txtLineas" ID="txtLineas" onKeyPress="return soloNumeros(event)" runat="server" class="form-control margin-bottom-5" required/>	
				</div>
				<div class="col-sm-6">
					    
				</div>
			</div>
            
			<hr>

            <div class="row">
				<div class="col-lg-6 text-left">
                    <button class="btn-u" type="button" id="btnVolver">Volver</button>
				</div>
                <div class="col-lg-6 text-right">
					<asp:Button ID="btnGuardar" class="btn-u" runat="server" OnClick="btnGuardar_Click" AutoPostBack="true" Text="Guardar"/>
				</div>
			</div>
	    </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location.href = '/Administracion/Concesion';
            });
        });
    </script>
		
</asp:Content>
