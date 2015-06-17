<%--
  Created by IntelliJ IDEA.
  User: alessio
  Date: 19/05/15
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
  <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">
</head>

<t:general>

  <jsp:attribute name="title">Catalogo Prodotti</jsp:attribute>
  <jsp:attribute name="yield">
    <form:form id="form-data" method="post" action="/admin/product" modelAttribute="user">
    <head>
            <sec:authorize access="isAuthenticated()">
                <div class="row">
                  <div class="box">
                    <div class="col-lg-12 text-center">
                      <strong><b> Complimenti,hai effettuato l'accesso!, ora puoi navigare nel nostro caffe'!</b></strong>
                      <p> Entra ora nella sezione prodotti per acquistare!</p>
                    </div>
                  </div>
                </div>
              </sec:authorize>
    </head>
      <body>
      <div  class="container">

        <div class="row">
          <div class="box">
            <div class="col-lg-12 text-center">
              <div id="carousel-example-generic" class="carousel slide">
                <!-- Indicators -->
                <ol class="carousel-indicators hidden-xs">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div id="1" class="carousel-inner">
                  <div class="item active">
                    <img class="img-responsive img-full" src="../../bootstrap/img/slide-1.jpg" alt="">
                  </div>
                  <div class="item">
                    <img class="img-responsive img-full" src="../../bootstrap/img/slide-2.jpg" alt="">
                  </div>
                  <div class="item">
                    <img class="img-responsive img-full" src="../../bootstrap/img/slide-3.jpg" alt="">
                  </div>


                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="icon-next"></span>
                </a>
              </div>
              <h2 class="brand-before">
                <small>Welcome to</small>
              </h2>
              <h1 class="brand-name">Haja</h1>
              <hr class="tagline-divider">
              <h2>
                <small>By
                  <strong>Alessio&Simone </strong>
                  <I><small>(al loro primo Bootstrap)</small></I>
                </small>
              </h2>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="box">
            <div class="col-lg-12">
              <hr>
              <h2 class="intro-text text-center"><small>Hai sonno? Vuoi restare sveglio tutta la notte? Sei un professore amante del caffe'?</small>
                <strong>Prenditi un caffe' con noi!</strong>
              </h2>
              <hr>
              <img class="img-responsive img-border img-left" src="../../bootstrap/img/intro-pic.jpg" alt="">
              <hr class="visible-xs">
              <p>Haja e' il piu' grande e il primo venditore di ogni tipo di caffe',Fornitori da tutto il mondo(<I>vedi sez."Fornitori"</I>),prodotti fantastici,manufatturieri, e delle piu' grandi case produttrici di caffe'!
                Registrati al nostro sito, e potrai accedere alle meravigliose arome che ti offriamo,ti accetteremo anche se ami piu' del caffe' la camomilla FiorFiore..BUONA NAVIGAZIONE!

            </div>
          </div>
        </div>

        <div id= class="container">

        <div class="row">
          <div class="box">
            <div class="col-lg-12">
              <hr>
              <h2 class="intro-text text-center">Chi siamo

              </h2>
              <hr>
            </div>
            <div class="col-md-8">
              <!-- Embedded Google Map using an iframe - to select your location find it on Google maps and paste the link as the iframe src. If you want to use the Google Maps API instead then have at it! -->
              <img src="http://informatica.ing.uniroma3.it/wp-content/uploads/2012/09/esterni.jpg">
              <p><I>Avremmo speso con gioia il nostro tempo a parlarti di noi,ma il caffe' sta uscendo , le consegne del mercoledi sono impietose,
                per cui entra sui nostri profili Facebook per saperne di piu' su di noi o scrivici una mail per segnalazioni, problemi, e qualsivoglia consiglio o rimprovero :-)</I></p>


            </div>
            <div class="col-md-4">
              <p>Phone:
                <strong>123.456.7890</strong>
              </p>
              <p>Email:
                <strong><a href="mailto:name@example.it">sim.rc7@gmail.com</a></strong>
                <strong><a href="mailto:name@example.it">alessio.zoccoli@gmail.com</a></strong>
              </p>
              <p>Facebook:
                <strong><a href="https://www.facebook.com/simone.rocchi.7"><br>Simone Rocchi</br>  </a></strong>
                <strong><a href="https://www.facebook.com/alessio.zoccoli?fref=ts">Alessio Zoccoli  </a></strong>
              </p>

              <p>Address:
                <strong>3481 VascaNavale Place
                  <br>Roma3 Hills, CA 90210</strong>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>



      </div>
      <footer>

        <div class="row">
          <div class="col-lg-12 text-center">
            <p>Copyright &copy; HAJA2015</p>
          </div>
        </div>

      </footer>
    </div>
      </body>

      <!-- jQuery-->
      <script src="../../bootstrap/js/jquery.js"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="../../bootstrap/js/bootstrap.min.js"></script>

      <!-- Script to Activate the Carousel -->
      <script>
        $('.carousel').carousel({
          interval: 3000 //changes the speed
        })
      </script>
    </form:form>

    </jsp:attribute>


</t:general>
