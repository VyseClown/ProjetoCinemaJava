<%-- 
    Document   : single
    Created on : 11/04/2018, 13:54:37
    Author     : VyseClown
--%>
<%@page import="DAO.SessaoDAO"%>
<%@page import="Bean.Sessoes"%>
<%@page import="Bean.Filmes"%>
<%@page import="DAO.FilmesDAO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="Bean.Usuarios"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>One Movies an Entertainment Category Flat Bootstrap Responsive Website Template | Single :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/styleTICKET.css" rel="stylesheet" type="text/css" media="all" />
   <!-- <link href="css/styleTICKET.css" rel="stylesheet" type="text/css" media="all" />-->
<link href="css/medile.css" rel='stylesheet' type='text/css' />
<link href="css/single.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/faqstyle.css" type="text/css" media="all" />
    <link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!--<script src="js/jquery-1.11.0.min.js"></script>-->
    <script src="js/jquery.seat-charts.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
<!-- news-css -->
<link rel="stylesheet" href="news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
		  items : 5,
		  itemsDesktop : [640,5],
		  itemsDesktopSmall : [414,4]
	 
		});
	 
	}); 
</script> 
<script src="js/simplePlayer.js"></script>
<script>
	$("document").ready(function() {
		$("#video").simplePlayer();
	});
</script>
<%
    String idFilme = request.getParameter("id");
    Filmes fil = new Filmes();
    List<Sessoes> ses;
    if(idFilme == null)
    {
        response.sendRedirect("index.jsp?msg=Filme não encontrado");
    }
    else
    {
        fil = (new FilmesDAO()).selecionarFilme(Integer.parseInt(idFilme));
        ses = (new SessaoDAO().selecionar(Integer.parseInt(idFilme)));
    }
%>
<%
    String msg="";
    if(request.getParameter("msg")!=null)
        msg = request.getParameter("msg");
    int codigo=0;
    String usuario="", senha="";
    if(session.getAttribute("codigo")!=null){
             //existe a sessão do codigo
             codigo =(int)
                     session.getAttribute("codigo");
             Usuarios usu = (new UsuariosDAO()
                     ).selecionar(codigo);
             if(usu!=null){
                 usuario = usu.getUsuario();
                 senha = usu.getSenha();
             }
         }
    else
        response.sendRedirect("index.jsp?msg=Se logue primeiro !");
   
    
%>
</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="index.jsp"><h1>One<span>Movies</span></h1></a>
			</div>
			<div class="w3_search">
				<form action="#" method="post">
					<input type="text" name="Search" placeholder="Search" required="">
					<input type="submit" value="Go">
				</form>
			</div>
						<div class="w3l_sign_in_register">
				<ul>
					<li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 123 345 653</li><br/>
                                        <form action="srvUsuario" method="post">
                                        <%if(session.getAttribute("codigo")!=null){
                                        %>
                                        <span class="text-info">Bem vindo <%=usuario%> !</span>
                                        <br/>
                                        <button action="srvUsuario" class="btn btn-danger" type="submit" name="btnsair">Sair</button>
                                        <%
                                            }
                                            else{
                                        %>
                                        <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
                                        <%
                                            }
                                        %>
					</form>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- bootstrap-pop-up -->
<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Logue-se ou se cadastre !
                                        <span class="text-info"><%=usuario%></span>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
                                                            
							  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
								<div class="tooltip">Clique aqui !</div>
							  </div>
							  <div class="form">
								<h3>Logue em sua conta</h3>
								<form action="srvUsuario" method="post">
                                                                    <input type="hidden" id="txtcodigo"
                                                                    name="txtcodigo" value="<%=codigo%>"/>
								  <input type="text" name="txtusuario" placeholder="Usuario" required="" id="txtusuario">
								  <input type="password" name="txtsenha" placeholder="Senha" required="" id="txtsenha">
								  <input type="submit" value="Login" name="btnacessar">
								</form>
							  </div>
							  <div class="form">
								<h3>Crie uma conta</h3>
								<form action="srvUsuario" method="post">
                                                                    <input type="hidden" id="txtcodigo"
                                                                    name="txtcodigo" value="<%=codigo%>"/>
								  <input type="text" name="txtusuario" placeholder="Usuario" required="" id="txtusuario">
								  <input type="password" name="txtsenha" placeholder="Senha" required=""id="txtsenha">
                                                                  <input type="text" name="txtnome" placeholder="Nome" required="" id="txtnome">
                                                                  <input type="text" name="txtcpf" placeholder="CPF" required="" id="txtcpf">
								  <input type="submit" value="Cadastrar" name="btnsalvar">
								</form>
							  </div>
							  <div class="cta"><a href="#">Esqueceu sua senha?</a></div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		$('.toggle').click(function(){
		  // Switches the Icon
		  $(this).children('i').toggleClass('fa-pencil');
		  // Switches the forms  
		  $('.form').animate({
			height: "toggle",
			'padding-top': 'toggle',
			'padding-bottom': 'toggle',
			opacity: "toggle"
		  }, "slow");
		});
	</script>
