<!Doctype html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@attribute name="title" fragment="true" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="yield" fragment="true" required="true" %>
<%@attribute name="footer" fragment="true" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<html>
<head>
    <title>Welcome to your HAJA!</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">



    <meta charset="utf-8">
    <title><jsp:invoke fragment="title"/></title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <jsp:invoke fragment="head"/>

</head>


<body>
        <div style="background-image: url(../../bootstrap/img/bg.jpg)"> </div>
        <div class="brand">Haja</div>
        <div class="address-bar">3481 VascaNavale Place | Roma3 Hills, CA 90210 | 123.456.7890</div>
        <nav id="main-nav">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                        <dl class="nav navbar-nav">

                            <dt><a href="/">HAJA</a></dt>
                            <dt><a href="/administrator/supplier">Fornitori</a></dt>

                            <dt><a href="/administrator/product">Prodotti</a></dt>


                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <dt><a href="/administrator/user">Utenti</a></dt>
                                <dt><a href="/administrator/orders">Ordini </a></dt>
                            </sec:authorize>

                            <sec:authorize access="isAnonymous()">
                                <dt><a title="registrati" href="/signup">registrati</a></dt>
                                <dt><a title="login" href="/login">login</a></dt>
                            </sec:authorize>

                            <sec:authorize access="isAuthenticated()">
                                <dt><a href="/j_spring_security_logout">logout</a> </dt>
                            </sec:authorize>


                        </dl>
                    </div>
                </div>
            </nav>
        </nav>

        <script src="../../bootstrap/js/jquery.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

        <jsp:invoke fragment="yield"/>
        <jsp:invoke fragment="footer"/>

        <!-- json e jQuery per usare il carrello-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript">
            function add() {
                $(".acquista").on('click', function() {

                    var cart = JSON.parse(localStorage.getItem("cart"));
                    if (cart === null) {
                        cart = {};
                    }

                    if(cart[$(this).data("id")] !== undefined) {
                        if(cart[$(this).data("id")].quantity >= $(this).data("quantity")) {
                            alert("Spiacenti, ma "+$(this).data("name")+" non è in magazzino.");
                        } else {
                            alert("Hai aggiunto un altro "+$(this).data("name"));
                            cart[$(this).data("id")].quantity++;
                        }
                    } else {
                        alert("Hai aggiunto il prodotto nel carrello!");
                        cart[$(this).data("id")] = {
                            id: $(this).data("id"),
                            name: $(this).data("name"),
                            description: $(this).data("description"),
                            price: $(this).data("price"),
                            quantity: 1
                        };
                    }

                    cart = JSON.stringify(cart);

                    localStorage.setItem("cart", cart);

                });
            }


            function svuotaCarrello() {
                localStorage.removeItem("cart");
            }

            $("#confermaOrdine").on("click", function() {
                var json = {
                    creationDate: new Date(),
                    orderLines: []
                };

                var cart = JSON.parse(localStorage.getItem("cart"));
                for(product in cart) {
                    json.orderLines.push({
                        product: {id: cart[product].id},
                        quantity: cart[product].quantity,
                        price: cart[product].price
                    });
                }
                localStorage.setItem("json", JSON.stringify(json));
                $.ajax({
                    type: "POST",
                    url: "/customer/cart",
                    data: {json: localStorage.getItem("json")},
                    success: function() {
                        svuotaCarrello();
                        localStorage.removeItem("json");
                        alert("Ordine confermato correttamente.");
                    }
                });
            });

            $(document).ready(function() {
                add();
                $("#svuotaCarrello").on("click", function() {
                    svuotaCarrello();
                });
            });
        </script>



</body>
</html>