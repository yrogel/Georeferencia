﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="FPGeoreferencia.Model.Configuracion.Proveedor" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Configuración</li>
            <li class="active">Proveedor</li>
		</ul>
	</div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="padding-left: 100px;">
    <div style="height: 10px;"></div>
    <input type="button" id="btnNewProveedor" name="btnNewProveedor" class="btn rounded btn-success" value="Nuevo"/>
    <div style="height: 10px;"></div>
    
    <dx:ASPxGridView ID="gridProveedor" ClientInstanceName="gridProveedor" runat="server" DataSourceID="SqlProveedor" 
         KeyFieldName="Id" AutoGenerateColumns="False" OnCustomCallback="GrillasCustomCallback" EnableCallBacks="False">
        <Columns>
                
            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="#" ShowEditButton="True" Width="60px">
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
            <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="2" Caption="Nombre">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Rut" VisibleIndex="3" Caption="Rut">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="4" Caption="Dirección">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="5" Caption="Teléfono">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsText EmptyDataRow="No existen datos"></SettingsText>
        <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
        <SettingsPager PageSize="20"  />
        <Settings ShowTitlePanel="true" />
        <SettingsText Title="Proveedor" />
        <Settings ShowFilterRow="True" ShowFooter="True" />
        <SettingsBehavior AllowSelectByRowClick="true" />
        <Styles>
            <SelectedRow BackColor="#1d89c8"></SelectedRow>                                     
        </Styles>
                    
    </dx:ASPxGridView>
    </div>
    
    <dx:ASPxPopupControl ID="PopUpNewProveedor" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewProveedor"
        HeaderText="Creación de Proveedor" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                    <td rowspan="5">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Nombre</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNombre" ID="txtNombre" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="5">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Rut</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtRut" ID="txtRut" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Dirección</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDireccion" ID="txtDireccion" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Teléfono</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTelefono" ID="txtTelefono" runat="server" class="input-text" required/>
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
    
    <asp:SqlDataSource ID="SqlProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetProveedor" SelectCommandType="StoredProcedure" UpdateCommand="UpdProveedor" UpdateCommandType="StoredProcedure" >
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Rut" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <script>
        $("#btnNewProveedor").click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormProveedor();
            PopUpNewProveedor.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewProveedor.Hide();
            gridProveedor.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            
            var nombre = $("#<%= txtNombre.ClientID %>").val();
            var rut = $("#<%= txtRut.ClientID %>").val();
            var direccion = $("#<%= txtDireccion.ClientID %>").val();
            var telefono = $("#<%= txtTelefono.ClientID %>").val();

            if (nombre == "" || rut == "" || direccion == "" || telefono == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos obligatorios para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "nombre": nombre, "rut": rut, "direccion": direccion, "telefono": telefono };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Configuracion/Proveedor.aspx/InsertaProveedor")%>',
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
                ClearFormProveedor();
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

        function ClearFormProveedor() {
            $("#<%= txtNombre.ClientID %>").val('');
            $("#<%= txtRut.ClientID %>").val('');
            $("#<%= txtDireccion.ClientID %>").val('');
            $("#<%= txtTelefono.ClientID %>").val('');
        }

    </script>
</asp:Content>
