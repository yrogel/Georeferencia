<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="FPGeoreferencia.Model.Configuracion.Usuario" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Configuración</li>
            <li class="active">Usuario</li>
		</ul>
	</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="height: 10px;"></div>
    
    <input type="button" id="btnNewUsuario" name="btnNewUsuario" class="btn rounded btn-success" value="Nuevo"/>
    <div style="height: 10px;"></div>
    
    <dx:ASPxGridView ID="gridUsuario" ClientInstanceName="gridUsuario" runat="server" DataSourceID="SqlUsuario" 
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
            <dx:GridViewDataComboBoxColumn FieldName="Id_Rol" VisibleIndex="2" Caption="Rol">
                <HeaderStyle Font-Bold="True" />
                <EditFormSettings Visible="False" />
                <PropertiesComboBox DataSourceID="SqlRol" ValueType="System.Int32" ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Login" VisibleIndex="3" Caption="Login">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Password" VisibleIndex="4" Caption="Password">
                <HeaderStyle Font-Bold="True" />
                <PropertiesTextEdit MaxLength="100" Password="True" />   
                <EditFormSettings Visible="False" />                    
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="5" Caption="Nombre">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="Direccion" VisibleIndex="6" Caption="Dirección">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Rut" VisibleIndex="7" Caption="Rut">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Telefono" VisibleIndex="8" Caption="Teléfono">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Correo" VisibleIndex="9" Caption="Correo">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Total_Centro_Cultivo" VisibleIndex="10" Caption="Total Conseciones">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Total_Modulos" VisibleIndex="11" Caption="Total Módulos">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
             <dx:GridViewDataColumn FieldName="Estado" VisibleIndex="12" Caption="Estado">
                <HeaderStyle Font-Bold="True" />
                 <EditFormSettings Visible="False" />
            </dx:GridViewDataColumn>
            
        </Columns>
        <SettingsText EmptyDataRow="No existen datos"></SettingsText>
        <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" CommandCancel="Cancelar" ></SettingsText>
        <SettingsPager PageSize="20"  />
        <Settings ShowTitlePanel="true" />
        <SettingsText Title="Usuarios" />
        <Settings ShowFilterRow="True" ShowFooter="True" />
        <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
        <SettingsText ConfirmDelete="¿Está seguro de eliminar el registro?" />
        <SettingsText CommandDelete="Eliminar" />
                    
    </dx:ASPxGridView>
    
    <dx:ASPxPopupControl ID="PopUpNewUsuario" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewUsuario"
        HeaderText="Creación de Usuario" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                    <td rowspan="11">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Login</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtLogin" ID="txtLogin" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                    <td rowspan="11">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Password</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtPassword" ID="txtPassword" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Rol</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlRol" name="ddlRol" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Nombre</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNombre" ID="txtNombre" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Rut</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtRut" ID="txtRut" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Dirección</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtDireccion" ID="txtDireccion" runat="server" class="input-text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Teléfono</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTelefono" ID="txtTelefono" runat="server" class="input-text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Correo</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtCorreo" ID="txtCorreo" runat="server" class="input-text"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Total Conseciones</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTotalConcesiones" ID="txtTotalConcesiones" onKeyPress="return soloNumeros(event)" maxlength="2" runat="server" class="input-text"/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Total Módulos</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTotalModulos" ID="txtTotalModulos" onKeyPress="return soloNumeros(event)" maxlength="2" runat="server" class="input-text"/>
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
    
    <asp:SqlDataSource ID="SqlUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetUsuario" SelectCommandType="StoredProcedure" UpdateCommand="UpdUsuario" UpdateCommandType="StoredProcedure" DeleteCommand="DelUsuario" DeleteCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Rut" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="Total_Centro_Cultivo" Type="String" />
            <asp:Parameter Name="Total_Modulos" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlRol" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetRol" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <script>
        $("#btnNewUsuario").click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            ClearFormUsuario();
            PopUpNewUsuario.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewUsuario.Hide();
            gridUsuario.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            
            var login = $("#<%= txtLogin.ClientID %>").val();
            var password = $("#<%= txtPassword.ClientID %>").val();
            var rol = $("#<%= ddlRol.ClientID %>").val();
            var nombre = $("#<%= txtNombre.ClientID %>").val();
            var rut = $("#<%= txtRut.ClientID %>").val();
            var direccion = $("#<%= txtDireccion.ClientID %>").val();
            var telefono = $("#<%= txtTelefono.ClientID %>").val();
            var correo = $("#<%= txtCorreo.ClientID %>").val();
            var totalConcesiones = $("#<%= txtTotalConcesiones.ClientID %>").val();
            var totalModulos = $("#<%= txtTotalModulos.ClientID %>").val();

            if (login == "" || password == "" || rol == 0 || nombre == "" || rut == "" || totalConcesiones == "" || totalModulos == "") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos obligatorios para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "login": login, "password": password, "rol": rol, "nombre": nombre, "rut": rut, "direccion": direccion, "telefono": telefono, "correo": correo, "totalConcesiones": totalConcesiones, "totalModulos": totalModulos };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Configuracion/Usuario.aspx/InsertaUsuario")%>',
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
                ClearFormUsuario();
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

        function ClearFormUsuario() {
            $("#<%= txtLogin.ClientID %>").val('');
            $("#<%= txtPassword.ClientID %>").val('');
            $("#<%= ddlRol.ClientID %>").val('0');
            $("#<%= txtNombre.ClientID %>").val('');
            $("#<%= txtRut.ClientID %>").val('');
            $("#<%= txtDireccion.ClientID %>").val('');
            $("#<%= txtTelefono.ClientID %>").val('');
            $("#<%= txtCorreo.ClientID %>").val('');
            $("#<%= txtTotalConcesiones.ClientID %>").val('');
            $("#<%= txtTotalModulos.ClientID %>").val('');
        }

    </script>

</asp:Content>
