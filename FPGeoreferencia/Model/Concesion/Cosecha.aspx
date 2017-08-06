<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cosecha.aspx.cs" Inherits="FPGeoreferencia.Model.Concesion.Cosecha" %>
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
        .dxeButtonEdit {
            display: inline-table;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBreadcrumbs" runat="server">
    <div class="container">
		<ul class="pull-left breadcrumb">
			<li>Administración</li>
			<li>Concesiones</li>
            <li>Centro Cultivo</li>
            <li class="active">Cosecha</li>
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
    <asp:HiddenField ID="HidIdCosecha" runat="server" />
    
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
    <input type="button" id="btnNewCosecha" name="btnNewCosecha" class="btn rounded btn-success" value="Nuevo"/>
    <div style="height: 10px;"></div>
    
    <div style="overflow-x:scroll ; overflow-y: auto;">
    <dx:ASPxGridView ID="gridCosecha" ClientInstanceName="gridCosecha" runat="server" DataSourceID="SqlCosecha" 
         KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GrillasCustomCallback" EnableCallBacks="False">
        <Columns>
            
            <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0" Width="5px">
                <DataItemTemplate>
                    <img id='<%#"ContentImg"+Eval("Id")%>' style="cursor: pointer;" src="<%=ResolveUrl("~/Images/table_edit.png")%>"
                        alt="Editar" onclick='<%#"javascript:ShowPopUpEdit("+Eval("Id")+")" %>' />
                </DataItemTemplate>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
                
            <dx:GridViewCommandColumn VisibleIndex="1" ButtonType="Image" Caption="#" ShowDeleteButton="True" ShowEditButton="False" Width="60px">
                <DeleteButton Visible="True">
                    <Image Url="~/Images/table_Delete.png" />  
                </DeleteButton>
                <CancelButton Visible="True">
                    <Image Url="~/Images/cancelar.png" />
                </CancelButton>
                <UpdateButton Visible="True">
                    <Image Url="~/Images/correcto.png" />
                </UpdateButton>
            </dx:GridViewCommandColumn>
            
            <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="False" VisibleIndex="2">
                <HeaderStyle Font-Bold="True" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="linea" VisibleIndex="3" Caption="Línea">
                <HeaderStyle Font-Bold="True" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Id_Tipo_Cosecha" VisibleIndex="4" Caption="Tipo Cosecha">
                <HeaderStyle Font-Bold="True" />
                <PropertiesComboBox DataSourceID="SqlTipoCosecha" ValueType="System.Int32"  ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Id_Forma_Cosecha" VisibleIndex="5" Caption="Forma Cosecha">
                <HeaderStyle Font-Bold="True" />
                <PropertiesComboBox DataSourceID="SqlFormaCosecha" ValueType="System.Int32"  ValueField="Id" TextField="Nombre" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Kg_Sucio_Metro" VisibleIndex="6" Caption="Kg Sucio/Metro">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Kg_Sucio_Cuelga" VisibleIndex="7" Caption="Kg Sucio/Cuelga">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Kg_Limpio_Metro" VisibleIndex="8" Caption="Kg Limpio/Metro">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Kg_Limpio_Cuelga" VisibleIndex="9" Caption="Kg Limpio/Cuelga">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Factor_Condicion" VisibleIndex="10" Caption="Factor Condición">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Talla_Promedio" VisibleIndex="11" Caption="Talla Promedio">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Numero_Individuos_Kg" VisibleIndex="12" Caption="Número Individuos/Kg">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Numero_Individuos_Mt" VisibleIndex="13" Caption="Número Individuos/Mt">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="Fecha_Cosecha" VisibleIndex="14" Caption="Fecha Cosecha">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataColumn>
            
        </Columns>
        <SettingsText EmptyDataRow="No existen datos"></SettingsText>
        <SettingsText CommandEdit="Editar" CommandUpdate="Actualizar" ></SettingsText>
        <SettingsPager PageSize="20"  />
        <Settings ShowTitlePanel="true" />
        <SettingsText Title="Cosecha" />
        <Settings ShowFilterRow="True" ShowFooter="True" />
        <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                    
    </dx:ASPxGridView>
    </div>
    
    <dx:ASPxPopupControl ID="PopUpNewCosecha" runat="server" CloseAction="CloseButton" ShowCloseButton="False"
        PopupHorizontalAlign="WindowCenter" AllowDragging="True" PopupVerticalAlign="WindowCenter" ClientInstanceName="PopUpNewCosecha"
        HeaderText="Creación de Cosecha" Modal="True" PopupAnimationType="Fade" EnableViewState="True" Theme="DevEx" Width="600px">
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
                                    <td rowspan="17">
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
                                    <td rowspan="17">
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
                                        <label class="label-text">Tipo cosecha</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlTipoCosecha" name="ddlTipoCosecha" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Forma cosecha</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlFormaCosecha" name="ddlFormaCosecha" runat="server" class="input-text" required>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Kg sucio/metro</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtKgSucioMetro" ID="txtKgSucioMetro" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Kg sucio/cuelga</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtKgSucioCuelga" ID="txtKgSucioCuelga" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Kg limpio/metro</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtKgLimpioMetro" ID="txtKgLimpioMetro" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Kg limpio/cuelga</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtKgLimpioCuelga" ID="txtKgLimpioCuelga" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Factor condición</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtFactorCondicion" ID="txtFactorCondicion" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Talla promedio(mm)</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtTallaPromedio" ID="txtTallaPromedio" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                               <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Número individuos(mts)</label></td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNumeroIndividuoMts" ID="txtNumeroIndividuoMts" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Número individuos(kg)</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <input type="text" name="txtNumeroIndividuoKg" ID="txtNumeroIndividuoKg" runat="server" class="input-text" required/>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Fauna acompañante</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <select ID="ddlEspecie" name="ddlEspecie" runat="server" class="input-text" style="width: 120px" required>
                                        </select>
                                        &nbsp;
                                        <select ID="ddlUnidadMedida" name="ddlUnidadMedida" runat="server" class="input-text" style="width: 70px" required>
                                            <option value="0">Unidad</option>
                                            <option value="ind/kg">ind/kg</option>
                                            <option value="ind/mts">ind/mts</option>
                                        </select>
                                        <span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        <label class="label-text">Fecha cosecha</label>
                                    </td>
                                    <td class="pcmCellText">
                                        <dx:ASPxDateEdit CssClass="fecha" ID="txtFechaCosecha" ClientInstanceName="txtFechaCosecha" Theme="Metropolis" runat="server" EditFormatString="dd/MM/yyyy" Width="200px">
                                        </dx:ASPxDateEdit><span class="color-red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div class="pcmButton">
                                            <button class="btn-u" type="button" id="btnCancelar">Cancelar</button>
                                            <input type="button" id="btnGuardar" name="btnGuardar" class="btn-u" value="Guardar"/>
                                            <input type="button" id="btnActualizar" name="btnActualizar" class="btn-u" value="Actualizar" style="display: none"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pcmCellCaption" >
                                        &nbsp;
                                    </td>
                                    <td class="pcmCellText">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <asp:SqlDataSource ID="SqlCosecha" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
            SelectCommand="GetCosecha" SelectCommandType="StoredProcedure" DeleteCommand="DelCosecha" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HidIdCentroCultivo" Name="id_centro_cultivo" Type="Int32" />
            <asp:ControlParameter ControlID="ddLineasByModulo" Name="id_linea" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlTipoCosecha" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetTipoCosecha" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlFormaCosecha" runat="server" ConnectionString="<%$ ConnectionStrings:FPGeoreferencia%>" 
        SelectCommand="GetFormaCosecha" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
    <script>
        $("#btnNewCosecha").click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            $('#btnActualizar').css('display', 'none');
            $("#<%= HidIdCosecha.ClientID %>").val('0');
            ClearFormCosecha();
            PopUpNewCosecha.Show();
        });

        $('#btnCancelar').click(function () {
            PopUpNewCosecha.Hide();
            gridCosecha.PerformCallback("databind");
        });

        $('#btnBuscar').click(function () {
            gridCosecha.PerformCallback("databind");
        });

        $('#btnGuardar').click(function () {
            SaveOrUpdate();
        });

        $("#<%= ddlModulo.ClientID %>").change(function () {
            ChargeLineaByModulo(0);
        });

        function ChargeLineaByModulo(id) {
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var obj = { "modulo": modulo };

            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Concesion/Cosecha.aspx/ObtenerLineaByModulo")%>',
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
                        if (id != 0) {
                            $("#<%= ddlLinea.ClientID %>").val(id);
                            $("#<%= ddlLinea.ClientID %>").attr('disabled', 'disabled');
                        }
                    }
                },
                error: function (data) {
                    //alert(data.d);
                }
            });
        }

        function ShowPopUpEdit(id) {
            var obj = { "id": id };
            $("#<%= HidIdCosecha.ClientID %>").val(id);
            $.ajax({
                type: "POST",
                url: '<%= Page.ResolveUrl("~/Model/Concesion/Cosecha.aspx/ObtenerCosecha")%>',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessEdit,
                error: OnErrorEdit
            });
        }

        function OnSuccessEdit(data) {
            //console.log(data.d);

            var cosecha = JSON.parse(data.d);
            //alert(muestreo["IdLinea"]);

            $("#<%= ddlModulo.ClientID %>").val(cosecha["IdModulo"]);
            $("#<%= ddlModulo.ClientID %>").attr('disabled', 'disabled');
            $("#<%= ddlTipoCosecha.ClientID %>").val(cosecha["IdTipoCosecha"]);
            $("#<%= ddlFormaCosecha.ClientID %>").val(cosecha["IdFormaCosecha"]);
            $("#<%= txtKgSucioMetro.ClientID %>").val(cosecha["KgSucioMetro"]);
            $("#<%= txtKgSucioCuelga.ClientID %>").val(cosecha["KgSucioCuelga"]);
            $("#<%= txtKgLimpioMetro.ClientID %>").val(cosecha["KgLimpioMetro"]);
            $("#<%= txtKgLimpioCuelga.ClientID %>").val(cosecha["KgLimpioCuelga"]);
            $("#<%= txtFactorCondicion.ClientID %>").val(cosecha["FactorCondicion"]);
            $("#<%= txtTallaPromedio.ClientID %>").val(cosecha["TallaPromedio"]);
            $("#<%= txtNumeroIndividuoKg.ClientID %>").val(cosecha["NumeroIndividuosKg"]);
            $("#<%= txtNumeroIndividuoMts.ClientID %>").val(cosecha["NumeroIndividuosMt"]);
            txtFechaCosecha.SetText(cosecha["FechaCosecha"]);
            $("#<%= ddlEspecie.ClientID %>").val(cosecha["IdEspecie"]);
            $("#<%= ddlUnidadMedida.ClientID %>").val(cosecha["UnidadMedida"]);
            ChargeLineaByModulo(cosecha["IdLinea"]);
            $('#btnGuardar').css('display', 'none');
            $('#btnActualizar').css('display', 'inline-block');
            PopUpNewCosecha.Show();
        }

        function OnErrorEdit(data) {
            //alert('error');
            //alert(data.d);
            //console.log(data);
        }

        $('#btnActualizar').click(function () {
            SaveOrUpdate();
        });

        function SaveOrUpdate() {
            var modulo = $("#<%= ddlModulo.ClientID %>").val();
            var linea = $("#<%= ddlLinea.ClientID %>").val();
            var tipoCosecha = $("#<%= ddlTipoCosecha.ClientID %>").val();
            var formaCosecha = $("#<%= ddlFormaCosecha.ClientID %>").val();
            var kgSucioMetro = $("#<%= txtKgSucioMetro.ClientID %>").val();
            var kgSucioCuelga = $("#<%= txtKgSucioCuelga.ClientID %>").val();
            var kgLimpioMetro = $("#<%= txtKgLimpioMetro.ClientID %>").val();
            var kgLimpioCuelga = $("#<%= txtKgLimpioCuelga.ClientID %>").val();
            var factorCondicion = $("#<%= txtFactorCondicion.ClientID %>").val();
            var tallaPromedio = $("#<%= txtTallaPromedio.ClientID %>").val();
            var numeroIndividuoKg = $("#<%= txtNumeroIndividuoKg.ClientID %>").val();
            var numeroIndividuoMts = $("#<%= txtNumeroIndividuoMts.ClientID %>").val();
            var fecha = txtFechaCosecha.GetText();
            var especie = $("#<%= ddlEspecie.ClientID %>").val();
            var unidadMedida = $("#<%= ddlUnidadMedida.ClientID %>").val();
            var idCosecha = $("#<%= HidIdCosecha.ClientID %>").val();
            //var fecha = txtFechaSiembra.GetDate();
            //alert(fecha);

            if (modulo == 0 || linea == 0 || tipoCosecha == 0 || formaCosecha == 0 || kgSucioMetro == "" || kgSucioCuelga == "" || kgLimpioMetro == "" || kgLimpioCuelga == "" || numeroIndividuoMts == "" || numeroIndividuoKg == "" || tallaPromedio == "" || factorCondicion == "" || especie == "0" || fecha == "" || unidadMedida == "0") {
                $("#<%= lblError.ClientID %>").text("Debe completar todos los campos para continuar.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {
                var obj = { "modulo": modulo, "linea": linea, "tipoCosecha": tipoCosecha, "formaCosecha": formaCosecha, "kgSucioMetro": kgSucioMetro, "kgSucioCuelga": kgSucioCuelga, "kgLimpioMetro": kgLimpioMetro, "kgLimpioCuelga": kgLimpioCuelga, "numeroIndividuoMts": numeroIndividuoMts, "numeroIndividuoKg": numeroIndividuoKg, "tallaPromedio": tallaPromedio, "factorCondicion": factorCondicion, "especie": especie, "fecha": fecha, "unidadMedida": unidadMedida, "idCosecha": idCosecha };

                $.ajax({
                    type: "POST",
                    url: '<%= Page.ResolveUrl("~/Model/Concesion/Cosecha.aspx/SaveOrUpdateCosecha")%>',
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    error: OnError
                });
            }
        }

        function OnSuccess(msg) {
            //alert(msg.d);
            //console.log(msg.d);
            var idCosecha = $("#<%= HidIdCosecha.ClientID %>").val();
            if (msg.d == 0) {
                $("#<%= lblError.ClientID %>").text("Se ingreso correctamente los datos.");
                $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").addClass("alert alert-success fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
                $("#<%= mensaje.ClientID %>").fadeOut(5000);
                if (idCosecha == 0)
                    ClearFormCosecha();
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

        function ClearFormCosecha() {
            $("#<%= ddlModulo.ClientID %>").val('0');
            $("#<%= ddlLinea.ClientID %>").val('0');
            $("#<%= ddlTipoCosecha.ClientID %>").val('0');
            $("#<%= ddlFormaCosecha.ClientID %>").val('0');
            $("#<%= txtKgSucioMetro.ClientID %>").val('');
            $("#<%= txtKgSucioCuelga.ClientID %>").val('');
            $("#<%= txtKgLimpioMetro.ClientID %>").val('');
            $("#<%= txtKgLimpioCuelga.ClientID %>").val('');
            $("#<%= txtFactorCondicion.ClientID %>").val('');
            $("#<%= txtTallaPromedio.ClientID %>").val('');
            $("#<%= txtNumeroIndividuoKg.ClientID %>").val('');
            $("#<%= txtNumeroIndividuoMts.ClientID %>").val('');
            txtFechaCosecha.GetInputElement().value = "";
            $("#<%= ddlEspecie.ClientID %>").val('0');
            $("#<%= ddlUnidadMedida.ClientID %>").val('0');
        }
        
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                <%--alert($("#<%= HidIdCentroCultivo.ClientID %>").val());--%>
                window.location.href = '<%=ResolveUrl("~/Concesion/Detalle/")%>' + $("#<%= HidIdCentroCultivo.ClientID %>").val();
            });
        });
    </script>

</asp:Content>
