<%-- 
    Document   : listContatos
    Created on : 26 de mar. de 2025, 20:40:11
    Author     : guilherme.klein
--%>
<%@page import="dao.PessoaDao,model.Pessoa,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/scripts.js"></script>
        <script src="js/scripts1.js"></script>
        <title>Projeto Avaliação 1</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            body {
                background-color: #87CEFA;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <ul class="nav justify-content-center mt-4">
                <li class="nav-item">
                  <a class="nav-link" href="newContato">Adicionar Contato</a>
                </li>
            </ul>
            
            <div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nome</th>
                            <th>Telefone</th>
                            <th>CPF</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lista}" var="p">
                            <tr>
                                <td>${p.getId()}</td>
                                <td>${p.getNome()}</td>
                                <td>${p.getTelefone()}</td>
                                <td>${p.getEmail()}</td>
                                <td>${p.getCpf()}</td>
                                <td><form action="editContatos" method="post">
                                    <input type="hidden" name="id" id="hiddenField" value="${p.getId()}"/>
                                    </form>
                                        <button class="btn btn-primary" onclick="editar(${p.getId()})")>Editar</button>
                                </td>
                                <td>
                                    <button class="btn btn-danger" onclick="confirmar(${p.getId()})")>Apagar</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
