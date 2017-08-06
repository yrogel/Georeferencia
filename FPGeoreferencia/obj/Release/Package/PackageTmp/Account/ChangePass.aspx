<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="FPGeoreferencia.Account.ChangePass" %>

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
    <!-- CSS Customization -->
	<link rel="stylesheet" href="../Content/assets/css/custom.css">
	<link rel="stylesheet" href="../Content/assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../Content/assets/css/style.css">

	<link rel="stylesheet" href="../Content/assets/plugins/animate.css">
	<link rel="stylesheet" href="../Content/assets/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="../Content/assets/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="../Content/assets/css/pages/page_log_reg_v1.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="../Content/assets/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="../Content/assets/css/theme-skins/dark.css">
    
    <style>
        .validation-error {
            color: #e80c4d;
            font-weight: bold;
        }
    </style>
 
</head>

<body>
    <div class="container content">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<form class="reg-page" runat="server">
						<div class="reg-header">
							<h2>Cambio de Clave</h2>
						</div>

                        <div class="input-group margin-bottom-20">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <asp:TextBox ID="txtLogin" class="form-control" ReadOnly="True" runat="server"></asp:TextBox> 
			            </div>

						<div class="input-group margin-bottom-5">
				            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Clave Actual" runat="server" TextMode="Password"></asp:TextBox>
			            </div>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                                    CssClass="validation-error" ErrorMessage="El campo de clave actual es obligatorio." />
                        
                
                        <div class="input-group margin-bottom-5">
				            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <asp:TextBox ID="txtPasswordNueva" CssClass="form-control" placeholder="Clave Nueva" runat="server" TextMode="Password"></asp:TextBox>
			            </div>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswordNueva" CssClass="validation-error"
                                     ErrorMessage="El campo de clave nueva es obligatorio." />
                
                        <div class="input-group margin-bottom-5">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <asp:TextBox ID="txtCorreo" CssClass="form-control" placeholder="E-Mail" runat="server"></asp:TextBox>
			            </div>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCorreo"
                                    CssClass="validation-error" ErrorMessage="El campo de dirección de correo es obligatorio." />
                        
                        <asp:RegularExpressionValidator ID="validateEmail" runat="server" CssClass="validation-error" ErrorMessage="Correo inválido." ControlToValidate="txtCorreo" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                        
                        <asp:Label runat="server" CssClass="validation-error" ID="lblError"></asp:Label>

			            <hr>
                        
                        <div class="row">
				            <div class="col-md-10 col-md-offset-1">
                                <asp:Button ID="btnCambioClave" class="btn-u btn-block" runat="server" OnClick="btnCambioClave_Click" Text="Aceptar"/> 
				            </div>
			            </div>
					</form>
				</div>
			</div>
		</div>

</body>
</html>
