<%-- 
    Document   : editContato
    Created on : 26 de mar. de 2025, 20:50:29
    Author     : guilherme.klein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                  <a class="nav-link active" aria-current="page" href="listContatos">Listar Contatos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="newContato">Adicionar Contato</a>
                </li>
            </ul>
        
            <div>
                <div class="alert alert-success">
                    Essa pessoa foi salva com sucesso
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16" style="color: green;">
                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425z"/>
                    </svg>
                </div>
            </div>

        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
