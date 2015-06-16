<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<%@attribute name="title" fragment="true" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="yield" fragment="true" required="true" %>
<%@attribute name="footer" fragment="true" %>

<html>
<head>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">

    <meta charset="utf-8">
    <title><jsp:invoke fragment="title"/></title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <jsp:invoke fragment="head"/>
</head>

<body>
    <nav id="main-nav">
        <dl>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <dt><a href="/">HAJA</a></dt>
                <dt><a href="/administrator/supplier">Fornitori</a></dt>
                <dt><a href="/administrator/user">Utenti</a></dt>
                <dt><a href="/administrator/orders">Ordini </a></dt>
                <dt><a href="/administrator/product">Gestione Catalogo Prodotti</a></dt>
            </sec:authorize>


            <sec:authorize access="hasRole('ROLE_USER')">
                <dt><a href="/cart/init">Nuovo Carrello - inizializzami</dt>
            </sec:authorize>

        </dl>
    </nav>


    <nav id="seconday-nav">
        <dl>
            <dt><a title="registrati" href="/signup">registrati</a></dt>
            <sec:authorize access="isAnonymous()">
                <dt><a title="login" href="/login">login</a></dt>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <dt><a href="/j_spring_security_logout">logout</a> </dt>
            </sec:authorize>
        </dl>
    </nav>

    <jsp:invoke fragment="yield"/>
    <jsp:invoke fragment="footer"/>
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
                        alert("Non abbiamo abbastanza "+$(this).data("name")+" in magazzino.");
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