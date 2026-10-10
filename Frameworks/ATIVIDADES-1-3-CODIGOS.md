# Frameworks — atividades práticas 1 a 4

> Registro de apoio para organizar posteriormente a documentação do portfólio. Os códigos abaixo reúnem os exemplos preparados durante a assistência; confira-os com os arquivos locais antes de apresentá-los como cópia exata dos projetos executados.

## Atividade 1 — configuração Tomcat e teste

### Objetivo e momento

A etapa consistiu em preparar o ambiente Java Web no NetBeans e configurar o servidor Apache Tomcat para executar uma aplicação web de teste. O roteiro de aula menciona Tomcat 8, que não estava disponível no ambiente atual do aluno; foi usado Tomcat 9.0.122 com NetBeans 23. O projeto cadastrado depois para as atividades Spring utiliza o caminho padrão do Spring Web MVC criado pelo NetBeans.

### Observação sobre o código

Não há, no registro desta assistência, um bloco completo de código-fonte da página de teste da Atividade 1. Por isso, não se reproduz aqui código como se fosse o arquivo original. Para documentar a cópia efetivamente executada, adicionar posteriormente o arquivo da página de teste e os passos de configuração do servidor, conforme estiverem no projeto local.

## Atividade 2 — formulário de endereço e ViaCEP

### Objetivo e momento

Formulário front-end em HTML5, estilizado com Bootstrap 5, destinado a consultar CEP e preencher rua, bairro, cidade e estado por meio do serviço ViaCEP. Os trechos representam a implementação preparada para essa atividade; comparar com os arquivos locais `index.html`, `style.css` e `controller.js` antes de publicação como versão final.

### `index.html`

Usado na criação da estrutura da página, dos campos de endereço, do botão de consulta e das referências ao CSS e JavaScript.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Endereço</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h1 class="h3 text-center mb-4">Cadastro de Endereço</h1>
                        <form id="formEndereco">
                            <div class="mb-3">
                                <label for="cep" class="form-label">CEP</label>
                                <input type="text" class="form-control" id="cep" name="cep" maxlength="9" placeholder="00000-000" required>
                                <div class="form-text">Digite o CEP para consultar o endereço.</div>
                            </div>
                            <div class="mb-3">
                                <label for="rua" class="form-label">Rua</label>
                                <input type="text" class="form-control" id="rua" name="rua" required>
                            </div>
                            <div class="mb-3">
                                <label for="bairro" class="form-label">Bairro</label>
                                <input type="text" class="form-control" id="bairro" name="bairro" required>
                            </div>
                            <div class="mb-3">
                                <label for="cidade" class="form-label">Cidade</label>
                                <input type="text" class="form-control" id="cidade" name="cidade" required>
                            </div>
                            <div class="mb-3">
                                <label for="estado" class="form-label">Estado</label>
                                <input type="text" class="form-control" id="estado" name="estado" maxlength="2" required>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="numero" class="form-label">Número</label>
                                    <input type="text" class="form-control" id="numero" name="numero">
                                </div>
                                <div class="col-md-8 mb-3">
                                    <label for="complemento" class="form-label">Complemento</label>
                                    <input type="text" class="form-control" id="complemento" name="complemento">
                                </div>
                            </div>
                            <div id="mensagem" class="small mb-3" aria-live="polite"></div>
                            <button type="button" id="btnConsultar" class="btn btn-primary w-100">Consultar CEP</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="controller.js"></script>
</body>
</html>
```

### `controller.js`

Usado para validar o CEP, consultar o endpoint ViaCEP, preencher automaticamente os campos de endereço, informar carregamento e apresentar mensagens para CEP inválido, não encontrado ou falha de rede.

```javascript
const campoCep = document.getElementById("cep");
const campoRua = document.getElementById("rua");
const campoBairro = document.getElementById("bairro");
const campoCidade = document.getElementById("cidade");
const campoEstado = document.getElementById("estado");
const mensagem = document.getElementById("mensagem");
const botaoConsultar = document.getElementById("btnConsultar");

function limparEndereco() {
    campoRua.value = "";
    campoBairro.value = "";
    campoCidade.value = "";
    campoEstado.value = "";
}

