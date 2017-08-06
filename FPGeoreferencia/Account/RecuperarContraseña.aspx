<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="FPGeoreferencia.Account.RecuperarContraseña" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<title>Fishing Partners</title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Web Fonts -->
	<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>
    
    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/plugins/bootstrap/css/bootstrap.min.css")%>" >
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/css/style.css")%>">
        
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/plugins/animate.css")%>">
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/plugins/line-icons/line-icons.css")%>">
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/plugins/font-awesome/css/font-awesome.min.css")%>">
		
	<!-- CSS Page Style -->
	<link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/css/pages/page_log_reg_v1.css")%>">
        
    <!-- CSS Theme -->
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/css/theme-colors/default.css")%>">
    <link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/css/theme-skins/dark.css")%>">
		
	<!-- CSS Customization -->
	<link rel="stylesheet" href="<%: ResolveUrl("~/Content/assets/css/custom.css")%>">
    
     <script src="<%: ResolveUrl("~/Scripts/modernizr-2.6.2.js") %>"></script>
     <script src="<%: ResolveUrl("~/Scripts/jquery-1.8.2.js") %>"></script>
     <script src="<%: ResolveUrl("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    
</head>

<body>
    <div class="container content">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<form class="reg-page" runat="server">
						<div class="reg-header">
							<h2>Recuperar contraseña</h2>
						</div>
                        
                        <div class="tag-box tag-box-v2 margin-bottom-40">
						    <p>Ingrese su dirección de correo para hacerle llegar su nueva contraseña</p>
					    </div>
                        
                        <div runat="server" id="mensaje">
                            <strong><asp:Label runat="server" ID="lblError" /></strong>
				        </div>

                        <div class="input-group margin-bottom-5">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="text" name="txtCorreo" ID="txtCorreo" runat="server" class="form-control" placeholder="correo" required/>
			            </div>

                        <div class="row" style="padding-top: 15px;">
				            <div class="col-md-10 col-md-offset-1">
                                <input type="button" id="btnCambioClave" name="btnCambioClave" class="btn-u btn-block" value="Enviar"/>
				            </div>
			            </div>

                        <hr>
				        <p>Para iniciar sesión, <a class="color-green" href='<%=ResolveUrl("~/Login") %>'>haga clic aquí</a></p>
			    
					</form>
				</div>
			</div>
		</div>
    
    <script>
        
        $('#btnCambioClave').click(function () {
            $("#<%= mensaje.ClientID %>").css('display', 'none');
            var correo = $("#<%= txtCorreo.ClientID %>").val();

            if (correo == "") {
                $("#<%= lblError.ClientID %>").text("Debe ingresar correo.");
                $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
            } else {

                if (validateEmail(correo)) {
                    var obj = { "correo": correo };
                    
                    $("#<%= lblError.ClientID %>").text("Espere un momento...");
                    $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").removeClass("alert alert-success fade in").addClass("alert alert-info fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');

                    $.ajax({
                        type: "POST",
                        url: '<%= Page.ResolveUrl("~/Account/RecuperarContraseña.aspx/RecuperarClave")%>',
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        error: OnError
                    });
                } else {
                    $("#<%= lblError.ClientID %>").text("Ingrese correo válido.");
                    $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');
                }
            }
        });

        function OnSuccess(msg) {
            //alert(msg.d);
            if (msg.d == 0) {
                $("#<%= lblError.ClientID %>").text("Se envío correctamente el correo.");
                $("#<%= mensaje.ClientID %>").removeClass("alert alert-danger fade in").removeClass("alert alert-info fade in").addClass("alert alert-success fade in");
                $("#<%= mensaje.ClientID %>").css('display', 'block');
                $("#<%= mensaje.ClientID %>").fadeOut(5000);
                $("#<%= txtCorreo.ClientID %>").val('');
            } else {
                if (msg.d == 1) {
                    $("#<%= lblError.ClientID %>").text("El correo ingresado no existe en la plataforma.");
                    $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');
                } else {
                    $("#<%= lblError.ClientID %>").text("Error al enviar el correo, intente más tarde.");
                    $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
                    $("#<%= mensaje.ClientID %>").css('display', 'block');
                }
            }
        }

        function OnError(msg) {
            //alert('Error: ' + msg.responseText);
            $("#<%= lblError.ClientID %>").text("Error al enviar el correo, intente más tarde.");
            $("#<%= mensaje.ClientID %>").addClass("alert alert-danger fade in");
            $("#<%= mensaje.ClientID %>").css('display', 'block');
        }

        function validateEmail($email) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            return emailReg.test($email);
        }

    </script>
</body>
</html>
