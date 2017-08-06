﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListLinea.aspx.cs" Inherits="FPGeoreferencia.Model.Linea.ListLinea" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode;
            return (key >= 48 && key <= 57);
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Administración</li>
			<li>Concesiones</li>
            <li>Centro Cultivo</li>
            <li class="active">Líneas</li>
		</ul>
	</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="panel panel-info margin-bottom-10">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-tasks"></i>Código Centro - <strong><asp:Label runat="server" ID="lblCentroCultivo"></asp:Label></strong></h3>
		</div>
	</div>

    <button class="btn rounded btn-success" type="button" id="btnVolver"><i class="fa fa-reply-all"></i></button>
    <input type="button" id="btnNewLinea" class="btn rounded btn-success" value="Nuevo"/>
    <br/>
    Módulos&nbsp;
    
    <asp:DropDownList ID="ddlModuloByCentro" CssClass="input-text" OnSelectedIndexChanged="Modulos_SelectedIndexChanged" AutoPostBack="true" runat="server">
    </asp:DropDownList>
    
    <dx:ASPxPopupControl ID="PopUpNewLinea" runat="server" ShowCloseButton="False" CloseAction="CloseButton"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewLinea"
        HeaderText="Creación de Línea" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                    <td rowspan="12">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Nombre</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNombre" ID="txtNombre" runat="server" class="input-text" required autofocus/>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="12">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Módulo</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlModulo" name="ddlModulo" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Metros</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtMetros" ID="txtMetros" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Tipo Línea</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlTipoLinea" name="ddlTipoLinea" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Total Cuelgas</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTotalCuelgas" ID="txtTotalCuelgas" onKeyPress="return soloNumeros(event)" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Largo Cuelga</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLargoCuelga" ID="txtLargoCuelga" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Tipo Cuelga</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlTipoCuelga" name="ddlTipoCuelga" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenadas UTM E Inicio</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmEInicio" ID="txtUtmEInicio" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenadas UTM E Fin</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmEFin" ID="txtUtmEFin" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenadas UTM N Inicio</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmNInicio" ID="txtUtmNInicio" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenadas UTM N Fin</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmNFin" ID="txtUtmNFin" runat="server" class="input-text" required/>
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

        <dx:ASPxGridView ID="gridLineas" ClientInstanceName="gridLineas" runat="server" DataSourceID="SqlDataSource1"
            KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCustomCallback">
            <Columns>
                
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="#" ShowDeleteButton="True" ShowEditButton="True" Width="60px">
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
                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="2" Caption="Nombre">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Metros" VisibleIndex="3" Caption="Metros">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Id_Tipo_Linea" VisibleIndex="4" Caption="Tipo Línea">
                    <HeaderStyle Font-Bold="True" />
                    <PropertiesComboBox DataSourceID="SqlDataLinea" ValueType="System.Int32" ValueField="Id" TextField="Nombre" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Cuelgas" VisibleIndex="5" Caption="Total Cuelgas">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Largo_Cuelga" VisibleIndex="6" Caption="Largo Cuelga">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Id_Tipo_Cuelga" VisibleIndex="7" Caption="Tipo Cuelga">
                    <HeaderStyle Font-Bold="True" />
                    <PropertiesComboBox DataSourceID="SqlDataCuelga" ValueType="System.Int32" ValueField="Id" TextField="Nombre" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_E_Inicio" VisibleIndex="8" Caption="Coordenada E Inicio">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_E_Fin" VisibleIndex="9" Caption="Coordenada E Fin">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_N_Inicio" VisibleIndex="10" Caption="Coordenada N Inicio">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_N_Fin" VisibleIndex="11" Caption="Coordenada N Fin">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
            
            </Columns>
            <SettingsText EmptyDataRow="No existen datos"></SettingsText>
            <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" ></SettingsText>
            <SettingsPager PageSize="20"  />
            <Settings ShowTitlePanel="true" />
            <SettingsText Title="Líneas" />
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
        </dx:ASPxGridView>

    
    <asp:HiddenField ID="HidIdCentroCultivo" runat="server" />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetLineaByModulo" SelectCommandType="StoredProcedure" UpdateCommand="UpdLinea" UpdateCommandType="StoredProcedure" DeleteCommand="DelLinea" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlModuloByCentro" Name="id_modulo" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id_Tipo_Linea" Type="Int32" />
            <asp:Parameter Name="Id_Tipo_Cuelga" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Metros" Type="Decimal" />
            <asp:Parameter Name="Total_Cuelgas" Type="Int32" />
            <asp:Parameter Name="Largo_Cuelga" Type="Decimal" />
            <asp:Parameter Name="Coordenada_E_Inicio" Type="String" />
            <asp:Parameter Name="Coordenada_E_Fin" Type="String" />
            <asp:Parameter Name="Coordenada_N_Inicio" Type="String" />
            <asp:Parameter Name="Coordenada_N_Fin" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataLinea" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetTipoLinea" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataCuelga" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetTipoCuelga" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
   
    <script>

        $("#btnNewLinea").click(function () {
            $("#<%= txtNombre.ClientID %>").focus();
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            PopUpNewLinea.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewLinea.Hide();
            gridLineas.PerformCallback("databind");
        });

        $(document).ready(function () {
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '/Administracion/Concesion/Detalle/' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>
</asp:Content>