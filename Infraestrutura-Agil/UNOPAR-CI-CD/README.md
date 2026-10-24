# Infraestrutura Ágil — Integração Contínua com GitLab e Docker

Laboratório acadêmico do curso de Engenharia de Software, documentado por Weslley Ribeiro. O objetivo foi configurar e monitorar um pipeline de integração contínua, construir e publicar uma imagem Docker e executar programas Python com notificações condicionais em Shell.

## Estado do trabalho

- Pipeline de sucesso executado e aprovado.
- Relatório final elaborado com introdução, métodos, resultados, conclusão e referências; entrega ao professor informada pelo autor em 24/10/2026.
- Este diretório é o registro documental no GitHub. A execução ocorreu no GitLab, não no GitHub Actions.
- PDF, Word e capturas não estão incluídos neste commit; consulte o inventário de evidências.

## Recursos da execução

- Projeto: https://gitlab.com/Weslley-Ribeiro/unopar_ci_cd
- Branch: main
- Commit: c3373f5830bb4dee1b829a596ca55fd4f3ba1257
- Mensagem: Configura pipeline de integracao continua da atividade
- Pipeline aprovado: https://gitlab.com/Weslley-Ribeiro/unopar_ci_cd/-/pipelines/2983624730
- Imagem publicada: weslleyribeiro01/unopar-ci-cd:c3373f58

A disponibilidade dos links e da imagem depende das permissões e da conservação dos recursos externos.

## Fluxo implementado

1. pre-build / build-docker: consulta o serviço Docker, verifica as variáveis de autenticação, autentica no Docker Hub, constrói a imagem e publica a tag associada ao commit.
2. build / build-project: utiliza a imagem publicada e executa python3 plot_simples_grafico.py.
3. notificacao / notificacao-sucesso: executa relogio.py e notificacaoSucesso.sh quando as etapas anteriores passam.
4. notificacao / notificacao-falhas: utiliza python:3.12-slim e executa relogio.py e notificacaoFalha.sh quando ocorre falha anterior.

## Arquivos do projeto original

| Arquivo | Função |
| --- | --- |
| .gitlab-ci.yml | Define etapas, tarefas e condições de execução |
| Dockerfile | Parte de Ubuntu e instala Python 3 e pip |
| plot_simples_grafico.py | Exibe a sequência [4, 3, 2, 2, 5] e um gráfico em caracteres |
| relogio.py | Exibe data e hora do ambiente Python |
| notificacaoSucesso.sh | Imprime Sucesso |
| notificacaoFalha.sh | Imprime Falha |

A configuração YAML usada está arquivada em configuracao/. Os demais arquivos permanecem no projeto GitLab; este registro não é um espelho integral do código.

## Resultados observados

| Tarefa | Job | Resultado |
| --- | --- | --- |
| build-docker | 17433017645 | Aprovada; duração de 1 min 27 s |
| build-project | 17433017646 | Aprovada; duração de 23 s |
| notificacao-sucesso | 17433017647 | Aprovada; duração de 19 s |
| notificacao-falhas | 17433017648 | Ignorada pela condição on_failure |

O pipeline foi apresentado com duração de 2 min 10 s. A imagem foi enviada ao Docker Hub, o gráfico apareceu no log e a notificação de sucesso exibiu horário e mensagem. Não houve implantação em produção, validação funcional automatizada ou envio de notificação por e-mail.

## Limitações

O cenário de falha controlada não foi executado. A configuração de on_failure existe, mas não equivale à validação prática desse caminho. O bloqueio de identidade da primeira tentativa também não foi uma falha de aplicação. Nenhum resultado deve ser apresentado como teste de todos os cenários ou como aprovação acadêmica pelo professor.

## Navegação

- [Histórico e reprodução](docs/HISTORICO-E-REPRODUCAO.md)
- [Inventário de evidências](docs/EVIDENCIAS.md)
- [Configuração utilizada](configuracao/gitlab-ci.executado.yml)

## Referências

- Docker: https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/
- GitLab: https://docs.gitlab.com/ci/

Documentações consultadas em 24/10/2026.
