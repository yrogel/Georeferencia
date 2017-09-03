<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Siembra.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.Siembra" %>
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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Administración</li>
			<li>Concesiones</li>
            <li>Centro Cultivo</li>
            <li class="active">Siembra</li>
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
    
    <input type="button" id="btnNewSiembra" name="btnNewSiembra" class="btn rounded btn-success" value="Nuevo"/>
    <div style="height: 10px;"></div>
    
    <dx:ASPxGridView ID="gridSiembra" ClientInstanceName="gridSiembra" runat="server" DataSourceID="SqlSiembra" 
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
            <dx:GridViewDataComboBoxColumn FieldName="Id_Tipo_Siembra" VisibleIndex="4" Caption="Condición Siembra">
                <HeaderStyle Font-Bold="True" />
                <PropertiesComboBox DataSourceID="SqlTipoSiembra" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Origen_Semilla" VisibleIndex="5" Caption="Origen Semilla">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tamaño_Semilla" VisibleIndex="6" Caption="Tamaño Semilla">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Densidad" VisibleIndex="7" Caption="Densidad">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="Fecha_Siembra" VisibleIndex="8" Caption="Fecha Siembra">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            
        </Columns>
        <SettingsText EmptyDataRow="No existen datos"></SettingsText>
        <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
        <SettingsPager PageSize="20"  />
        <Settings ShowTitlePanel="true" />
        <SettingsText Title="Siembra" />
        <Settings ShowFilterRow="True" ShowFooter="True" />
        <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
        <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
        <SettingsText CommandDelete="Eliminar" />
        <SettingsBehavior AllowSelectByRowClick="true" />
        <Styles>
            <SelectedRow BackColor="#1d89c8"></SelectedRow>                                     
        </Styles>
                    
    </dx:ASPxGridView>
    
    <dx:ASPxPopupControl ID="PopUpNewSiembra" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewSiembra"
        HeaderText="Creación de Siembra" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                        <label class="label-text">Origen semilla</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtOrigenSemilla" ID="txtOrigenSemilla" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Tamaño semilla</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTamañoSemilla" ID="txtTamañoSemilla" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Densidad siembra(N/M)</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDensidad" ID="txtDensidad" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Condición siembra</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlTipoSiembra" name="ddlTipoSiembra" runat="server" class="input-text" required>
                                        </select>
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
                                        <label class="label-text">Fecha siembra</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <dx:ASPxDateEdit CssClass="fecha" ID="txtFechaSiembra" ClientInstanceName="txtFechaSiembra" Theme="Metropolis" runat="server" EditFormatString="dd/MM/yyyy" Width="200px">
                                        </dx:ASPxDateEdit><span class="color-red">*</span>
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
    
    <asp:SqlDataSource ID="SqlSiembra" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetSiembra" SelectCommandType="StoredProcedure" UpdateCommand="UpdSiembra" UpdateCommandType="StoredProcedure" DeleteCommand="DelSiembra" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" Type="Int32" />
            <asp:ControlParameter ControlID="ddLineasByModulo" Name="id_linea" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id_Proveedor" Type="Decimal" />
            <asp:Parameter Name="Id_Tipo_Siembra" Type="Decimal" />
            <asp:Parameter Name="Origen_Semilla" Type="String" />
            <asp:Parameter Name="Tamaño_Semilla" Type="Decimal" />
            <asp:Parameter Name="Densidad" Type="Decimal" />
            <asp:Parameter Name="Fecha_Siembra" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetProveedor" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlTipoSiembra" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetTipoSiembra" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <script>
        $("#btnNewSiembra").click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormSiembra();
            PopUpNewSiembra.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewSiembra.Hide();
            gridSiembra.PerformCallback("databind");
        });

        $('#btnBuscar').click(function () {
            gridSiembra.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var linea = $("#<%= ddlLinea.ClientID %>").val();
            var densidad = $("#<%= txtDensidad.ClientID %>").val();
            var tipoSiembra = $("#<%= ddlTipoSiembra.ClientID %>").val();
            var origenSemilla = $("#<%= txtOrigenSemilla.ClientID %>").val();
            var tamañoSemilla = $("#<%= txtTamañoSemilla.ClientID %>").val();
            var proveedor = $("#<%= ddlProveedor.ClientID %>").val();
            var fecha = txtFechaSiembra.GetText();
            //var fecha = txtFechaSiembra.GetDate();

            if (modulo == 0 || linea == 0 || densidad == "" || tipoSiembra == 0 || origenSemilla == "" || tamañoSemilla == "" || proveedor == 0 || fecha == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "linea": linea, "densidad": densidad, "tipoSiembra": tipoSiembra, "origenSemilla": origenSemilla, "tamañoSemilla": tamañoSemilla, "proveedor": proveedor, "fecha": fecha };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Concesion/Siembra.aspx/InsertaSiembra")%>',
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
                ClearFormSiembra();
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

        function ClearFormSiembra() {
            $("#<%= ddlModulo.ClientID %>").val('0');
            $("#<%= ddlLinea.ClientID %>").val('0');
            $("#<%= txtDensidad.ClientID %>").val('');
            $("#<%= ddlTipoSiembra.ClientID %>").val('0');
            $("#<%= txtOrigenSemilla.ClientID %>").val('');
            $("#<%= txtTamañoSemilla.ClientID %>").val('');
            $("#<%= ddlProveedor.ClientID %>").val('0');
            txtFechaSiembra.GetInputElement().value = "";
        }

        $("#<%= ddlModulo.ClientID %>").change(function () {
            //alert($("#<%= ddlModulo.ClientID %>").val());
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var obj = { "modulo": modulo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Concesion/Siembra.aspx/ObtenerLineaByModulo")%>',
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
                error: function (data) {
                    //alert(data.d);
                }
            });
        });
    
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '<%=ResolveUrl("~/Concesion/Detalle/")%>' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>

</asp:Content>
