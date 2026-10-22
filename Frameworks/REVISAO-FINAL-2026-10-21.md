# Revisão final — Atividade 3 de Frameworks

Revisão documental realizada em 21/10/2026, complementar ao [registro das quatro atividades e códigos](ATIVIDADES-1-3-CODIGOS.md). Esta atualização não altera código nem publica PDF, capturas ou dados acadêmicos pessoais.

## Motivo

Após a primeira revisão, o retorno da avaliação reconheceu a evidência dos 11 campos no navegador e solicitou uma descrição mais objetiva dos procedimentos e resultados, com menos detalhes de configuração.

## Alterações realizadas

Foram substituídos três blocos de texto da Atividade 3, preservando as Figuras 20 e 21, as legendas e o restante do relatório:

1. Antes da Figura 20: identificação do arquivo WEB-INF/jsp/index.jsp, dos 11 campos e do botão Cadastrar; explicação do papel das classes form-label, form-control, row e col-md-* na interface.
2. Antes da Figura 21: descrição curta da execução no NetBeans com Tomcat 9.0.122 e do acesso em http://localhost:8080/cadastroUsuario/index.htm; retirada da explicação extensa de controlador, prefixo, sufixo e resolvedor de visualização desse trecho.
3. Depois da Figura 21: comparação explícita entre a implementação JSP e os campos exibidos, incluindo a disposição das linhas e a aplicação do Bootstrap.

## Campos demonstrados

Nome, Sobrenome, E-mail, Senha, CEP, Rua, Bairro, Cidade, Estado, Número e Complemento.

## Resultado descrito no relatório

O formulário foi apresentado com Nome e Sobrenome na primeira linha; E-mail e Senha na segunda; CEP e Rua na terceira; Bairro e Cidade na quarta; Estado, Número e Complemento na última, além do botão Cadastrar. O texto conecta a implementação da Figura 20 à execução e ao resultado da Figura 21.

O escopo permanece a construção e apresentação da interface. Não houve implementação de persistência ou processamento do cadastro no servidor. ViaCEP e validação com jQuery pertencem à Atividade 4.

## Documento preparado

O PDF revisado contém 31 páginas físicas. A Figura 21 permanece na página numerada 20. O sumário indica Atividade 4 na página 20, conclusão na 28 e referências na 30. A leitura textual confirmou a inserção dos três blocos; a legibilidade das imagens no PDF deve ser conferida no leitor de PDF.

## Situação

Revisão preparada e conferida quanto ao conteúdo textual. Reenvio ao portal e resultado de uma nova avaliação ainda não confirmados. Os códigos e o histórico anteriores permanecem preservados no registro principal e nos commits.
