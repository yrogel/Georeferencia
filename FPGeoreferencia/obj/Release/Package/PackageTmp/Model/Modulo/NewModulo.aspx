<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewModulo.aspx.cs" Inherits="FPGeoreferencia.Model.Modulo.NewModulo" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Administración</li>
			<li>Concesiones</li>
            <li>Centro Cultivo</li>
            <li>Módulos</li>
            <li class="active">Nuevo</li>
		</ul>
	</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode;
            return (key >= 48 && key <= 57);
        }
    </script>
    <div class="row">
	    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					
			    <div class="reg-header">
				    <h2>Módulo</h2>
				    <p>Ingrese toda la informacion requerida (<span class="color-red">*</span>)</p>
                    
                    <div runat="server" id="mensaje">
                        <strong><asp:Label runat="server" ID="lblError" /></strong>
					</div>
					
			    </div>
                
                <label>Nombre<span class="color-red">*</span></label>
		        <input type="text" name="txtNombre" ID="txtNombre" runat="server" class="form-control margin-bottom-5" required/>
                    
                <div class="row">
				    <div class="col-sm-6">
					    <label>Cantidad Lineas<span class="color-red">*</span></label>
                        <input type="text" name="txtCantidadLineas" ID="txtCantidadLineas" onKeyPress="return soloNumeros(event)" runat="server" class="form-control margin-bottom-5" required/>
                        
				    </div>
				    <div class="col-sm-6">
					    <label>Largo Linea<span class="color-red">*</span></label>
					    <input type="text" name="txtLargoLinea" ID="txtLargoLinea" runat="server" class="form-control margin-bottom-5" required/>
				    </div>
			    </div>
                        
			    <div class="row">
				    <div class="col-sm-6">
					    <label>Largo Cuelga<span class="color-red">*</span></label>
					    <input type="text" name="txtLargoCuelga" ID="txtLargoCuelga" runat="server" class="form-control margin-bottom-5" required/>
								
				    </div>
				    <div class="col-sm-6">
					    <label>Especie<span class="color-red">*</span></label>
					    <select class="form-control margin-bottom-5" runat="server" ID="ddlEspecie">
														<option value="1">Chorito</option>
														<option value="2">Choro Zapato</option>
														<option value="3">Cholga</option>
														<option value="4">Ostra</option>
														<option value="5">Ostiones</option>
														<option value="6">Abalones</option>
														<option value="7">Mixta</option>
														<option value="8">Otras</option>
													</select>
				    </div>
			    </div>
                    
            <div class="row">
				    <div class="col-sm-6">
					    <label>Coordenadas UTM E Inicio<span class="color-red">*</span></label>
					    <input type="text" name="txtUtmEInicio" ID="txtUtmEInicio" runat="server" class="form-control margin-bottom-5" required/>	
				    </div>
				    <div class="col-sm-6">
					    <label>Coordenadas UTM E Fin<span class="color-red">*</span></label>
					    <input type="text" name="txtUtmEFin" ID="txtUtmEFin" runat="server" class="form-control margin-bottom-5" required/>
				    </div>
			    </div>
                    
            <div class="row">
				    <div class="col-sm-6">
					    <label>Coordenadas UTM N Inicio<span class="color-red">*</span></label>
					    <input type="text" name="txtUtmNInicio" ID="txtUtmNInicio" runat="server" class="form-control margin-bottom-5" required/>	
				    </div>
				    <div class="col-sm-6">
					    <label>Coordenadas UTM N Fin<span class="color-red">*</span></label>
					    <input type="text" name="txtUtmNFin" ID="txtUtmNFin" runat="server" class="form-control margin-bottom-5" required/>
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
    
    <asp:HiddenField ID="HidIdCentroCultivo" runat="server" />

    <script>
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location.href = '/Administracion/Concesion/Modulo/' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>
</asp:Content>
