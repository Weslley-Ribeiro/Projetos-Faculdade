# Painel HQ — Registro final do planejamento

Registro de 23/10/2026, complementar ao [README](README.md).

## Situação

Planejamento e relatório acadêmico concluídos e revisados nesta data. Envio ao portal e avaliação ainda não confirmados. O aplicativo não foi implementado; as posições dos cartões representam uma simulação, não desenvolvimento ou testes reais. Nenhum PDF, captura de tela ou dado acadêmico pessoal é publicado neste registro.

## Quadro e prazos simulados

Responsáveis fictícios registrados nas descrições, sem criação de contas. As datas são prazos previstos, não datas de realização.

| ID | Funcionalidade | Prioridade | Responsável fictício | Prazo | Etapa simulada |
|---|---|---|---|---|---|
| US01 | Cadastrar coleções | Alta | Bruno Lima | 25/10/2026 | Concluído |
| US02 | Cadastrar volumes | Alta | Carla Mendes | 26/10/2026 | Concluído |
| US03 | Registrar edição nacional | Alta | Bruno Lima | 27/10/2026 | Em testes |
| US04 | Controlar exemplares | Alta | Carla Mendes | 27/10/2026 | Em desenvolvimento |
| US05 | Acompanhar leitura | Alta | Bruno Lima | 28/10/2026 | Em desenvolvimento |
| US06 | Adicionar capa | Média | Carla Mendes | 28/10/2026 | A fazer |
| US07 | Registrar profissionais | Média | Bruno Lima | 29/10/2026 | A fazer |
| US08 | Avaliar quadrinhos | Média | Carla Mendes | 29/10/2026 | Backlog |
| US09 | Pesquisar e filtrar | Média | Carla Mendes | 30/10/2026 | Backlog |
| US10 | Consultar resumo pessoal | Baixa | Bruno Lima | 30/10/2026 | Backlog |

A ordem prioriza os cadastros básicos, depois identificação editorial, coleção pessoal e leitura. Capas e créditos enriquecem o catálogo; avaliações, pesquisa e resumo ampliam o uso após os registros iniciais. Os responsáveis principais não excluem colaboração entre interface, regras de negócio e testes.

## Critérios de aceitação registrados

### US01 — Cadastrar coleções
- Informar nome, descrição e quantidade prevista de volumes.
- Exigir nome.
- Aceitar quantidade total não informada.
- Exibir a coleção na listagem.

### US02 — Cadastrar volumes
- Informar título e número ou identificação do volume.
- Exigir vínculo com coleção existente.
- Permitir edição dos dados.
- Exibir o volume na coleção correspondente.

### US03 — Registrar edição nacional
- Informar editora nacional e data de publicação.
- Registrar primeira impressão ou reimpressão.
- Disponibilizar número e data da impressão, quando conhecidos.
- Aceitar datas desconhecidas em branco.

### US04 — Controlar exemplares
- Disponibilizar Possuo, Desejo adquirir e Não possuo.
- Permitir alteração dessa classificação.
- Disponibilizar conservação opcional.
- Manter situação da coleção independente da leitura.

### US05 — Acompanhar leitura
- Disponibilizar Não iniciado, Em leitura, Concluído e Pausado.
- Permitir alteração do estado.
- Registrar página atual e total de páginas.
- Impedir progresso negativo ou superior ao total informado.

### US06 — Adicionar capa
- Aceitar seleção de JPG ou PNG.
- Exibir capa no cadastro do volume.
- Permitir substituição e remoção.
- Usar imagem padrão na ausência de capa.

### US07 — Registrar profissionais
- Cadastrar nome do profissional.
- Associar ao volume como roteirista ou desenhista.
- Aceitar vários profissionais por função.
- Exibir créditos no detalhamento.

### US08 — Avaliar quadrinhos
- Permitir nota de 0 a 5.
- Escrever, editar e remover comentário pessoal.
- Manter avaliação opcional.
- Distinguir ausência de avaliação de nota zero.

### US09 — Pesquisar e filtrar
- Pesquisar por título ou coleção.
- Filtrar por editora, profissional, situação da coleção e estado de leitura.
- Informar ausência de resultados.
- Permitir limpar filtros.

### US10 — Consultar resumo pessoal
- Contar volumes cadastrados.
- Contar volumes marcados como Possuo.
- Contar volumes concluídos e em leitura.
- Atualizar totais conforme os registros.

## Relatório e evidências

Relatório final com 13 páginas físicas. Capa, folha de rosto e sumário sem numeração visível; introdução na página numerada 3. Métodos na 4, backlog completo na 6, resultados na 9, conclusão na 11 e referências na 12.

Estrutura: introdução; métodos com levantamento do cliente, priorização, quadro, responsáveis e prazos; resultados; conclusão; referências.

Duas evidências foram incorporadas ao relatório local:
1. Quadro completo com três cartões no Backlog, dois em A fazer, dois em desenvolvimento, um em testes e dois concluídos. O print foi recortado para ampliar as listas.
2. Cartão US05 com responsável fictício, prazo e critérios de aceitação.

Revisões finais: remoção dos números visíveis das páginas iniciais mediante desvinculação do rodapé da seção da introdução; tabela reunida em uma página; referências separadas; conferência do sumário e recorte da Figura 1.

## Continuidade para implementação real

O modelo de dados do README é uma proposta preliminar, não uma arquitetura aprovada. Antes de programar:
- Validar requisitos com leitores e colecionadores.
- Refinar a relação entre obra, volume, edição nacional, impressão e exemplar.
- Definir como exemplares e leituras se vinculam a usuários e como representar múltiplas cópias e reimpressões.
- Definir autenticação, privacidade, armazenamento e tratamento das imagens.
- Escolher tecnologias e arquitetura, ainda não decididas.
- Detalhar validações, acessibilidade, segurança e estratégia de testes.
- Manter cadastro manual como escopo inicial; integrações externas permanecem propostas futuras.

## Fontes utilizadas no relatório

- Atlassian: https://trello.com/en/guide/enterprise/trello-basics
- Schwaber e Sutherland, Guia do Scrum, novembro de 2020: https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-PortugueseBR-3.0.pdf

Data de acesso registrada no relatório: 23/10/2026.
