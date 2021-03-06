
<%@page import="Beans.Commande"%>
<%@page import="Model.CommandeDAO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="Beans.Categorie"%>
<%@page import="Model.CategorieDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="Beans.Produit"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Beans.Client"%>
<%@page import="java.util.Vector"%>
<%@page import="Model.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title>Espace client</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
        <script src="js/jquery.jcarousel.js" type="text/javascript"></script>
        <script src="js/DD_belatedPNG-min.js" type="text/javascript"></script>
        <script src="js/functions.js" type="text/javascript"></script>

    </head>
    <body>
        <%
            HttpSession ses = request.getSession();
            Map<Produit, Integer> panier = null;
            if (ses.getAttribute("panier") == null) {
                panier = new HashMap<Produit, Integer>();
                ses.setAttribute("panier", panier);
            } else {
                panier = (HashMap<Produit, Integer>) ses.getAttribute("panier");
            }

            CategorieDAO cd = null;
            Vector<Categorie> vc = new Vector<Categorie>();
            try {
                cd = new CategorieDAO();
            } catch (SQLException ex) {
            } catch (ClassNotFoundException ex) {
            }
            vc = (Vector<Categorie>) cd.getAllCategories();
            int total = 0;

            for (Entry<Produit, Integer> entry : panier.entrySet()) {
                Produit p = entry.getKey();
                int qte = entry.getValue();
                if (qte > 0) {
                    total = total + (p.getPrix() * qte);
                } else {
                    total = total + p.getPrix();
                }
            }



        %>
        <div class="shell">		
        		<div id="top-navigation">
                    
	<% String login = (String)session.getAttribute("login");
        if(login !=null){         %> 
        
		 	<a title="Se deconnecter" href="deconnexion">DECONNEXION</a><a title="Mon Espace Client" href="espace_client.jsp">MON ESPACE CLIENT</a><a class="cart" title="Panier" href="consulter_panier.jsp">Panier</a><a></a><span><%= panier.size()  %> Article(s)</span><span class="sep">|</span><span><%= total %> DH</span>
		</div>
                <div class="welcome-message">
<p> Bonjour, <%= login %> </p></div> 
<% }else { %> 
<a title="Se connecter" href="connexion.jsp">CONNEXION</a><a title="s'inscrire" href="inscription.jsp">INSCRIPTION</a><a class="cart" title="Panier" href="consulter_panier.jsp">Panier</a><a></a><span><%= panier.size()  %> Article(s)</span><span class="sep">|</span><span><%= total %> DH</span>
		</div>
<% }%>
            <div class="cl"></div>
            <div id="wrapper-top"></div>
            <!-- Wrapper Middle -->
            <div id="wrapper-middle">
                <!-- Header -->
                <div id="header">
                    <h1 id="logo"><a title="home" href="#">Furniture Store</a></h1>							
                </div>
                <!-- END Header -->
                <!-- Navigation -->
                <div id="navigation">
                    <ul>
                        <li class="first"><a title="Home" href="index.jsp">Accueil<span class="home">&nbsp;</span></a></li>
                        <li><a title="A Propos" href="#">A Propos</a></li>
                        <li><a title="Contactez-Nous" href="#">Contactez-Nous</a></li>
                    </ul>
                    <div class="cl"></div>
                </div>
                <!-- END Navigation -->
                <!-- Main -->
                <div id="main">

                    <!-- Sidebar -->
                    <div id="sidebar">
                        <div class="box">
                            <div class="title">
                                <h2>Categories</h2>
                                <img class="bullet" src="css/images/bullet.png" alt="small grey bullet" />
                            </div>
                            <ul>
                                <% for (int i = 0; i < vc.size(); i++) {%>

                                <li><a title="categorie" href="categorie_produits.jsp?<%= vc.get(i).getIdCategorie()%>"><%= vc.get(i).getLibCategorie()%></a></li>
                                <% }%>							
                            </ul>
                        </div>
                    	
                    </div>
                    <!-- END Sidebar -->
                    <!-- Content -->
                    <div id="content">

                        <div class="title">
                            <h2>Espace Client</h2>
                            <img class="bullet" src="css/images/bullet.png" alt="small grey bullet" />
                        </div>
                        <h2>Vos informations personnelles</h2>
                 				<table class="data">
			<tr class="data">
				<th class="data">Login</th> 
                                <th class="data">Nom</th> 
                                <th class="data">Prenom</th> 
                                <th class="data">Email</th> 
                                <th class="data">Date Inscription</th> 
                                <th class="data">Mot de Passe</th> 
                                  <th class="data">Sexe</th> 
                                <th class="data">Date Naissance</th> 
                                <th class="data">Adresse</th> 
			</tr>
	
		        <%     
                        ClientDAO cdao=null;
                        Client cl=new Client();
               try {
            cdao = new ClientDAO();
                 } 
               catch (SQLException ex) {} 
           catch (ClassNotFoundException ex) {}
                        cl=cdao.getClient(login); 
                       
 
 %>
                                 
			<tr class="data">
				<td class="data"><center><%= cl.getLogin() %></center></td> 
                                <td class="data"><center><%= cl.getNomClient() %></center></td> 
                                <td class="data"><center><%= cl.getPrenomClient() %></center></td> 
                                <td class="data"><center><%= cl.getEmailClient() %></center></td> 
                                <td class="data"><center><%= cl.getDateInscription() %></center></td> 
                                <td class="data"><center><%= cl.getMotdepasse() %></center></td> 
                                <td class="data"><center><%= cl.getSexe() %></center></td> 
                                <td class="data"><center><%= cl.getDateNaissance() %></center></td>
                                <td class="data"><center><%= cl.getAdresse() %></center></td> 

			</tr>
                              
		</table>
                                <h2>Vos commandes</h2>
                                <table class="data">
			<tr class="data">
			<th class="data">Date</th>
				<th class="data">Prix Total </th>
                                <th class="data">Etat Commande </th>
			</tr>
	    <%     
                        CommandeDAO cmdd=null;
                        Vector<Commande> vcmd=new Vector<Commande>();
               try {
            cmdd = new CommandeDAO();
                 } 
               catch (SQLException ex) {}
           catch (ClassNotFoundException ex) {}
                        vcmd=(Vector<Commande>)cmdd.getCommandesByClient(login); 
                       
 
 %>
                                  <% for(int i=0;i<vcmd.size();i++)
                                                       { %>
		
			<tr class="data">
                            <td class="data"><center><%= vcmd.get(i).getDateCmd() %> </center></td> 
				<td class="data"><center><%= vcmd.get(i).getFacture().getPrixTotal() %></center></td> 
                                <td class="data"><center><%= vcmd.get(i).getEtatCmd() %> </center></td>
				
			</tr>
                                                       <% } %>
			
			
			
		
			
			
		</table>
                                                       <h2><a href="cloturer_compte" >Cloturer Mon Compte</a></h2>
                    </div>
                    <!-- END Content -->
                    <div class="cl"></div>
                </div>
                <!-- END Main -->
            </div>
            <!-- END Wrapper Middle -->
            <div id="wrapper-bottom"></div>	
            <!-- Footer  -->
            <div id="footer">
			<span class="author">ENSIAS, projet Java EE, fait par : Ismail Chaar - Mahmoud Lamrani, encadre par : Pr.MAHMOUD EL HAMLAOUI</span>
		</div>
            <!-- END Footer -->
        </div>
    </body>
</html>
