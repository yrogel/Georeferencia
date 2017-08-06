<%@ Page Title="Iniciar sesión" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FPGeoreferencia.Account.Login" %>

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
	<link rel="stylesheet" href="../Content/assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../Content/assets/css/style.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="../Content/assets/plugins/animate.css">
	<link rel="stylesheet" href="../Content/assets/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="../Content/assets/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="../Content/assets/css/pages/page_log_reg_v2.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="../Content/assets/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="../Content/assets/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="../Content/assets/css/custom.css">
    
     <style>
        .validation-error {
            color: #e80c4d;
            font-weight: bold;
        }
    </style>
</head>
   

<body>
	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>Login</h2>
			</div>
            
            <form runat="server">
                

			    <div class="input-group margin-bottom-5">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <asp:TextBox ID="txtLogin" class="form-control" placeholder="Usuario" runat="server"></asp:TextBox> 
			    </div>
                <div style="margin-bottom: 10px;">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLogin"
                                    CssClass="validation-error" ErrorMessage="El campo Usuario es obligatorio." />
                </div>

			    <div class="input-group margin-bottom-5">
				    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
			    </div>
                <div style="margin-bottom: 10px;">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                                    CssClass="validation-error" ErrorMessage="El campo Password es obligatorio." />
                </div>
                
                <asp:Label runat="server" CssClass="validation-error" ID="lblError"></asp:Label>

			    <hr>

			    <div class="row">
				    <div class="col-md-10 col-md-offset-1">
                        <asp:Button ID="btnLogin" class="btn-u btn-block" runat="server" OnClick="btnLogin_Click" Text="Ingresar"/> 
				    </div>
			    </div>
            </form>
		</div>
		<!--End Reg Block-->
	</div><!--/container-->
	<!--=== End Content Part ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="../Content/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="../Content/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="../Content/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../Content/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="../Content/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="../Content/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="../Content/assets/js/app.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
	<script type="text/javascript">
		$.backstretch([
			"../Content/assets/img/bg/3.jpg",
			"../Content/assets/img/bg/11.jpg",
			], {
				fade: 1000,
				duration: 7000
			});
	</script>
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->

</body>
</html>
