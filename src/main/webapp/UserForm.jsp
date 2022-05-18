<%-- 
    Document   : UserForm
    Created on : 11 de mai de 2022, 08:10:57
    Author     : devsys-b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Aplicação Users Store</title>
          <nav class="navbar navbar-light bg-faded" style="background-color: #ABC; border-color: #000;">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
         
    </head>
    <body>
        <h1>Novo Usuario</h1>
        <p><a href="<%=request.getContextPath()%>/new" button class = "btn btn-primary btn-lg"type="submit">Adicionar novo </button>
          </a></p>
        <p><a href="<%=request.getContextPath()%>/list"button class = "btn btn-primary btn-lg"type="submit">Lista de todos usuarios </button>
        </a></p>

        <div align="left">
            <c:if test="${user != null}">
                <form action="<%=request.getContextPath()%>/bstore/update" method="post">
                </c:if>
                <c:if test="${user == null}">
                    <form action="<%=request.getContextPath()%>/bstore/insert" method="post">
                    </c:if>
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${user != null}">
                                    Editar Usuario
                                </c:if>
                              
                            </h2>
                        </caption>
                        <c:if test="${user != null}">
                            <input type="hidden" name="formId" value="<c:out 
                                       value='${user.id}' />" />
                        </c:if> 
                        <tr>
                            <th>Email: </th>
                            <td>
                                <input type="text" name="formEmail" size="45"
                                       value="<c:out value='${user.email}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Password: </th>
                            <td>
                                <input type="text" name="formPassword" size="45"
                                       value="<c:out value='${user.password}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Fullname: </th>
                            <td>
                                <input type="text" name="formFullname" size="5"
                                       value="<c:out value='${user.fullname}' />"
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