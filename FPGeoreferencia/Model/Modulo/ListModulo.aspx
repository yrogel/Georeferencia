<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListModulo.aspx.cs" Inherits="FPGeoreferencia.Model.Modulo.ListModulo" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
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
                                    <td rowspan="2">
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
                                    <td rowspan="2">
                                        <div class="pcmSideSpacer">
                                        </div>
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
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="3" Caption="Coordenadas UTM">
                  <HeaderStyle Font-Bold="True" />
                  <CellStyle HorizontalAlign="Center"/>
                  <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <button class="btn btn-info btn-xs" data-toggle="modal" onclick='AgregaCoordenada(<%#Eval("Id")%>)'><i class="icon-settings"></i> Configurar</button>
                    </DataItemTemplate>
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
    <asp:HiddenField ID="HidIdModulo" runat="server" />
    
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
                                        <label class="label-text">Código Módulo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtModulo" ID="txtModulo" class="input-text" runat="server" disabled />
                                    </td>
                                    <td rowspan="4">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenada UTM E</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtUtmX" ID="txtUtmX" class="input-text" runat="server" onfocus="this.select();" onkeyup="decimal(this,this.value.charAt(this.value.length-1))" />
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Coordenada UTM N</label>
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
                                    <dx:GridViewDataTextColumn FieldName="Coordenada_X" VisibleIndex="2" Caption="Coordenada UTM E">
                                        <HeaderStyle Font-Bold="True" />
                                        <EditItemTemplate>
                                             <input type="text" name="Coordenada_X" ID="Coordenada_X" runat="server" value='<%# Bind("Coordenada_X") %>' onfocus="this.select();" onkeyup="decimal(this,this.value.charAt(this.value.length-1))" />
                                        </EditItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Coordenada_Y" VisibleIndex="3" Caption="Coordenada UTM N">
                                        <HeaderStyle Font-Bold="True" />
                                        <EditItemTemplate>
                                             <input type="text" name="Coordenada_Y" ID="Coordenada_Y" runat="server" value='<%# Bind("Coordenada_Y") %>' onfocus="this.select();" onkeyup="decimal(this,this.value.charAt(this.value.length-1))" />
                                        </EditItemTemplate>
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
    
    <asp:SqlDataSource ID="SqlModulo" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetModuloByCode" SelectCommandType="StoredProcedure" UpdateCommand="UpdModulo" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" PropertyName="Value" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlCoordenadas" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetCoordenadasModulo" SelectCommandType="StoredProcedure" UpdateCommand="UpdCoordenadasModulo" UpdateCommandType="StoredProcedure" DeleteCommand="DelCoordenadasModulo" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdModulo" Name="id_modulo" PropertyName="Value" Type="Int32" />
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
        
        $("#btnNewModulo").click(function () {
            $("#<%= txtNombre.ClientID %>").focus();
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormModulo();
            PopUpNewModulo.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewModulo.Hide();
            //gridModulos.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {

            var nombre = $("#<%= txtNombre.ClientID %>").val();
            var idCentroCultivo = $("#<%= HidIdCentroCultivo.ClientID %>").val();
            

            if (nombre == "" || idCentroCultivo == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "nombre": nombre, "idCentroCultivo": idCentroCultivo };

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
                gridModulos.PerformCallback("databind");
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
        }

        function AgregaCoordenada(id) {
            //alert(id); 
            $("#<%= HidIdModulo.ClientID %>").val(id);
            $("#<%= txtModulo.ClientID %>").val(id);
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

            var modulo = $("#<%= txtModulo.ClientID %>").val();
            var utmX = $("#<%= txtUtmX.ClientID %>").val();
            var utmY = $("#<%= txtUtmY.ClientID %>").val();


            if (modulo == "" || utmX == "" || utmY == "") {
                $("#<%= lblErrorCoordenada.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensajeCoordenada.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensajeCoordenada.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "utmX": utmX, "utmY": utmY };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Modulo/ListModulo.aspx/InsertaCoordenadas")%>',
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

        $(document).ready(function () {
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '<%=ResolveUrl("~/Concesion/Detalle/")%>' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>
</asp:Content>
