<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListModulo.aspx.cs" Inherits="FPGeoreferencia.Model.Modulo.ListModulo" %>
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
            <li class="active">Módulos</li>
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
    <input type="button" id="btnNewModulo" class="btn rounded btn-success" value="Nuevo"/>
    
    <dx:ASPxPopupControl ID="PopUpNewModulo" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewModulo"
        HeaderText="Creación de Módulo" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
        
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
                                    <td rowspan="10">
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
                                    <td rowspan="10">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Cantidad Lineas</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtCantidadLineas" ID="txtCantidadLineas" onKeyPress="return soloNumeros(event)" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Largo Linea</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLargoLinea" ID="txtLargoLinea" runat="server" class="input-text" required/>
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
                                        <label class="label-text">Especie</label></td>
                                    <td class="pcmCellText">
                                        <select ID="ddlEspecie" name="ddlEspecie" runat="server" class="input-text" required>
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

        <dx:ASPxGridView ID="gridModulos" ClientInstanceName="gridModulos" runat="server" DataSourceID="SqlModulo"
            KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCustomCallback">
            <Columns>
                
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="#">
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

                <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="False">
                    <HeaderStyle Font-Bold="True" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="1" Caption="Nombre">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad_Lineas" VisibleIndex="2" Caption="Total Lineas">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Largo_Linea" VisibleIndex="3" Caption="Largo Linea">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Largo_Cuelga" VisibleIndex="4" Caption="Largo Cuelga">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Id_Especie" VisibleIndex="5" Caption="Especie">
                    <HeaderStyle Font-Bold="True" />
                    <PropertiesComboBox DataSourceID="SqlDataEspecie" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_E_Inicio" VisibleIndex="6" Caption="Coordenada E Inicio">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_E_Fin" VisibleIndex="7" Caption="Coordenada E Fin">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_N_Inicio" VisibleIndex="8" Caption="Coordenada N Inicio">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Coordenada_N_Fin" VisibleIndex="9" Caption="Coordenada N Fin">
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>
            
            </Columns>
            <SettingsText EmptyDataRow="No existen datos"></SettingsText>
            <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" ></SettingsText>
            <SettingsPager PageSize="20"  />
            <Settings ShowTitlePanel="true" />
            <SettingsText Title="Módulos" />
            <Settings ShowFilterRow="True" ShowFooter="True" />
        </dx:ASPxGridView>

    
    <asp:HiddenField ID="HidIdCentroCultivo" runat="server" />
    
    <asp:SqlDataSource ID="SqlModulo" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetModuloByCode" SelectCommandType="StoredProcedure" UpdateCommand="UpdModulo" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" PropertyName="Value" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Cantidad_Lineas" Type="Int32" />
            <asp:Parameter Name="Largo_Linea" Type="String" />
            <asp:Parameter Name="Largo_Cuelga" Type="Decimal" />
            <asp:Parameter Name="Id_Especie" Type="Int32" />
            <asp:Parameter Name="Coordenada_E_Inicio" Type="String" />
            <asp:Parameter Name="Coordenada_E_Fin" Type="String" />
            <asp:Parameter Name="Coordenada_N_Inicio" Type="String" />
            <asp:Parameter Name="Coordenada_N_Fin" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataEspecie" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetEspecie" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
   
    <script>
        
        $("#btnNewModulo").click(function () {
            $("#<%= txtNombre.ClientID %>").focus();
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormModulo();
            PopUpNewModulo.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewModulo.Hide();
            gridModulos.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {

            var nombre = $("#<%= txtNombre.ClientID %>").val();
            var cantidadLineas = $("#<%= txtCantidadLineas.ClientID %>").val();
            var largoLinea = $("#<%= txtLargoLinea.ClientID %>").val();
            var largoCuelga = $("#<%= txtLargoCuelga.ClientID %>").val();
            var especie = $("#<%= ddlEspecie.ClientID %>").val();
            var utmEInicio = $("#<%= txtUtmEInicio.ClientID %>").val();
            var utmEFin = $("#<%= txtUtmEFin.ClientID %>").val();
            var utmNInicio = $("#<%= txtUtmNInicio.ClientID %>").val();
            var utmNFin = $("#<%= txtUtmNFin.ClientID %>").val();
            var idCentroCultivo = $("#<%= HidIdCentroCultivo.ClientID %>").val();
            

            if (nombre == "" || cantidadLineas == "" || largoLinea == "" || largoCuelga == "" || especie == 0 || utmEInicio == "" || utmEFin == "" || utmNInicio == "" || utmNFin == "" || idCentroCultivo == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "nombre": nombre, "cantidadLineas": cantidadLineas, "largoLinea": largoLinea, "largoCuelga": largoCuelga, "especie": especie, "utmEInicio": utmEInicio, "utmEFin": utmEFin, "utmNInicio": utmNInicio, "utmNFin": utmNFin, "idCentroCultivo": idCentroCultivo };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Modulo/ListModulo.aspx/InsertaModulo")%>',
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
                $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").removeClass("alert alert-info fade in").addClass("alert alert-success fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
                $("#<%= mensaje.ClientID %>").fadeOut(5000);
                ClearFormModulo();
            } else {
                if (msg.d == 1) {
                    $("#<%= lblError.ClientID %>").text("Error al ingresar los datos, se alcanzó el límite de módulos permitidos.");
                    $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-info fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');
                } else {
                    $("#<%= lblError.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
                    $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');
                }
            }
        }

        function OnError(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblError.ClientID %>").text("Error al ingresar los datos, intente más tarde.");
            $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensaje.ClientID %>").css('display', 'block');
        }

        function ClearFormModulo() {
            $("#<%= txtNombre.ClientID %>").val('');
            $("#<%= txtCantidadLineas.ClientID %>").val('');
            $("#<%= txtLargoLinea.ClientID %>").val('');
            $("#<%= txtLargoCuelga.ClientID %>").val('');
            $("#<%= ddlEspecie.ClientID %>").val('0');
            $("#<%= txtUtmEInicio.ClientID %>").val('');
            $("#<%= txtUtmEFin.ClientID %>").val('');
            $("#<%= txtUtmNInicio.ClientID %>").val('');
            $("#<%= txtUtmNFin.ClientID %>").val('');
        }

        $(document).ready(function () {
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '<%=ResolveUrl("~/Concesion/Detalle/")%>' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>
</asp:Content>
