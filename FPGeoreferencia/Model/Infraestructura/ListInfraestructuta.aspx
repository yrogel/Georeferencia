<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListInfraestructuta.aspx.cs" Inherits="FPGeoreferencia.Model.Infraestructura.ListInfraestructuta" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #bloque {
            width: 100%;
        }

        .A {
            width: auto;
            padding: 10px 0;
            margin: 0;
            vertical-align: bottom;
        }
        .B {
            width: auto;
            padding: 10px 0 10px 10px;
            margin: 0;
            vertical-align: bottom;
        }
        #bloque .A, #bloque .B {
            display: inline-block;
        }
        .fecha {
            display: inline-table;
            margin-right: 0.4em;
        }
        .tab-v1 .tab-content img {
            margin: 0;
        }
    </style>

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
            <li class="active">Infraestructura</li>
		</ul>
	</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <div class="panel panel-info margin-bottom-10">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-tasks"></i>Código Centro - <strong><asp:Label runat="server" ID="lblCentroCultivo"></asp:Label></strong></h3>
		</div>
	</div>

    <button class="btn rounded btn-success" type="button" id="btnVolver"><i class="fa fa-reply-all"></i></button>
    <div style="height: 10px;"></div>
    <asp:HiddenField ID="HidIdCentroCultivo" runat="server" />
    <asp:HiddenField ID="txtTab" runat="server" Value="1" />
    
    <div id="bloque">
        <div class="A">
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <contenttemplate>
                Módulos&nbsp;
                <asp:DropDownList ID="ddlModuloByCentro" CssClass="input-text" OnSelectedIndexChanged="Modulos_SelectedIndexChanged" AutoPostBack="true" runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;Líneas&nbsp;
                <asp:DropDownList ID="ddLineasByModulo" CssClass="input-text" runat="server">
                </asp:DropDownList>
            </contenttemplate>
        </asp:UpdatePanel>
        </div>
        <div class="B">
        <input type="button" id="btnBuscar" name="btnBuscar" class="btn rounded btn-success" value="Buscar"/>
        </div>
    </div>
    
    <div style="height: 10px;"></div>

    <div class="tab-v1">
	    <ul class="nav nav-tabs">
		    <li id="itemBoya" onclick="CambioTab(1)"><a href="#boya" data-toggle="tab">Boyas</a></li>
		    <li id="itemLineaMadre" onclick="CambioTab(2)"><a href="#lineaMadre" data-toggle="tab">Linea Madre</a></li>
		    <li id="itemFondeo" onclick="CambioTab(3)"><a href="#fondeo" data-toggle="tab">Fondeo</a></li>
	    </ul>
		<div class="tab-content">
			<div class="tab-pane fade in" id="boya">
			    
			    <input type="button" id="btnNewBoya" name="btnNewBoya" class="btn rounded btn-success" value="Nuevo"/>
                <div style="height: 10px;"></div>
                
			    <dx:ASPxGridView ID="gridBoyas" ClientInstanceName="gridBoyas" runat="server" DataSourceID="SqlDataSource1" 
                    KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCustomCallback" EnableCallBacks="False">
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
                        <dx:GridViewDataTextColumn FieldName="linea" VisibleIndex="2" Caption="Línea">
                            <HeaderStyle Font-Bold="True" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Id_Proveedor" VisibleIndex="3" Caption="Proveedor">
                            <HeaderStyle Font-Bold="True" />
                            <PropertiesComboBox DataSourceID="SqlProveedor" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4" Caption="Cantidad">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Id_Volumen" VisibleIndex="5" Caption="Volumen">
                            <HeaderStyle Font-Bold="True" />
                            <PropertiesComboBox DataSourceID="SqlVolumen" ValueType="System.Int32" ValueField="Id" TextField="Valor" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Id_Material" VisibleIndex="6" Caption="Material">
                            <HeaderStyle Font-Bold="True" />
                            <PropertiesComboBox DataSourceID="SqlMaterial" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Espesor" VisibleIndex="7" Caption="Espesor">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn FieldName="Fecha_Ingreso_Agua" VisibleIndex="8" Caption="Fecha Ingreso Agua">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataColumn>
            
                    </Columns>
                    <SettingsText EmptyDataRow="No existen datos"></SettingsText>
                    <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
                    <SettingsPager PageSize="20"  />
                    <Settings ShowTitlePanel="true" />
                    <SettingsText Title="Boyas" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                    <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                    <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
                    <SettingsText CommandDelete="Eliminar" />
                    <SettingsBehavior AllowSelectByRowClick="true" />
                    <Styles>
                        <SelectedRow BackColor="#1d89c8"></SelectedRow>                                     
                    </Styles>
                    
                </dx:ASPxGridView>
				
			</div>
			<div class="tab-pane fade in" id="lineaMadre">
			    
                <input type="button" id="btnNewLineaMadre" name="btnNewLineaMadre" class="btn rounded btn-success" value="Nuevo"/>
                <div style="height: 10px;"></div>
                
			    <dx:ASPxGridView ID="gridLineaMadre" ClientInstanceName="gridLineaMadre" runat="server" DataSourceID="SqlLineaMadre" 
                    KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillaLineaMadreCustomCallback" EnableCallBacks="False">
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
                        <dx:GridViewDataTextColumn FieldName="linea" VisibleIndex="2" Caption="Línea">
                            <HeaderStyle Font-Bold="True" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Id_Proveedor" VisibleIndex="3" Caption="Proveedor">
                            <HeaderStyle Font-Bold="True" />
                            <PropertiesComboBox DataSourceID="SqlProveedor" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Material_Cabo" VisibleIndex="4" Caption="Material Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Diametro_Cabo" VisibleIndex="5" Caption="Diametro Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Largo_Cabo" VisibleIndex="6" Caption="Largo Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn FieldName="Fecha_Instalacion" VisibleIndex="7" Caption="Fecha Instalación">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataColumn>
            
                    </Columns>
                    <SettingsText EmptyDataRow="No existen datos"></SettingsText>
                    <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
                    <SettingsPager PageSize="20"  />
                    <Settings ShowTitlePanel="true" />
                    <SettingsText Title="Linea Madre" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                    <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                    <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
                    <SettingsText CommandDelete="Eliminar" />
                    <SettingsBehavior AllowSelectByRowClick="true" />
                    <Styles>
                        <SelectedRow BackColor="#1d89c8"></SelectedRow>                                     
                    </Styles>
                    
                </dx:ASPxGridView>
								
			</div>
			<div class="tab-pane fade in" id="fondeo">
			    
                <input type="button" id="btnNewFondeo" name="btnNewFondeo" class="btn rounded btn-success" value="Nuevo"/>
                <div style="height: 10px;"></div>
                
			    <dx:ASPxGridView ID="gridFondeo" ClientInstanceName="gridFondeo" runat="server" DataSourceID="SqlFondeo" 
                    KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillaFondeoCustomCallback" EnableCallBacks="False">
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
                        <dx:GridViewDataTextColumn FieldName="linea" VisibleIndex="2" Caption="Línea">
                            <HeaderStyle Font-Bold="True" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Numero" VisibleIndex="3" Caption="Número">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Tamaño" VisibleIndex="4" Caption="Tamaño">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Material" VisibleIndex="5" Caption="Material">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Forma" VisibleIndex="6" Caption="Forma">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Profunfidad" VisibleIndex="7" Caption="Profunfidad">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Material_Cabo" VisibleIndex="8" Caption="Material Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Diametro_Cabo" VisibleIndex="9" Caption="Diametro Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Largo_Cabo" VisibleIndex="10" Caption="Largo Cabo">
                            <HeaderStyle Font-Bold="True" />
                        </dx:GridViewDataTextColumn>
            
                    </Columns>
                    <SettingsText EmptyDataRow="No existen datos"></SettingsText>
                    <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
                    <SettingsPager PageSize="20"  />
                    <Settings ShowTitlePanel="true" />
                    <SettingsText Title="Fondeo" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                    <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                    <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
                    <SettingsText CommandDelete="Eliminar" />
                    <SettingsBehavior AllowSelectByRowClick="true" />
                    <Styles>
                        <SelectedRow BackColor="#1d89c8"></SelectedRow>                                     
                    </Styles>
                    
                </dx:ASPxGridView>
                		
			</div>
							
		</div>
	</div>
    
    <dx:ASPxPopupControl ID="PopUpNewBoya" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewBoya"
        HeaderText="Creación de Boya" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                    <td rowspan="9">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Módulo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlModulo" name="ddlModulo" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="9">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Línea</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlLinea" name="ddlLinea" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Cantidad</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtCantidad" ID="txtCantidad" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Volumen(lts)</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlVolumen" name="ddlVolumen" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Material</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlMaterial" name="ddlMaterial" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Espesor(mm)</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtEspesor" ID="txtEspesor" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Proveedor</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlProveedor" name="ddlProveedor" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Fecha ingreso al agua</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <dx:ASPxDateEdit CssClass="fecha" ID="txtFechaIngresoAgua" ClientInstanceName="txtFechaIngresoAgua" Theme="Metropolis" runat="server" EditFormatString="dd/MM/yyyy" Width="200px">
                                        </dx:ASPxDateEdit><span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelarBoya">Cancelar</button>
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
    
    <dx:ASPxPopupControl ID="PopUpNewLineaMadre" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewLineaMadre"
        HeaderText="Creación de Línea Madre" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
        <ModalBackgroundStyle BackColor="Black" Opacity="30" />
        <SizeGripImage Width="11px" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server" DefaultButton="btCreate">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
				            <h5>Ingrese toda la información (<span class="color-red">*</span>)</h5>
                            
                            <div runat="server" id="mensajeLineaMadre">
                                <strong><asp:Label runat="server" ID="lblErrorLineaMadre" /></strong>
				            </div>
                                        
                            <table style="width: 100%;" >
                                <tr>
                                    <td rowspan="8">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Módulo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlModuloLineaMadre" name="ddlModuloLineaMadre" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="8">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Línea</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlLineaLineaMadre" name="ddlLineaLineaMadre" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Material cabo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtMaterialCaboLineaMadre" ID="txtMaterialCaboLineaMadre" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Diametro cabo</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDiametroCaboLineaMadre" ID="txtDiametroCaboLineaMadre" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Largo cabo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLargoCaboLineaMadre" ID="txtLargoCaboLineaMadre" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Proveedor</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlProveedorLineaMadre" name="ddlProveedorLineaMadre" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Fecha instalación</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <dx:ASPxDateEdit CssClass="fecha" ID="txtFechaInstalacion" ClientInstanceName="txtFechaInstalacion" Theme="Metropolis" runat="server" EditFormatString="dd/MM/yyyy" Width="200px">
                                        </dx:ASPxDateEdit><span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelarLineaMadre">Cancelar</button>
                                            <input type="button" id="btnGuardarLineaMadre" name="btnGuardarLineaMadre" class="btn-u" value="Guardar"/>
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
    
    <dx:ASPxPopupControl ID="PopUpNewFondeo" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewFondeo"
        HeaderText="Creación de Fondeo" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
        <ModalBackgroundStyle BackColor="Black" Opacity="30" />
        <SizeGripImage Width="11px" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel2" runat="server" DefaultButton="btCreate">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
				            <h5>Ingrese toda la información (<span class="color-red">*</span>)</h5>
                            
                            <div runat="server" id="mensajeFondeo">
                                <strong><asp:Label runat="server" ID="lblErrorFondeo" /></strong>
				            </div>
                                        
                            <table style="width: 100%;" >
                                <tr>
                                    <td rowspan="11">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Módulo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlModuloFondeo" name="ddlModuloFondeo" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="11">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Línea</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlLineaFondeo" name="ddlLineaFondeo" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Número</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNumero" ID="txtNumero" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Tamaño</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTamaño" ID="txtTamaño" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Material</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtMaterial" ID="txtMaterial" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Forma</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtForma" ID="txtForma" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Profundidad</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtProfundidad" ID="txtProfundidad" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Material cabo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtMaterialCaboFondeo" ID="txtMaterialCaboFondeo" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Diametro cabo</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDiametroCaboFondeo" ID="txtDiametroCaboFondeo" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Largo cabo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLargoCaboFondeo" ID="txtLargoCaboFondeo" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelarFondeo">Cancelar</button>
                                            <input type="button" id="btnGuardarFondeo" name="btnGuardarFondeo" class="btn-u" value="Guardar"/>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetBoyaByLinea" SelectCommandType="StoredProcedure" UpdateCommand="UpdBoya" UpdateCommandType="StoredProcedure" DeleteCommand="DelBoya" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" Type="Int32" />
            <asp:ControlParameter ControlID="ddLineasByModulo" Name="id_linea" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id_Proveedor" Type="Int32" />
            <asp:Parameter Name="Cantidad" Type="Int32" />
            <asp:Parameter Name="Id_Material" Type="Int32" />
            <asp:Parameter Name="Id_Volumen" Type="Int32" />
            <asp:Parameter Name="Espesor" Type="Decimal" />
            <asp:Parameter Name="Fecha_Ingreso_Agua" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlLineaMadre" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetLineaMadreByLinea" SelectCommandType="StoredProcedure" UpdateCommand="UpdLineaMadre" UpdateCommandType="StoredProcedure" DeleteCommand="DelLineaMadre" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" Type="Int32" />
            <asp:ControlParameter ControlID="ddLineasByModulo" Name="id_linea" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id_Proveedor" Type="Int32" />
            <asp:Parameter Name="Material_Cabo" Type="String" />
            <asp:Parameter Name="Diametro_Cabo" Type="Decimal" />
            <asp:Parameter Name="Largo_Cabo" Type="Decimal" />
            <asp:Parameter Name="Fecha_Instalacion" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlFondeo" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetFondeoByLinea" SelectCommandType="StoredProcedure" UpdateCommand="UpdFondeo" UpdateCommandType="StoredProcedure" DeleteCommand="DelFondeo" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" Type="Int32" />
            <asp:ControlParameter ControlID="ddLineasByModulo" Name="id_linea" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Numero" Type="String" />
            <asp:Parameter Name="Tamaño" Type="Decimal" />
            <asp:Parameter Name="Material" Type="String" />
            <asp:Parameter Name="Forma" Type="String" />
            <asp:Parameter Name="Profunfidad" Type="Decimal" />
            <asp:Parameter Name="Material_Cabo" Type="String" />
            <asp:Parameter Name="Diametro_Cabo" Type="Decimal" />
            <asp:Parameter Name="Largo_Cabo" Type="Decimal" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetMaterial" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetProveedor" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlVolumen" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetVolumen" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    <script>
        $("#btnNewBoya").click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormBoya();
            PopUpNewBoya.Show();
        });
        
        $("#btnNewLineaMadre").click(function () {
            $("#<%= mensajeLineaMadre.ClientID %>").css('display', 'none');
            ClearFormLineaMadre();
            PopUpNewLineaMadre.Show();
        });

        $("#btnNewFondeo").click(function () {
            $("#<%= mensajeFondeo.ClientID %>").css('display', 'none');
            ClearFormFondeo();
            PopUpNewFondeo.Show();
        });

        $('#btnCancelarBoya').click(function () {
            PopUpNewBoya.Hide();
            gridBoyas.PerformCallback("databind");
        });

        $('#btnCancelarLineaMadre').click(function () {
            PopUpNewLineaMadre.Hide();
            gridLineaMadre.PerformCallback("databind");
        });

        $('#btnCancelarFondeo').click(function () {
            PopUpNewFondeo.Hide();
            gridFondeo.PerformCallback("databind");
        });

        $('#btnBuscar').click(function () {
            gridBoyas.PerformCallback("databind");
            gridLineaMadre.PerformCallback("databind");
            gridFondeo.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var linea = $("#<%= ddlLinea.ClientID %>").val();
            var cantidad = $("#<%= txtCantidad.ClientID %>").val();
            var volumen = $("#<%= ddlVolumen.ClientID %>").val();
            var material = $("#<%= ddlMaterial.ClientID %>").val();
            var espesor = $("#<%= txtEspesor.ClientID %>").val();
            var proveedor = $("#<%= ddlProveedor.ClientID %>").val();
            var fecha = txtFechaIngresoAgua.GetText();
            //var fecha = txtFechaIngresoAgua.GetDate();

            if (modulo == 0 || linea == 0 || cantidad == "" || volumen == 0 || material == 0 || espesor == "" || proveedor == 0 || fecha == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass( "alert alert-danger fade in" );
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "linea": linea, "cantidad": cantidad, "volumen": volumen, "material": material, "espesor": espesor, "proveedor": proveedor, "fecha": fecha };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/InsertaBoya")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,                   
                    error: OnError
                });
            }
        });

        $('#btnGuardarLineaMadre').click(function () {
            var modulo = $("#<%= ddlModuloLineaMadre.ClientID %>").val();
            var linea = $("#<%= ddlLineaLineaMadre.ClientID %>").val();
            var materialCabo = $("#<%= txtMaterialCaboLineaMadre.ClientID %>").val();
            var diametroCabo = $("#<%= txtDiametroCaboLineaMadre.ClientID %>").val();
            var largoCabo = $("#<%= txtLargoCaboLineaMadre.ClientID %>").val();
            var proveedor = $("#<%= ddlProveedorLineaMadre.ClientID %>").val();
            var fecha = txtFechaInstalacion.GetText();
            //var fecha = txtFechaIngresoAgua.GetDate();

            if (modulo == 0 || linea == 0 || materialCabo == "" || diametroCabo == "" || largoCabo == "" || proveedor == 0 || fecha == "") {
                $("#<%= lblErrorLineaMadre.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensajeLineaMadre.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeLineaMadre.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "linea": linea, "materialCabo": materialCabo, "diametroCabo": diametroCabo, "largoCabo": largoCabo, "proveedor": proveedor, "fecha": fecha };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/InsertaLineaMadre")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessLineaMadre,
                    error: OnErrorLineaMadre
                });
            }
        });

        $('#btnGuardarFondeo').click(function () {
            var modulo = $("#<%= ddlModuloFondeo.ClientID %>").val();
            var linea = $("#<%= ddlLineaFondeo.ClientID %>").val();
            var numero = $("#<%= txtNumero.ClientID %>").val();
            var tamaño = $("#<%= txtTamaño.ClientID %>").val();
            var material = $("#<%= txtMaterial.ClientID %>").val();
            var forma = $("#<%= txtForma.ClientID %>").val();
            var profundidad = $("#<%= txtProfundidad.ClientID %>").val();
            var materialCabo = $("#<%= txtMaterialCaboFondeo.ClientID %>").val();
            var diametroCabo = $("#<%= txtDiametroCaboFondeo.ClientID %>").val();
            var largoCabo = $("#<%= txtLargoCaboFondeo.ClientID %>").val();

            if (modulo == 0 || linea == 0 || numero == "" || tamaño == "" || material == "" || forma == "" || profundidad == "" || materialCabo == "" || diametroCabo == "" || largoCabo == "") {
                $("#<%= lblErrorFondeo.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensajeFondeo.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeFondeo.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "linea": linea, "numero": numero, "tamaño": tamaño, "material": material, "forma": forma, "profundidad": profundidad, "materialCabo": materialCabo, "diametroCabo": diametroCabo, "largoCabo": largoCabo };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/InsertaFondeo")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessFondeo,
                    error: OnErrorFondeo
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
                ClearFormBoya();
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

        function OnSuccessLineaMadre(msg) {
            //alert(msg.d);
            if (msg.d == 0) {
                $("#<%= lblErrorLineaMadre.ClientID %>").text("Se ingreso correctamente los datos.");
                $("#<%= mensajeLineaMadre.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-success fade in");
                $("#<%= mensajeLineaMadre.ClientID %>").css('display', 'block');
                $("#<%= mensajeLineaMadre.ClientID %>").fadeOut(5000);
                ClearFormLineaMadre();
            } else {
                $("#<%= lblErrorLineaMadre.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
                $("#<%= mensajeLineaMadre.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeLineaMadre.ClientID %>").css('display', 'block');
            }
        }

        function OnErrorLineaMadre(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblErrorLineaMadre.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
            $("#<%= mensajeLineaMadre.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensajeLineaMadre.ClientID %>").css('display', 'block');
        }

        function OnSuccessFondeo(msg) {
            //alert(msg.d);
            if (msg.d == 0) {
                $("#<%= lblErrorFondeo.ClientID %>").text("Se ingreso correctamente los datos.");
                $("#<%= mensajeFondeo.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-success fade in");
                $("#<%= mensajeFondeo.ClientID %>").css('display', 'block');
                $("#<%= mensajeFondeo.ClientID %>").fadeOut(5000);
                ClearFormFondeo();
            } else {
                $("#<%= lblErrorFondeo.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
                $("#<%= mensajeFondeo.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeFondeo.ClientID %>").css('display', 'block');
            }
        }

        function OnErrorFondeo(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblErrorFondeo.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
            $("#<%= mensajeFondeo.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensajeFondeo.ClientID %>").css('display', 'block');
        }

        function ClearFormBoya() {
            $("#<%= ddlModulo.ClientID %>").val('0');
            $("#<%= ddlLinea.ClientID %>").val('0');
            $("#<%= txtCantidad.ClientID %>").val('');
            $("#<%= ddlVolumen.ClientID %>").val('0');
            $("#<%= ddlMaterial.ClientID %>").val('0');
            $("#<%= txtEspesor.ClientID %>").val('');
            $("#<%= ddlProveedor.ClientID %>").val('0');
            txtFechaIngresoAgua.GetInputElement().value = "";
        }

        function ClearFormLineaMadre() {
            $("#<%= ddlModuloLineaMadre.ClientID %>").val('0');
            $("#<%= ddlLineaLineaMadre.ClientID %>").val('0');
            $("#<%= txtMaterialCaboLineaMadre.ClientID %>").val('');
            $("#<%= txtDiametroCaboLineaMadre.ClientID %>").val('');
            $("#<%= txtLargoCaboLineaMadre.ClientID %>").val('');
            $("#<%= ddlProveedorLineaMadre.ClientID %>").val('0');
            txtFechaInstalacion.GetInputElement().value = "";
        }

        function ClearFormFondeo() {
            $("#<%= ddlModuloFondeo.ClientID %>").val('0');
            $("#<%= ddlLineaFondeo.ClientID %>").val('0');
            $("#<%= txtNumero.ClientID %>").val('');
            $("#<%= txtTamaño.ClientID %>").val('');
            $("#<%= txtMaterial.ClientID %>").val('');
            $("#<%= txtForma.ClientID %>").val('');
            $("#<%= txtProfundidad.ClientID %>").val('');
            $("#<%= txtMaterialCaboFondeo.ClientID %>").val('');
            $("#<%= txtDiametroCaboFondeo.ClientID %>").val('');
            $("#<%= txtLargoCaboFondeo.ClientID %>").val('');
        }

        $("#<%= ddlModulo.ClientID %>").change(function() {
            //alert($("#<%= ddlModulo.ClientID %>").val());
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var obj = { "modulo": modulo };
            
            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/ObtenerLineaByModulo")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //alert(data.d);
                    if (data != null) {
                        var lineas = data.d;
                        var linea = eval('(' + lineas + ')');
                        $("#<%= ddlLinea.ClientID %>").empty();
                        $("#<%= ddlLinea.ClientID %>").append('<option value="0">Seleccione</option>');
                        for (i in linea) {
                            $("#<%= ddlLinea.ClientID %>").append('<option value="' + linea[i]["Id"] + '">' + linea[i]["Nombre"] + '</option>');
                        }
                    }
                },
                error: function(data) {
                    //alert(data.d);
                }
            });
        });

        $("#<%= ddlModuloLineaMadre.ClientID %>").change(function () {
            //alert($("#<%= ddlModulo.ClientID %>").val());
            var modulo = $("#<%= ddlModuloLineaMadre.ClientID %>").val();
            var obj = { "modulo": modulo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/ObtenerLineaByModulo")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //alert(data.d);
                    if (data != null) {
                        var lineas = data.d;
                        var linea = eval('(' + lineas + ')');
                        $("#<%= ddlLineaLineaMadre.ClientID %>").empty();
                        $("#<%= ddlLineaLineaMadre.ClientID %>").append('<option value="0">Seleccione</option>');
                        for (i in linea) {
                            $("#<%= ddlLineaLineaMadre.ClientID %>").append('<option value="' + linea[i]["Id"] + '">' + linea[i]["Nombre"] + '</option>');
                        }
                    }
                },
                error: function (data) {
                    //alert(data.d);
                }
            });
        });

        $("#<%= ddlModuloFondeo.ClientID %>").change(function () {
            //alert($("#<%= ddlModulo.ClientID %>").val());
            var modulo = $("#<%= ddlModuloFondeo.ClientID %>").val();
            var obj = { "modulo": modulo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Infraestructura/ListInfraestructuta.aspx/ObtenerLineaByModulo")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //alert(data.d);
                    if (data != null) {
                        var lineas = data.d;
                        var linea = eval('(' + lineas + ')');
                        $("#<%= ddlLineaFondeo.ClientID %>").empty();
                        $("#<%= ddlLineaFondeo.ClientID %>").append('<option value="0">Seleccione</option>');
                        for (i in linea) {
                            $("#<%= ddlLineaFondeo.ClientID %>").append('<option value="' + linea[i]["Id"] + '">' + linea[i]["Nombre"] + '</option>');
                        }
                    }
                },
                error: function (data) {
                    //alert(data.d);
                }
            });
        });

        function CambioTab(id) {
            $("#<%= txtTab.ClientID %>").val(id);
        }
        
        $(document).ready(function () {
            <%--alert($("#<%= txtTab.ClientID %>").val());--%>
            var tabVal = $("#<%= txtTab.ClientID %>").val();
            if (tabVal == 1) {
                $("#itemBoya").addClass("active");
                $("#boya").addClass("tab-pane fade in active");
            } else {
                if (tabVal == 2) {
                    $("#itemLineaMadre").addClass("active");
                    $("#lineaMadre").addClass("tab-pane fade in active");
                } else {
                    if (tabVal == 3) {
                        $("#itemFondeo").addClass("active");
                        $("#fondeo").addClass("tab-pane fade in active");
                    }
                }
            }
           
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '<%=ResolveUrl("~/Concesion/Detalle/")%>' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>
</asp:Content>
