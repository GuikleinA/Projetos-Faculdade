<%@page import="model.Pessoa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Contato</title>
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

            <form action="editContatosbd" method="post" id="formulario">
                <input type="hidden" name="id" id="hiddenField" value="${contato.id}"/>

                <div class="mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control ml-2" value="${contato.nome}" name="nome" placeholder="nome" aria-label="nome" id="nome">
                    <span class="erro" id="erro-nome"></span>
                </div>

                <div class="mb-3">
                    <label for="telefone" class="form-label">Telefone</label>
                    <input type="text" class="form-control ml-2" value="${contato.telefone}" name="telefone" placeholder="(00) 00000-0000" aria-label="telefone" id="telefone">
                    <span class="erro" id="erro-telefone"></span>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text" id="addon-wrapping">@</span>
                        <input type="text" class="form-control ml-2" value="${contato.email}" placeholder="email" name="email" aria-label="email" id="email">
                        <span class="erro" id="erro-email"></span>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF</label>
                    <input type="text" class="form-control ml-2" value="${contato.cpf}" placeholder="000.000.000-00" name="cpf" aria-label="cpf" id="cpf">
                    <span class="erro" id="erro-cpf"></span>
                </div>

                <button id="salvar" type="submit" class="btn btn-primary">Salvar</button>
            </form>
            <p id="mensagem-final"></p>
        </div>

        <script>
            const form = document.getElementById('formulario');

            const nome = document.getElementById('nome');
            const cpf = document.getElementById('cpf');
            const email = document.getElementById('email');
            const telefone = document.getElementById('telefone');

            const erroNome = document.getElementById('erro-nome');
            const erroCpf = document.getElementById('erro-cpf');
            const erroEmail = document.getElementById('erro-email');
            const erroTelefone = document.getElementById('erro-telefone');

            const mensagemFinal = document.getElementById('mensagem-final');

            // Função para formatar CPF
            function formatarCPF(valor) {
                return valor.replace(/\D/g, '')
                    .replace(/(\d{3})(\d)/, '$1.$2')
                    .replace(/(\d{3})(\d)/, '$1.$2')
                    .replace(/(\d{3})(\d{1,2})$/, '$1-$2');
            }

            // Função para formatar telefone (com DDD)
            function formatarTelefone(valor) {
                return valor.replace(/\D/g, '')
                    .replace(/(\d{2})(\d)/, '($1) $2')
                    .replace(/(\d{5})(\d{4})$/, '$1-$2');
            }

            // Formatação do CPF após o preenchimento completo
            cpf.addEventListener('blur', function () {
                const valor = cpf.value.replace(/\D/g, '');
                if (valor.length === 11) {
                    cpf.value = formatarCPF(valor);
                }
            });

            telefone.addEventListener('blur', function () {
                const valor = telefone.value.replace(/\D/g, '');
                if (valor.length === 11) {
                    telefone.value = formatarTelefone(valor);
                }
            });

            form.addEventListener('submit', function (e) {
                e.preventDefault();

                // Limpa mensagens anteriores
                erroNome.innerText = '';
                erroCpf.innerText = '';
                erroEmail.innerText = '';
                erroTelefone.innerText = '';
                mensagemFinal.innerText = '';

                let formularioValido = true;

                if (nome.value.trim() === "") {
                    erroNome.innerText = 'Nome não pode ficar em branco';
                    formularioValido = false;
                }

                const cpfLimpo = cpf.value.replace(/\D/g, '');
                const cpfValido = cpfLimpo.length === 11;
                if (!cpfValido) {
                    erroCpf.innerText = 'CPF inválido';
                    formularioValido = false;
                }

                const emailValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value);
                if (!emailValido) {
                    erroEmail.innerText = 'Email inválido';
                    formularioValido = false;
                }

                const telefoneLimpo = telefone.value.replace(/\D/g, '');
                const telefoneValido = telefoneLimpo.length === 11;
                if (!telefoneValido) {
                    erroTelefone.innerText = 'Telefone inválido';
                    formularioValido = false;
                }

                if (formularioValido) {
                    mensagemFinal.innerText = 'Formulário enviado com sucesso!';
                    mensagemFinal.className = 'sucesso';

                   form.submit();
                }
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    </body>
</html>
