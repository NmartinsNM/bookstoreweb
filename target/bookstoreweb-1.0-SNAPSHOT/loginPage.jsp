<%-- 
    Document   : loginPage
    Created on : 11 de mai de 2022, 09:38:37
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Bookstore Website</title>
        <nav class="navbar navbar-light bg-faded" style="background-color: #ABC; border-color: #000;">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div style="text-align: center">
            <h1 class = "jumbotron">Admin Login</h1>
            <form action="login" method="post">
                <label for="email">Email</label>
                <div class = "wrap-input100 validate-input m-b-16">
                    <input class = "wrap-input100 validate-input m-b-16"name="email" size="30" />
                </div>
                <br>
                <label for="password">Password:</label>
                <div class = "wrap-input100 validate-input m-b-16">
                    <input type="password" name="password" size="30" />
                </div>
                <!--
                   Esse atributo MESSAGE será utilizado como retorno de 
               mensagem ao usuário caso
                   login inválido.
                -->
                <br>${message}<br><br> 
                <button class = "btn btn-primary btn-lg"type="submit">Login</button>
                <br><br>
                <p>Não tem uma conta? <a style="color: red" href="/bookstoreweb/bsuser/new">Registre-se</a></p>

            </form>
        </div>
    </body>
</html>