async function consultarCep() {
    const cep = campoCep.value.replace(/\D/g, "");
    mensagem.textContent = "";
    mensagem.className = "small mb-3";

    if (cep.length !== 8) {
        limparEndereco();
        mensagem.textContent = "Informe um CEP válido com 8 números.";
        mensagem.classList.add("text-danger");
        campoCep.focus();
        return;
    }

    botaoConsultar.disabled = true;
    mensagem.textContent = "Consultando CEP...";
    mensagem.classList.add("text-secondary");

    try {
        const resposta = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
        if (!resposta.ok) throw new Error("Falha na consulta");

        const endereco = await resposta.json();
        if (endereco.erro) {
            limparEndereco();
            mensagem.textContent = "CEP não encontrado.";
            mensagem.className = "small mb-3 text-danger";
            return;
        }

        campoRua.value = endereco.logradouro || "";
        campoBairro.value = endereco.bairro || "";
        campoCidade.value = endereco.localidade || "";
        campoEstado.value = endereco.uf || "";
        mensagem.textContent = "Endereço preenchido com sucesso.";
        mensagem.className = "small mb-3 text-success";
    } catch (erro) {
        limparEndereco();
        mensagem.textContent = "Não foi possível consultar o CEP. Verifique a conexão e tente novamente.";
        mensagem.className = "small mb-3 text-danger";
    } finally {
        botaoConsultar.disabled = false;
    }
}

botaoConsultar.addEventListener("click", consultarCep);
campoCep.addEventListener("keydown", (evento) => {
    if (evento.key === "Enter") {
        evento.preventDefault();
        consultarCep();
    }
});
```

## Atividade 3 — formulário Spring MVC e Bootstrap

### Objetivo e momento

A view JSP foi substituída pela página de formulário dentro de `WEB-INF/jsp/index.jsp`. O projeto executado no NetBeans exibiu a tela pelo endereço local `/cadastroUsuario/index.htm`. O mapeamento Spring observado foi `index.htm` → `indexController`; o nome de view `index` foi resolvido pelo prefixo `/WEB-INF/jsp/` e sufixo `.jsp`.

O formulário é uma demonstração visual: não persiste dados nem implementa processamento do envio. O botão e o atributo `action="#"` não devem ser descritos como funcionalidade de gravação.

### `WEB-INF/jsp/index.jsp`

Inserido na implementação do formulário de cadastro e na aplicação das classes de layout e formulário do Bootstrap 5.

```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h1 class="h3 text-center mb-4">Formulário de Cadastro</h1>
                        <form action="#" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="nome" class="form-label">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="sobrenome" class="form-label">Sobrenome</label>
                                    <input type="text" class="form-control" id="sobrenome" name="sobrenome" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">E-mail</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="senha" class="form-label">Senha</label>
                                    <input type="password" class="form-control" id="senha" name="senha" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="cep" class="form-label">CEP</label>
                                    <input type="text" class="form-control" id="cep" name="cep" required>
                                </div>
                                <div class="col-md-8">
                                    <label for="rua" class="form-label">Rua</label>
                                    <input type="text" class="form-control" id="rua" name="rua" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="bairro" class="form-label">Bairro</label>
                                    <input type="text" class="form-control" id="bairro" name="bairro" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="cidade" class="form-label">Cidade</label>
                                    <input type="text" class="form-control" id="cidade" name="cidade" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="estado" class="form-label">Estado</label>
                                    <input type="text" class="form-control" id="estado" name="estado" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="numero" class="form-label">Número</label>
                                    <input type="text" class="form-control" id="numero" name="numero" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="complemento" class="form-label">Complemento</label>
                                    <input type="text" class="form-control" id="complemento" name="complemento">
                                </div>
                                <div class="col-12 d-grid mt-4">
                                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