<!-- //bootstrap-pop-up -->
<!-- nav -->
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="w3_home_act"><a href="index.jsp">Home</a></li>
							
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
<!-- //nav -->
<div class="general_social_icons">
	<nav class="social">
		<ul>
			<li class="w3_twitter"><a href="#">Twitter <i class="fa fa-twitter"></i></a></li>
			<li class="w3_facebook"><a href="#">Facebook <i class="fa fa-facebook"></i></a></li>
			<li class="w3_dribbble"><a href="#">Dribbble <i class="fa fa-dribbble"></i></a></li>
			<li class="w3_g_plus"><a href="#">Google+ <i class="fa fa-google-plus"></i></a></li>				  
		</ul>
  </nav>
</div>
<!-- single -->
<div class="single-page-agile-main">
<div class="container">
		<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="index.jsp">Home</a></li>
				  <li class="active">Single</li>
				</ol>
			</div>
			<div class="single-page-agile-info">
                   <!-- /movie-browse-agile -->
                           <div class="show-top-grids-w3lagile">
				<div class="col-sm-12">
					<div class="song">
						<div class="song-info">
							<h3><%=fil.getNome()%></h3>	
					</div>
						<div class="video-grid-single-page-agileits">
                                                    <img src="images/<%=fil.getImg()%>" alt="" class="img-responsive">
						</div>
					</div>
                                                <div class="container-fluid center-block col-md-12">
                                                    <div class="row">
                                                        <div class="col-lg-2">Faixa etaria:<br/><span class="glyphicon glyphicon-user"><%=fil.getFaixaetaria()%> anos</div>
                                                        <div class="col-lg-8"><%=fil.getDescricao()%></div>
                                                        <div class="col-lg-2 fas fa-stopwatch" maxlength="168">Duração: <br/><span class="glyphicon glyphicon-film"></span><%=fil.getDuracao()%></div>
                                                    </div>
                                                    
                                                    <br/>
                                                    <div class="col-md-6">
                        <div id="DiasDisponiveis" class="tab-pane fade in active container-fluid center-block" >
                            <%  for (Sessoes elem : new SessaoDAO().selecionar(fil.getId())) {
                            %>
                            <div class="item  col-xs-4 col-lg-4">
                                <div class="thumbnail">
                                    <h2>Sessão das : </h2>
                                    <div class="caption">

                                        <h3 class="group inner list-group-item-text fas fa-stopwatch" maxlength="168"> <%=elem.getHorarioInicio()%></h3>
                                        <h3 class="group inner list-group-item-heading fas fa-calendar-alt"> <%=elem.getData()%></h3>
                                        <h3 class="group inner list-group-item-test">Lugares:<%=elem.getQtdLugares()%></h3>
                                        <form action="srvFilme" method="post">
                                        <div class="row">
                                            <div class="col-xs-12 col-md-12">
                                                <input type="hidden" id="txtcodigoSessao" name="txtcodigoSessao" value="<%=elem.getId()%>"/>
                                                <input type="hidden" id="txtcodigo"
                                                                    name="txtcodigo" value="<%=codigo%>"/>
                                                <div class="form-group">
                                                    <script type="text/javascript">
                                                        function ValidateCreditCardNumber() {

  var ccNum = document.getElementById("cardNum").value;
  var visaRegEx = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
  var mastercardRegEx = /^(?:5[1-5][0-9]{14})$/;
  var amexpRegEx = /^(?:3[47][0-9]{13})$/;
  var discovRegEx = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/;
  var isValid = false;

  if (visaRegEx.test(ccNum)) {
    isValid = true;
  } else if(mastercardRegEx.test(ccNum)) {
    isValid = true;
  } else if(amexpRegEx.test(ccNum)) {
    isValid = true;
  } else if(discovRegEx.test(ccNum)) {
    isValid = true;
  }

  if(isValid) {
     alert("Obrigado pela compra!");
  } else {
     alert("Por favor digite um numero valido!");
  }
}
                                                    </script>
                                                <label for="usr">Quantidade</label>
                                                <input type="number" class="form-control" id="qtd" name="qtd">
                                                <label for="usr">Numero do cartão:</label>
                                                <input type="text" class="form-control" id="cardNum" onblur="ValidateCreditCardNumber()">
                                                <label for="usr">Nome:</label>
                                                <input type="text" class="form-control" id="usr">
<div class="selects-date selecters">
          <div class="day-select"><span>Dia</span>
            <select id="dates">
              <option value="">1</option>
              <option value="">2</option>
              <option value="">3</option>
              <option value="">4</option>
              <option value="">5</option>
              <option value="">6</option>
              <option value="">7</option>
              <option value="">8</option>
              <option value="">9</option>
              <option value="">10</option>
              <option value="">11</option>
              <option value="">12</option>
              <option value="">13</option>
              <option value="">14</option>
              <option value="">15</option>
              <option value="">16</option>
              <option value="">17</option>
              <option value="">18</option>
              <option value="">19</option>
              <option value="">20</option>
              <option value="">21</option>
              <option value="">22</option>
              <option value="">23</option>
              <option value="">24</option>
              <option value="">25</option>
              <option value="">26</option>
              <option value="">27</option>
              <option value="">28</option>
              <option value="">29</option>
              <option value="">30</option>
            </select>
          </div>
          <div class="year-select"><span>Ano</span>
            <select id="dates">
              <option value="">18</option>
              <option value="">19</option>
              <option value="">20</option>
              <option value="">21</option>
              <option value="">22</option>
              <option value="">23</option>
              <option value="">24</option>
              <option value="">25</option>
              <option value="">26</option>
            </select>
          </div>
        </div>
                                                <label for="usr">Codigo de segurança:</label>
                                                <input type="text" class="form-control" id="usr">
                                                </div>
                                                <input class="btn btn-success col-lg-12" type="submit" value="Comprar" name="btnComprar">
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <%
                                }
                            %>

                        </div>
                    </div>
                                    
					<div class="clearfix"> </div>
				</div>				

                            
                            
                            
                            
                            
				
				<div class="clearfix"> </div>
			</div>
				<!-- //movie-browse-agile -->
				<!--body wrapper start-->
			
		<!--body wrapper end-->
						
							 
				</div>
				<!-- //w3l-latest-movies-grids -->
			</div>	
		</div>
	<!-- //w3l-medile-movies-grids -->
	
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3ls_footer_grid">
				<div class="col-md-6 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_left1">
						<h2>Subscribe to us</h2>
						<div class="w3ls_footer_grid_left1_pos">
							<form action="#" method="post">
								<input type="email" name="email" placeholder="Your email..." required="">
								<input type="submit" value="Send">
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6 w3ls_footer_grid_right">
					<a href="index.jsp"><h2>One<span>Movies</span></h2></a>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-5 w3ls_footer_grid1_left">
				<p>&copy; 2016 One Movies. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
			<div class="col-md-7 w3ls_footer_grid1_right">
				<ul>
					<li>
						<a href="genres.html">Movies</a>
					</li>
					<li>
						<a href="faq.html">FAQ</a>
					</li>
					<li>
						<a href="horror.html">Action</a>
					</li>
					<li>
						<a href="genres.html">Adventure</a>
					</li>
					<li>
						<a href="comedy.html">Comedy</a>
					</li>
					<li>
						<a href="icons.html">Icons</a>
					</li>
					<li>
						<a href="contact.html">Contact Us</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- //Bootstrap Core JavaScript -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>
