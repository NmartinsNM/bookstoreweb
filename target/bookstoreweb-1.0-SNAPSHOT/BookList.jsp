

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/cabecalho.jsp"/>
        <jsp:include page="./contents/headerTags.jsp"/>

        <title>Aplicação BookStoreWeb</title>
        <nav class="navbar navbar-light bg-faded" style="background-color: #ABC; border-color: #000;">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">


            <div class="table-responsive">

                <table class="table table-hover">
                    <caption><h2>List of Books</h2></caption>
                    <tr>
                        <th>ID</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Preco</th>
                        <th>Ações</th>
                    </tr>

                    <c:forEach var="book" items="${listaBookNat}">
                        <tr>
                            <td><c:out value="${book.id}" /></td>
                            <td><c:out value="${book.titulo}" /></td>
                            <td><c:out value="${book.autor}" /></td>
                            <td><c:out value="${book.preco}" /></td>
                            <td>
                                <a href="<%=request.getContextPath()%>/bstore/edit?id=<c:out value='${book.id}' />">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="<%=request.getContextPath()%>/bstore/delete?id=<c:out value='${book.id}' />">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <jsp:include page="./contents/rodape.jsp"/>
        </div>
    </body>
</html>


