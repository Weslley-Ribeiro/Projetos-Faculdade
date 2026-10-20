# Frameworks para Desenvolvimento de Software — atividades 1 a 4

Registro técnico das práticas acadêmicas e da revisão do relatório em 20/10/2026. O nome histórico do arquivo foi mantido para preservar seu endereço.

## Códigos completos preservados

[Consultar todos os códigos e suas explicações na versão consolidada das quatro atividades](https://github.com/Weslley-Ribeiro/Projetos-Faculdade/blob/325449e9bfd827b66229578bf414896757dbb03e/Frameworks/ATIVIDADES-1-3-CODIGOS.md).

Esse link aponta para um commit específico, preservando os blocos completos de HTML, JSP e JavaScript anteriores a esta reorganização. Esta atualização transforma a página atual em um registro de procedimentos, resultados e revisão, sem apagar os códigos do histórico.

Atenção: o código da Atividade 2 no registro anterior é um exemplo consolidado, não uma transcrição verificada dos arquivos locais executados. O CSS original dessa atividade não foi recuperado. Os códigos das demais atividades também devem ser comparados com os projetos locais antes de serem apresentados como cópia integral.

## Ambiente utilizado e adaptações

- IDE: Apache NetBeans 23.
- Servidor Java Web: Apache Tomcat 9.0.122.
- Framework: Spring Framework 5.3.31 / Spring Web MVC.
- Interface das Atividades 3 e 4: Bootstrap 5.3.8 via CDN.
- Biblioteca da Atividade 4: jQuery 3.7.1 via CDN.
- Endereços: ViaCEP, com respostas JSON.
- Java JDK instalado no ambiente: a versão exata deve ser confirmada nas configurações locais.

O roteiro citava Tomcat 8.x, que não foi obtido no fluxo utilizado durante a prática. Foi adotado Tomcat 9.0.122, preservando a base Servlet/JSP javax utilizada pela estrutura Spring 5.3. Isso não significa que não existam versões históricas do Tomcat 8.

O Spring 5.3.31 é superior à versão mínima 4.3.29 indicada no roteiro. Bootstrap 5.3.8 e jQuery 3.7.1 substituíram as versões exemplificadas no material (5.0.2 e 1.7.1). As versões acima registram o ambiente do exercício; não representam recomendação de versões mais recentes ou de suporte para produção.

A antiga extensão NetBeans Connector para Chrome não estava disponível no ambiente utilizado. Os projetos HTML foram abertos diretamente no navegador. A aplicação Spring da Atividade 3 foi executada no Tomcat. ViaCEP é o serviço consumido, e não uma API própria dos Correios.

## Atividade 1 — configuração e aplicação de teste

Primeiro foi selecionado um projeto Java Web com Ant, associado ao Tomcat e criado com Spring Web MVC. O projeto de teste recebeu o nome WebApplication1. A estrutura gerada incluiu WEB-INF/jsp/index.jsp, applicationContext.xml, dispatcher-servlet.xml, web.xml e redirect.jsp.

A captura do redirect.jsp dessa etapa mostra `response.sendRedirect("index.jsp");`. O resultado foi registrado em `http://localhost:8080/WebApplication1/index.jsp`, com a mensagem “Aplicação funcionando com Tomcat”. O código completo dessa página não foi recuperado. Não se apresenta uma reconstrução como se fosse o original.

O teste demonstrou a entrega da página pelo Tomcat. Uma URL JSP direta não comprova, sozinha, passagem por um controlador Spring. Essa configuração histórica não deve substituir o fluxo index.htm da Atividade 3.

## Atividade 2 — formulário de endereço

Foi criado um projeto HTML5/JavaScript para trabalhar com CEP, rua, bairro, cidade, estado, número e complemento.

- index.html: estrutura da página e campos de endereço.
- style.css: estilos adicionais; arquivo original pendente de recuperação.
- controller.js: lógica de consulta e atualização dos campos.

O exemplo completo preservado no link de códigos usa Fetch para consultar `https://viacep.com.br/ws/{cep}/json/`, valida o comprimento de oito dígitos e trata CEP não encontrado e falha de consulta. A consulta preenche logradouro, bairro, localidade e UF nos campos correspondentes. O relatório documentou tela inicial, consulta válida e tratamento de erro.

## Atividade 3 — formulário Spring MVC e Bootstrap

Foi criado o projeto cadastroUsuario, com Tomcat e Spring Web MVC. O formulário foi implementado em WEB-INF/jsp/index.jsp e estilizado com Bootstrap.

### Relação entre código, execução e resultado

1. O acesso inicial à aplicação utiliza redirect.jsp, que redireciona para index.htm.
2. No dispatcher-servlet.xml, index.htm está associado a indexController.
3. O controlador utiliza o nome lógico de view index.
4. O InternalResourceViewResolver combina o prefixo /WEB-INF/jsp/ com o nome index e o sufixo .jsp.
5. O arquivo /WEB-INF/jsp/index.jsp é apresentado no navegador.

Endereço verificado: `http://localhost:8080/cadastroUsuario/index.htm`.

O JSP completo está no link permanente dos códigos. Classes container, row, col-md-*, card, form-label e form-control organizam a interface.

Os 11 campos são: Nome, Sobrenome, E-mail, Senha, CEP, Rua, Bairro, Cidade, Estado, Número e Complemento. O formulário exibido no navegador apresenta esses campos e o botão Cadastrar.

### Revisão de 20/10/2026

O retorno da avaliação solicitou evidências mais claras do formulário e melhor conexão entre procedimentos e resultados. Foram realizadas as seguintes melhorias:

- Figura 20 refeita: captura do código mostrando os 11 campos e o botão.
- Figura 21 refeita: captura do navegador com URL do projeto, título, todos os campos e botão.
- Texto ampliado para explicar o caminho JSP → Spring MVC → Tomcat → interface apresentada.
- Resultado descrito explicitamente, com a disposição das linhas e a aplicação do CSS Bootstrap.
- Relatório atualizado para 31 páginas físicas, com Figura 20 na página numerada 19, Figura 21 na página numerada 20 e sumário atualizado.

Esta revisão foi documental: não houve nova funcionalidade implementada. O PDF revisado foi preparado; reenvio e nova avaliação ainda não foram confirmados neste registro.

Não há persistência, processamento do cadastro no servidor ou consulta de CEP nesta atividade. O `action="#"` e o método POST não equivalem a gravação de dados.

## Atividade 4 — formulário com jQuery e ViaCEP

Foi criado o projeto HTML5/JavaScript cadUsuario, sem template e sem ferramentas opcionais de automação.

- index.html: interface, Bootstrap e jQuery, além do carregamento dos scripts locais.
- main.js: máscara simples de CEP e consulta com $.getJSON quando o campo perde o foco (blur).
- validation.js: campos obrigatórios, formato básico de e-mail por expressão regular e senha mínima de seis caracteres.

O atributo novalidate desativa a validação interativa padrão do navegador para a demonstração das regras JavaScript. As classes is-valid e is-invalid controlam o retorno visual do Bootstrap. Complemento é opcional na implementação. O evento de envio utiliza preventDefault; quando as regras são atendidas, exibe “Cadastro validado com sucesso!” e limpa o formulário.

Os três arquivos completos estão no link permanente dos códigos.

### Resultados documentados

- Formulário inicial estilizado: Figura 25.
- Campos obrigatórios: Figura 26 do relatório.
- Consulta do CEP 01001-000: Praça da Sé, Sé, São Paulo, SP; Figura 27.
- Alerta de validação bem-sucedida: Figura 28.

### Limitações dos exemplos

Não há banco de dados, autenticação ou API própria. A regex valida formato básico, não existência do e-mail. A senha mínima é uma regra didática, não uma política completa de segurança.

No código registrado, a validação genérica do CEP em validation.js verifica apenas preenchimento e pode sobrepor o estado visual definido por main.js. Portanto, não há garantia de aceitar apenas CEPs consultados com sucesso. Também não há controle de respostas concorrentes da API. Essas limitações ficam registradas; não foram corrigidas silenciosamente nesta atualização.

## Sequência final das 28 figuras

Esta tabela segue a numeração do relatório, não a ordem de upload das imagens na conversa.

| Figura | Evidência |
|---|---|
| 1 | Seleção de projeto Java Web |
| 2 | Estrutura do projeto de teste WebApplication1 |
| 3 | Configuração do Tomcat |
| 4 | Seleção Spring Web MVC |
| 5 | redirect.jsp da aplicação de teste |
| 6 | Aplicação de teste no navegador |
| 7 | Criação do projeto de endereço |
| 8 | Organização HTML/CSS/JavaScript |
| 9 | HTML do formulário de endereço |
| 10 | Estilos CSS e Bootstrap |
| 11 | Consulta no controller.js |
| 12 | Formulário de endereço no navegador |
| 13 | Consulta de CEP válida |
| 14 | Tratamento de CEP inválido/não localizado |
| 15 | Nome e localização de cadastroUsuario |
| 16 | Servidor e contexto /cadastroUsuario |
| 17 | Spring Web MVC e biblioteca 5.3.31 |
| 18 | Estrutura Spring e JSP inicial |
| 19 | Bootstrap incluído no JSP |
| 20 | Código dos 11 campos, captura refeita em 20/10 |
| 21 | Formulário completo via Tomcat, captura refeita em 20/10 |
| 22 | Criação de cadUsuario |
| 23 | index.html, main.js e validation.js |
| 24 | Bootstrap, jQuery e estrutura inicial |
| 25 | Formulário inicial |
| 26 | Validação de obrigatórios |
| 27 | Endereço preenchido pelo ViaCEP |
| 28 | Confirmação da validação |

## Relatório, aprendizado e próximos passos

O relatório reúne capa, folha de rosto, sumário, introdução, quatro atividades, conclusão e referências. As adaptações de versão e de execução sem extensão foram registradas. A revisão reforçou a importância de conferir a legibilidade no PDF exportado, não apenas na captura original.

Competências exercitadas: configuração de servidor Java Web, organização de JSPs e configuração Spring MVC, layout com Bootstrap, requisições assíncronas, manipulação de DOM com JavaScript/jQuery, regex e validação de formulários. Trata-se de experiência acadêmica demonstrável, não de experiência profissional de emprego.

Pendências para um portfólio executável:

- Adicionar os projetos locais originais, configurações de build e dependências.
- Recuperar o CSS e conferir o código original da Atividade 2.
- Confirmar a versão exata do JDK.
- Criar instruções de execução por projeto. A aplicação JSP precisa do ambiente Java/Tomcat.
- Publicar capturas selecionadas apenas após revisão e autorização, sem dados pessoais.
- Em uma evolução futura, integrar validação do CEP, tratar concorrência e implementar back-end e validação no servidor.

Este commit não publica imagens, PDF, nota, RA ou outros dados acadêmicos pessoais.

## Documentação de referência

- NetBeans 23: https://netbeans.apache.org/front/main/download/nb23/
- Tomcat 9: https://tomcat.apache.org/tomcat-9.0-doc/
- Spring MVC/JSP: https://docs.spring.io/spring-framework/reference/web/webmvc-view/mvc-jsp.html
- Bootstrap: https://getbootstrap.com/docs/5.3/forms/validation/
- jQuery: https://releases.jquery.com/jquery/
- ViaCEP: https://viacep.com.br/
