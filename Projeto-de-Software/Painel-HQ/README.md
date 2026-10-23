# Painel HQ — Gestor de Coleção e Leituras

Painel HQ é uma proposta de aplicativo para organizar coleções de quadrinhos e acompanhar leituras pessoais. Este documento registra o planejamento inicial do projeto e poderá ser usado como base para uma implementação futura.

## Visão do produto

Permitir que o leitor organize seus quadrinhos com informações da edição nacional e acompanhe sua coleção, suas leituras e avaliações pessoais.

## Problema atendido

Leitores e colecionadores costumam dispersar informações sobre quadrinhos em cadernos, planilhas, fotos e aplicativos genéricos. O Painel HQ reunirá dados da coleção, da edição nacional, dos profissionais envolvidos e do acompanhamento de leitura em um único lugar.

## Escopo da primeira versão

A primeira versão deverá permitir:

- cadastrar coleções;
- cadastrar volumes vinculados às coleções;
- registrar dados da edição nacional, incluindo editora, publicação, impressão e reimpressão;
- associar imagens de capa;
- registrar roteiristas e desenhistas;
- controlar exemplares possuídos e desejados;
- acompanhar estado e progresso de leitura;
- registrar notas e comentários pessoais;
- pesquisar e filtrar quadrinhos;
- consultar um resumo da coleção e das leituras.

## Product Backlog

| Ordem | ID | História de usuário | Prioridade |
|---:|---|---|---|
| 1 | US01 | Como colecionador, quero cadastrar coleções para agrupar os volumes que acompanho. | Alta |
| 2 | US02 | Como colecionador, quero cadastrar volumes vinculados às coleções para identificar cada quadrinho. | Alta |
| 3 | US03 | Como colecionador, quero registrar dados da edição nacional para distinguir publicações e reimpressões. | Alta |
| 4 | US04 | Como colecionador, quero registrar os exemplares que possuo ou desejo adquirir para acompanhar minha coleção. | Alta |
| 5 | US05 | Como leitor, quero registrar o estado e o progresso de leitura para acompanhar o que estou lendo. | Alta |
| 6 | US06 | Como leitor, quero visualizar a capa do quadrinho para reconhecer os volumes com facilidade. | Média |
| 7 | US07 | Como leitor, quero associar roteiristas e desenhistas aos volumes para consultar os créditos das obras. | Média |
| 8 | US08 | Como leitor, quero atribuir notas e comentários aos quadrinhos para registrar minha experiência de leitura. | Média |
| 9 | US09 | Como usuário, quero pesquisar e filtrar os quadrinhos para localizar rapidamente os itens cadastrados. | Média |
| 10 | US10 | Como usuário, quero consultar um resumo da coleção e das leituras para acompanhar meus registros. | Baixa |

## Modelo de dados proposto

### Coleção

- id
- nome
- descrição
- quantidade_prevista_de_volumes
- criado_em
- atualizado_em

### Volume

- id
- colecao_id
- titulo
- numero_do_volume
- total_de_paginas
- capa_url
- criado_em
- atualizado_em

### EdicaoNacional

- id
- volume_id
- editora_nacional
- data_de_publicacao
- tipo_de_impressao: primeira_impressao, reimpressao ou nao_informado
- numero_da_impressao
- data_da_impressao

### Profissional

- id
- nome

### Credito

- id
- volume_id
- profissional_id
- funcao: roteirista ou desenhista

### Exemplar

- id
- volume_id
- situacao: possuo, desejo_adquirir ou nao_possuo
- estado_de_conservacao

### Leitura

- id
- volume_id
- estado: nao_iniciado, em_leitura, concluido ou pausado
- pagina_atual
- nota
- comentario
- atualizado_em

## Regras de negócio iniciais

- O nome da coleção é obrigatório.
- A quantidade prevista de volumes pode permanecer não informada para coleções em andamento.
- Um volume deve estar vinculado a uma coleção.
- Um volume pode ter vários roteiristas e desenhistas.
- Datas desconhecidas de publicação ou impressão podem ficar em branco.
- A situação do exemplar é independente do estado de leitura.
- A nota é opcional e varia de 0 a 5.
- A ausência de avaliação deve ser distinguida de uma nota igual a zero.
- A página atual não pode ser negativa nem maior que o total de páginas informado.

## Equipe fictícia da simulação acadêmica

Os nomes abaixo são fictícios e representam papéis em uma simulação de gerenciamento de projeto. Não correspondem a pessoas reais nem exigem criação de contas.

| Nome fictício | Papel | Responsabilidades |
|---|---|---|
| Ana Souza | Product Owner | Prioriza o backlog, representa o cliente e valida os critérios de aceitação |
| Bruno Lima | Desenvolvedor back-end | Modela dados, implementa regras de negócio e APIs |
| Carla Mendes | Desenvolvedora front-end | Constrói telas, formulários, listagens e filtros |
| Diego Alves | Analista de testes | Executa testes funcionais e verifica os critérios de aceitação |
| Weslley Ribeiro | Scrum Master | Acompanha o quadro, remove impedimentos e organiza as entregas |

No Trello, os responsáveis podem ser registrados na descrição de cada cartão ou por etiquetas de responsável. Não é necessário criar contas reais para os nomes fictícios.

## Quadro proposto

- Backlog
- A fazer
- Em desenvolvimento
- Em testes
- Concluído

## Roadmap futuro

Após a primeira versão, as seguintes evoluções poderão ser avaliadas:

- importação de metadados por ISBN, código de barras ou bases públicas;
- leitura de código de barras pela câmera;
- comparação de preços e integração com lojas;
- empréstimos e controle de localização física;
- avaliações públicas e rede social;
- recomendações personalizadas;
- exportação da coleção em CSV, PDF ou JSON;
- aplicativo móvel com acesso offline.

## Observação

Este repositório registra o planejamento acadêmico do Painel HQ. A implementação real ainda não foi iniciada; as histórias, regras e responsabilidades descritas aqui são propostas iniciais e poderão ser ajustadas durante o desenvolvimento.