```

## Atividade 4 — cadastro de usuário com jQuery e ViaCEP

### Objetivo e momento

A atividade foi implementada em um projeto HTML5/JavaScript chamado `cadUsuario`, sem template e sem ferramentas adicionais de automação. O objetivo foi construir um formulário de cadastro de usuário usando Bootstrap 5 para o layout, jQuery para manipulação e validação dos campos e ViaCEP para preenchimento automático de endereço.

O código foi separado por responsabilidade: `index.html` contém a interface e as referências aos CDNs; `main.js` consulta a API; `validation.js` valida os dados antes de permitir a finalização simulada do cadastro.

### `index.html`

Usado para criar os 11 campos do formulário, carregar Bootstrap 5.3.8, jQuery 3.7.1 e os dois scripts locais. O atributo `novalidate` permite que a interface utilize o feedback visual controlado por jQuery e pelas classes do Bootstrap.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-9">
                <div class="card shadow-sm">
                    <div class="card-body p-4 p-md-5">
                        <h1 class="h3 text-center mb-4">Cadastro de Usuário</h1>
                        <form id="formCadastro" novalidate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="nome" class="form-label">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome" required>
                                    <div class="invalid-feedback">Informe o nome.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="sobrenome" class="form-label">Sobrenome</label>
                                    <input type="text" class="form-control" id="sobrenome" name="sobrenome" required>
                                    <div class="invalid-feedback">Informe o sobrenome.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">E-mail</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="invalid-feedback">Informe um e-mail válido.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="senha" class="form-label">Senha</label>
                                    <input type="password" class="form-control" id="senha" name="senha" minlength="6" required>
                                    <div class="invalid-feedback">A senha deve ter pelo menos 6 caracteres.</div>
                                </div>
                                <div class="col-12"><hr class="my-2"><h2 class="h5 mt-3">Endereço</h2></div>
                                <div class="col-md-4">
                                    <label for="cep" class="form-label">CEP</label>
                                    <input type="text" class="form-control" id="cep" name="cep" maxlength="9" placeholder="00000-000" required>
                                    <div class="invalid-feedback">Informe um CEP válido.</div>
                                </div>
                                <div class="col-md-8">
                                    <label for="rua" class="form-label">Rua</label>
                                    <input type="text" class="form-control" id="rua" name="rua" required>
                                    <div class="invalid-feedback">Informe a rua.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="bairro" class="form-label">Bairro</label>
                                    <input type="text" class="form-control" id="bairro" name="bairro" required>
                                    <div class="invalid-feedback">Informe o bairro.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="cidade" class="form-label">Cidade</label>
                                    <input type="text" class="form-control" id="cidade" name="cidade" required>
                                    <div class="invalid-feedback">Informe a cidade.</div>
                                </div>
                                <div class="col-md-4">
                                    <label for="estado" class="form-label">Estado</label>
                                    <input type="text" class="form-control" id="estado" name="estado" maxlength="2" placeholder="UF" required>
                                    <div class="invalid-feedback">Informe o estado.</div>
                                </div>
                                <div class="col-md-4">
                                    <label for="numero" class="form-label">Número</label>
                                    <input type="text" class="form-control" id="numero" name="numero" required>
                                    <div class="invalid-feedback">Informe o número.</div>
                                </div>
                                <div class="col-md-4">
                                    <label for="complemento" class="form-label">Complemento</label>
                                    <input type="text" class="form-control" id="complemento" name="complemento">
                                </div>
                                <div class="col-12"><div id="mensagemCep" class="small" aria-live="polite"></div></div>
                                <div class="col-12 d-grid mt-2"><button type="submit" class="btn btn-primary">Cadastrar</button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="main.js"></script>
    <script src="validation.js"></script>
</body>
</html>
```

### `main.js`

Usado para formatar o CEP e consultar o ViaCEP quando o usuário sai do campo. A resposta preenche rua, bairro, cidade e estado; também há mensagens para CEP inválido, não encontrado ou falha de consulta.

