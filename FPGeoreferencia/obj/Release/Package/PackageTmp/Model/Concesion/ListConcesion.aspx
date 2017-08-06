<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListConcesion.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.ListConcesion" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

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
    
    <dx:ASPxPopupControl ID="PopUpNewConcesion" runat="server" CloseAction="CloseButton" CloseOnEscape="true"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewConcesion"
        HeaderText="Creación de concesión" Modal="True" PopupAnimationType="Fade" EnableViewState="False" Theme="DevEx" Width="500px">
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
                                    <td rowspan="9">
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
                                    <td rowspan="9">
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
                                        <label class="label-text">Coordenada UTM E</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmE" ID="txtUtmE" class="input-text" runat="server" required />
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenada UTM N</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmN" ID="txtUtmN" class="input-text" runat="server" required/>
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

                                            <asp:Button ID="btnGuardar" class="btn-u" runat="server" OnClick="btnGuardar_Click" AutoPostBack="true" Text="Guardar"/>
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
            <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" ></SettingsText>
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
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="/Administracion/Concesion/Detalle/{0}" >
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
                <dx:GridViewDataTextColumn FieldName="Coordenada_E" VisibleIndex="4" Caption="Coordenada E">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_N" VisibleIndex="5" Caption="Coordenada N">
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
            
            </Columns>
            <Settings ShowFilterRow="True" ShowFooter="True" />
        </dx:ASPxGridView>

    
    <asp:HiddenField ID="Hididuser" runat="server" />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetCentroCultivo" SelectCommandType="StoredProcedure" UpdateCommand="UpdCentroCultivo" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Hididuser" Name="id_cliente" PropertyName="Value" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Decimal" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Direccion" Type="String" />
                <asp:Parameter Name="Coordenada_E" Type="String" />
                <asp:Parameter Name="Coordenada_N" Type="String" />
                <asp:Parameter Name="Superficie" Type="String" />
                <asp:Parameter Name="Total_Modulos" Type="Int32" />
                <asp:Parameter Name="Total_Lineas" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
   
    <script>
        $("#btnNewConcesion").click(function () {
            $("#<%= txtCodigo.ClientID %>").focus();
            PopUpNewConcesion.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewConcesion.Hide();
            gridConcesion.PerformCallback("databind");
        });

        <%--$(document).ready(function () {
            $('#btnGuardar').click(function () {
                alert($("#<%= txtCodigo.ClientID %>").val());
                gridConcesion.PerformCallback("databind");
            });
        });--%>
       
    </script>
    
</asp:Content>
