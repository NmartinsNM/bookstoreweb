<%-- 
    Document   : BookForm
    Created on : 25 de abr de 2022, 16:18:05
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Aplicação Books Store</title>
         <nav class="navbar navbar-light bg-faded" style="background-color: #ABC; border-color: #000;">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="./contents/cabecalho.jsp"/>

        <div align="left">
            <c:if test="${book != null}">
                <form action="<%=request.getContextPath()%>/bstore/update" method="post">
                </c:if>
                <c:if test="${book == null}">
                    <form action="<%=request.getContextPath()%>/bstore/insert" method="post">
                    </c:if>
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${book != null}">
                                    Editar Livro
                                </c:if>
                                <c:if test="${book == null}">
                                    Adicionar novo Livro
                                </c:if>
                            </h2>
                        </caption>
                        <c:if test="${book != null}">
                            <input type="hidden" name="formId" value="<c:out 
                                       value='${book.id}' />" />
                        </c:if> 
                        <tr>
                            <th>Titulo: </th>
                            <td>
                                <input type="text" name="formTitulo" size="45"
                                       value="<c:out value='${book.titulo}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Autor: </th>
                            <td>
                                <input type="text" name="formAutor" size="45"
                                       value="<c:out value='${book.autor}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Preco: </th>
                            <td>
                                <input type="text" name="formPreco" size="5"
                                       value="<c:out value='${book.preco}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Enviar" />
                            </td>
                        </tr>
                    </table>
                </form>
        </div> 
        <jsp:include page="./contents/rodape.jsp"/>
    </body>
</html>                                                                                                    