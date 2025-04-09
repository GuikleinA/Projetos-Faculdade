<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contato Excluído</title>
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
                <div class="alert alert-success mt-4">
                    <strong>Sucesso!</strong> O contato foi excluído com sucesso.
                </div>
            </div>

        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