```javascript
$(document).ready(function () {
    const campoCep = $("#cep");
    const mensagemCep = $("#mensagemCep");

    function limparEndereco() {
        $("#rua").val("");
        $("#bairro").val("");
        $("#cidade").val("");
        $("#estado").val("");
    }

    function exibirMensagem(texto, classe) {
        mensagemCep
            .removeClass("text-danger text-success text-secondary")
            .addClass(classe)
            .text(texto);
    }

    function consultarCep() {
        const cep = campoCep.val().replace(/\D/g, "");
        mensagemCep.text("");

        if (cep.length !== 8) {
            limparEndereco();
            campoCep.addClass("is-invalid");
            exibirMensagem("Informe um CEP válido com 8 números.", "text-danger");
            return;
        }

        campoCep.removeClass("is-invalid");
        exibirMensagem("Consultando CEP...", "text-secondary");

        $.getJSON(`https://viacep.com.br/ws/${cep}/json/`)
            .done(function (endereco) {
                if (endereco.erro) {
                    limparEndereco();
                    campoCep.addClass("is-invalid");
                    exibirMensagem("CEP não encontrado.", "text-danger");
                    return;
                }

                $("#rua").val(endereco.logradouro || "");
                $("#bairro").val(endereco.bairro || "");
                $("#cidade").val(endereco.localidade || "");
                $("#estado").val(endereco.uf || "");
                campoCep.removeClass("is-invalid").addClass("is-valid");
                exibirMensagem("Endereço preenchido com sucesso.", "text-success");
                $("#numero").focus();
            })
            .fail(function () {
                limparEndereco();
                exibirMensagem("Não foi possível consultar o CEP. Verifique sua conexão e tente novamente.", "text-danger");
            });
    }

    campoCep.on("blur", consultarCep);
    campoCep.on("input", function () {
        let valor = $(this).val().replace(/\D/g, "");
        if (valor.length > 5) {
            valor = `${valor.substring(0, 5)}-${valor.substring(5, 8)}`;
        }
        $(this).val(valor);
    });
});
```

### `validation.js`

Usado para validar os campos obrigatórios, o e-mail por expressão regular e a senha com mínimo de seis caracteres. As classes `is-valid` e `is-invalid` permitem que o Bootstrap dê retorno visual ao usuário. O envio é simulado para o exercício: quando os dados são válidos, é mostrado o alerta `Cadastro validado com sucesso!` e o formulário é limpo.

```javascript
$(document).ready(function () {
    const formulario = $("#formCadastro");

    function validarEmail(email) {
        const expressaoRegular = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return expressaoRegular.test(email);
    }

    function validarCampo(campo) {
        const valor = campo.val().trim();
        if (valor === "") {
            campo.removeClass("is-valid").addClass("is-invalid");
            return false;
        }
        campo.removeClass("is-invalid").addClass("is-valid");
        return true;
    }

    function validarEmailCampo() {
        const campoEmail = $("#email");
        const email = campoEmail.val().trim();
        if (!validarEmail(email)) {
            campoEmail.removeClass("is-valid").addClass("is-invalid");
            return false;
        }
        campoEmail.removeClass("is-invalid").addClass("is-valid");
        return true;
    }

    function validarSenha() {
        const campoSenha = $("#senha");
        const senha = campoSenha.val();
        if (senha.length < 6) {
            campoSenha.removeClass("is-valid").addClass("is-invalid");
            return false;
        }
        campoSenha.removeClass("is-invalid").addClass("is-valid");
        return true;
    }

    formulario.on("submit", function (evento) {
        evento.preventDefault();
        let formularioValido = true;
        const camposObrigatorios = [
            $("#nome"), $("#sobrenome"), $("#cep"), $("#rua"),
            $("#bairro"), $("#cidade"), $("#estado"), $("#numero")
        ];

        camposObrigatorios.forEach(function (campo) {
            if (!validarCampo(campo)) formularioValido = false;
        });

        if (!validarEmailCampo()) formularioValido = false;
        if (!validarSenha()) formularioValido = false;

        if (formularioValido) {
            alert("Cadastro validado com sucesso!");
            formulario[0].reset();
            formulario.find(".is-valid, .is-invalid").removeClass("is-valid is-invalid");
            $("#mensagemCep").text("");
        }
    });

    $("#nome, #sobrenome, #cep, #rua, #bairro, #cidade, #estado, #numero")
        .on("blur", function () {
            validarCampo($(this));
        });

    $("#email").on("blur", validarEmailCampo);
    $("#senha").on("blur", validarSenha);
});
```

### Teste registrado

O CEP `01001-000` retornou os dados Praça da Sé, Sé, São Paulo e SP. Após o preenchimento dos campos obrigatórios com e-mail válido e senha de seis caracteres, o formulário exibiu o alerta `Cadastro validado com sucesso!`.

### Limitação do exercício

A atividade valida a interface e simula a conclusão do cadastro. Não há banco de dados, API própria ou persistência de dados implementada.

## Próximos passos para portfólio

- Conferir todos os blocos com a versão local executada no NetBeans.
- Adicionar os arquivos originais das atividades, evitando publicar só uma transcrição em arquivo único.
- Incluir README com objetivo, ferramentas, execução e limitações conhecidas.
- Adicionar capturas de tela aprovadas pelo aluno, sem dados pessoais.
- Registrar versões efetivamente utilizadas e data dos testes.
