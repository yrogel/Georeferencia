<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListConcesion.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.ListConcesion" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode;
            return (key >= 48 && key <= 57);
        }
    </script>
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainBreadcrumbs">
        <div class="container">
			<ul class="pull-left breadcrumb">
				<li>Administración</li>
				<li class="active">Concesiones</li>
			</ul>
		</div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="panel panel-info margin-bottom-20">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-tasks"></i>Datos Titular</h3>
		</div>
						
		<table class="table">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Rut</th>
					<th>Télefono</th>
					<th>Correo</th>
					<th>Dirección</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><asp:Label runat="server" ID="lblNombre"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblRut"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblTelefono"></asp:Label></td>
                    <td><asp:Label runat="server" ID="LblCorreo"></asp:Label></td>
					<td><asp:Label runat="server" ID="LblDireccion"></asp:Label></td>
				</tr>
			</tbody>
		</table>
	</div>
    
    <input type="button" id="btnNewConcesion" class="btn rounded btn-success" value="Nuevo"/> 
    
    <dx:ASPxPopupControl ID="PopUpNewConcesion" runat="server" ShowCloseButton="False" CloseAction="CloseButton"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewConcesion"
        HeaderText="Creación de concesión" Modal="True" PopupAnimationType="Fade" EnableViewState="False" Theme="DevEx" Width="500px">
        <ModalBackgroundStyle BackColor="Black" Opacity="30" />
        <SizeGripImage Width="11px" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="Panel2" runat="server" DefaultButton="btCreate">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
				            <h5>Ingrese toda la información (<span class="color-red">*</span>)</h5>

                            <div runat="server" id="mensaje">
                                <strong><asp:Label runat="server" ID="lblError" /></strong>
				            </div>

                            <table style="width: 100%;" >
                                <tr>
                                    <td rowspan="7">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Código</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtCodigo" ID="txtCodigo" width="200px" class="input-text" onKeyPress="return soloNumeros(event)" runat="server" required autofocus/>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="7">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Nombre</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNombre" ID="txtNombre" class="input-text" runat="server" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Dirección</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDireccion" ID="txtDireccion" class="input-text" runat="server" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Superficie</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtSuperficie" ID="txtSuperficie" class="input-text" runat="server" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Total Modulos</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtModulos" ID="txtModulos" onKeyPress="return soloNumeros(event)" class="input-text" runat="server" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Total Lineas</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLineas" ID="txtLineas" onKeyPress="return soloNumeros(event)" class="input-text" runat="server" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelar">Cancelar</button>
                                            <input type="button" id="btnGuardar" name="btnGuardar" class="btn-u" value="Guardar"/>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

        <div class="margin-bottom-10"></div>

        <dx:ASPxGridView ID="gridConcesion" ClientInstanceName="gridConcesion" runat="server" DataSourceID="SqlDataSource1"
            KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCustomCallback">
            <SettingsText EmptyDataRow="No existen datos"></SettingsText>
            <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
            <SettingsPager PageSize="20" />
            <Settings ShowTitlePanel="true" />
            <SettingsText Title="Concesiones" />
            <Columns>
                
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="#">
                    <EditButton Visible="True">
                        <Image Url="~/Images/table_edit.png" />  
                    </EditButton><CancelButton Visible="True">
                        <Image Url="~/Images/cancelar.png" />
                    </CancelButton>
                    <UpdateButton Visible="True">
                        <Image Url="~/Images/correcto.png" />
                    </UpdateButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Código Centro" FieldName="Id" VisibleIndex="1">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="~/Concesion/Detalle/{0}" >
                    </PropertiesHyperLinkEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center" />
                    <HeaderStyle Font-Bold="True" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="2" Caption="Nombre de Centro">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="3" Caption="Dirección">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Superficie" VisibleIndex="6" Caption="Superficie">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Modulos" VisibleIndex="7" Caption="Total Modulos">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Lineas" VisibleIndex="8" Caption="Total Lineas">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="10" Caption="Coordenadas UTM">
                  <HeaderStyle Font-Bold="True" />
                  <CellStyle HorizontalAlign="Center"/>
                  <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <button class="btn btn-info btn-xs" data-toggle="modal" onclick='AgregaCoordenada(<%#Eval("Id")%>)'><i class="icon-settings"></i> Configurar</button>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            
            </Columns>
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <SettingsBehavior AllowSelectByRowClick="true" />
        </dx:ASPxGridView>

    
    <asp:HiddenField ID="Hididuser" runat="server" />
    <asp:HiddenField ID="HididConcesion" runat="server" />
    
    <dx:ASPxPopupControl ID="PopUpCoordenadas" runat="server" ShowCloseButton="False" CloseAction="CloseButton"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpCoordenadas"
        HeaderText="Creación de coordenadas UTM" Modal="True" PopupAnimationType="Fade" EnableViewState="False" Theme="DevEx" Width="500px">
        <ModalBackgroundStyle BackColor="Black" Opacity="30" />
        <SizeGripImage Width="11px" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server" DefaultButton="btCreate">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
				            <h5>Ingrese toda la información (<span class="color-red">*</span>)</h5>

                            <div runat="server" id="mensajeCoordenada">
                                <strong><asp:Label runat="server" ID="lblErrorCoordenada" /></strong>
				            </div>

                            <table style="width: 100%;" >
                                <tr>
                                    <td rowspan="4">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Código Centro</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtConcesion" ID="txtConcesion" class="input-text" runat="server" disabled />
                                    </td>
                                    <td rowspan="4">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenada UTM X</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmX" ID="txtUtmX" class="input-text" runat="server" onfocus="this.select();" onkeyup="decimal(this,this.value.charAt(this.value.length-1))" />
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenada UTM Y</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmY" ID="txtUtmY" class="input-text" runat="server" onfocus="this.select();" onkeyup="decimal(this,this.value.charAt(this.value.length-1))"/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelarCoordenada">Cancelar</button>
                                            <input type="button" id="btnGuardarCoordenada" name="btnGuardarCoordenada" class="btn-u" value="Guardar"/>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <div style="padding-bottom: 10px;"></div>

                            <dx:ASPxGridView ID="gridCoordenadas" ClientInstanceName="gridCoordenadas" runat="server" DataSourceID="SqlCoordenadas" 
                                 KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCoordenadaCustomCallback" EnableCallBacks="True">
                                <Columns>
                
                                    <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="#" ShowEditButton="True" Width="60px">
                                        <DeleteButton Visible="True">
                                            <Image Url="~/Images/table_Delete.png" />  
                                        </DeleteButton>
                                        <EditButton Visible="True">
                                            <Image Url="~/Images/table_edit.png" />  
                                        </EditButton>
                                        <CancelButton Visible="True">
                                            <Image Url="~/Images/cancelar.png" />
                                        </CancelButton>
                                        <UpdateButton Visible="True">
                                            <Image Url="~/Images/correcto.png" />
                                        </UpdateButton>
                                    </dx:GridViewCommandColumn>
                
                                    <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="False" VisibleIndex="1">
                                        <HeaderStyle Font-Bold="True" />
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Coordenada_X" VisibleIndex="2" Caption="Coordenada X">
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Coordenada_Y" VisibleIndex="3" Caption="Coordenada Y">
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewDataTextColumn>
            
                                </Columns>
                                <SettingsText EmptyDataRow="No existen datos"></SettingsText>
                                <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
                                <SettingsPager PageSize="5"  />
                                <Settings ShowTitlePanel="true" />
                                <SettingsText Title="Coordenadas UTM" />
                                <Settings ShowFilterRow="True" ShowFooter="True" />
                                <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
                                <SettingsText CommandDelete="Eliminar" />
                            </dx:ASPxGridView>
                           
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetCentroCultivo" SelectCommandType="StoredProcedure" UpdateCommand="UpdCentroCultivo" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Hididuser" Name="id_cliente" PropertyName="Value" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Decimal" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Direccion" Type="String" />
                <asp:Parameter Name="Superficie" Type="String" />
                <asp:Parameter Name="Total_Modulos" Type="Int32" />
                <asp:Parameter Name="Total_Lineas" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlCoordenadas" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetCoordenadas" SelectCommandType="StoredProcedure" UpdateCommand="UpdCoordenadas" UpdateCommandType="StoredProcedure" DeleteCommand="DelCoordenadas" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HididConcesion" Name="id_concesion" PropertyName="Value" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Decimal" />
            <asp:Parameter Name="Coordenada_X" Type="String" />
            <asp:Parameter Name="Coordenada_Y" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Decimal"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
   
    <script>
        $("#btnNewConcesion").click(function () {
            $("#<%= txtCodigo.ClientID %>").focus();
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormConcesion();
            PopUpNewConcesion.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewConcesion.Hide();
            gridConcesion.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            
            var codigo = $("#<%= txtCodigo.ClientID %>").val();
            var nombre = $("#<%= txtNombre.ClientID %>").val();
            var direccion = $("#<%= txtDireccion.ClientID %>").val();
            var superficie = $("#<%= txtSuperficie.ClientID %>").val();
            var modulos = $("#<%= txtModulos.ClientID %>").val();
            var lineas = $("#<%= txtLineas.ClientID %>").val();
            var idCliente = $("#<%= Hididuser.ClientID %>").val();

            if (codigo == "" || nombre == "" || direccion == "" || superficie == "" || modulos == "" || lineas == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "codigo": codigo, "nombre": nombre, "direccion": direccion, "superficie": superficie, "modulos": modulos, "lineas": lineas, "idCliente": idCliente };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Concesion/ListConcesion.aspx/InsertaConcesion")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    error: OnError
                });
            }
        });

        function OnSuccess(msg) {
            //alert(msg.d);
            if (msg.d == 0) {
                $("#<%= lblError.ClientID %>").text("Se ingreso correctamente los datos.");
                $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-success fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
                $("#<%= mensaje.ClientID %>").fadeOut(5000);
                ClearFormConcesion();
            } else {
                $("#<%= lblError.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            }
        }

        function OnError(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblError.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
            $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensaje.ClientID %>").css('display', 'block');
        }

        function ClearFormConcesion() {
            $("#<%= txtCodigo.ClientID %>").val('');
            $("#<%= txtNombre.ClientID %>").val('');
            $("#<%= txtDireccion.ClientID %>").val('');
            $("#<%= txtSuperficie.ClientID %>").val('');
            $("#<%= txtModulos.ClientID %>").val('');
            $("#<%= txtLineas.ClientID %>").val('');
        }

        function AgregaCoordenada(id) {
            //alert(id); 
            $("#<%= HididConcesion.ClientID %>").val(id);
            $("#<%= txtConcesion.ClientID %>").val(id);
            $("#<%= mensajeCoordenada.ClientID %>").css('display', 'none');
            ClearFormCoordenada();
            gridCoordenadas.PerformCallback("databind");
            PopUpCoordenadas.Show();
        }

        $('#btnCancelarCoordenada').click(function () {
            PopUpCoordenadas.Hide();
            gridCoordenadas.PerformCallback("databind");
        });

        $('#btnGuardarCoordenada').click(function () {

            var concesion = $("#<%= txtConcesion.ClientID %>").val();
            var utmX = $("#<%= txtUtmX.ClientID %>").val();
            var utmY = $("#<%= txtUtmY.ClientID %>").val();
           

            if (concesion == "" || utmX == "" || utmY == "") {
                $("#<%= lblErrorCoordenada.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensajeCoordenada.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeCoordenada.ClientID %>").css('display', 'block');
            } else {
                var obj = { "concesion": concesion, "utmX": utmX, "utmY": utmY };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Concesion/ListConcesion.aspx/InsertaCoordenadas")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessCoordenada,
                    error: OnErrorCoordenada
                });
            }
        });

        function OnSuccessCoordenada(msg) {
            //alert(msg.d);
            if (msg.d == 0) {
                $("#<%= lblErrorCoordenada.ClientID %>").text("Se ingreso correctamente los datos.");
                $("#<%= mensajeCoordenada.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-success fade in");
                $("#<%= mensajeCoordenada.ClientID %>").css('display', 'block');
                $("#<%= mensajeCoordenada.ClientID %>").fadeOut(5000);
                gridCoordenadas.PerformCallback("databind");
                ClearFormCoordenada();
            } else {
                $("#<%= lblErrorCoordenada.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
                $("#<%= mensajeCoordenada.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeCoordenada.ClientID %>").css('display', 'block');
            }
        }

        function OnErrorCoordenada(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblErrorCoordenada.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
            $("#<%= mensajeCoordenada.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensajeCoordenada.ClientID %>").css('display', 'block');
        }

        function ClearFormCoordenada() {
            $("#<%= txtUtmX.ClientID %>").val('');
            $("#<%= txtUtmY.ClientID %>").val('');
        }
       
    </script>
    
</asp:Content>
