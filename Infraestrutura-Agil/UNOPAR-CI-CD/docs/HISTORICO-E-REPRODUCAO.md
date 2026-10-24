# Histórico técnico e orientações para reprodução

## Histórico da atividade

1. Organização do projeto UNOPAR_CI_CD e dos arquivos Docker, Python, Shell e YAML.
2. Definição das etapas pre-build, build e notificacao e uso de tag por CI_COMMIT_SHORT_SHA.
3. Uso de DOCKERHUB_USERNAME e DOCKERHUB_TOKEN para autenticação, sem valores no YAML.
4. Envio do commit c3373f58 à main em 23/10/2026.
5. A primeira tentativa, pipeline 2983605787, apresentou falha, etiqueta de YAML inválido, zero tarefas e aviso de verificação adicional de identidade. Não houve mensagem que demonstrasse um erro específico de sintaxe.
6. Nova execução manual, pipeline 2983624730, iniciou quatro tarefas e concluiu o cenário de sucesso. O aviso deixou de bloquear essa execução; não foi documentado qual método de verificação foi concluído.
7. build-docker construiu e publicou a imagem. O aviso de ausência do Git durante o build não impediu o sucesso do job.
8. build-project executou o gráfico em caracteres.
9. notificacao-sucesso executou o relógio e imprimiu Sucesso; notificacao-falhas foi ignorada.
10. Organização de quatro capturas, elaboração e revisão do relatório, atualização do sumário e referências.
11. A versão final do relatório ficou com 13 páginas após remover uma página quase vazia ao encurtar o último parágrafo dos métodos. A entrega foi informada pelo autor em 24/10/2026.

## Reprodução futura

Estas orientações documentam o ambiente utilizado; não garantem que novas execuções terão o mesmo resultado.

1. Obter os arquivos do projeto original no GitLab e conferir a versão desejada.
2. Manter Dockerfile, programas Python e scripts Shell no contexto do projeto.
3. Usar o conteúdo de configuracao/gitlab-ci.executado.yml como .gitlab-ci.yml na raiz do projeto GitLab. A cópia documental neste GitHub não executa o pipeline.
4. Configurar DOCKERHUB_USERNAME e DOCKERHUB_TOKEN nas variáveis de CI/CD, com permissões adequadas ao repositório de destino. Nunca inserir os valores no código, em capturas ou no relatório.
5. Alterar APP_IMAGE para um repositório Docker Hub sob controle do responsável pela reprodução, caso não seja o mesmo autor. A configuração arquivada preserva o nome histórico.
6. Disponibilizar runner compatível com Docker-in-Docker e compartilhamento dos certificados TLS, conforme a infraestrutura adotada. O laboratório utilizou runner hospedado do GitLab.
7. Resolver eventuais exigências de identidade ou permissões apresentadas pela plataforma.
8. Executar o pipeline na branch pretendida e acompanhar cada job.
9. Conferir a publicação da tag, o gráfico no log, a mensagem Sucesso e o estado final.

## Comandos presentes no fluxo

```sh
docker info
printf '%s' "$DOCKERHUB_TOKEN" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin
docker build --pull -t "$APP_IMAGE:$CI_COMMIT_SHORT_SHA" .
docker push "$APP_IMAGE:$CI_COMMIT_SHORT_SHA"
python3 plot_simples_grafico.py
python3 relogio.py
sh notificacaoSucesso.sh
```

## Cuidados e melhorias possíveis

- FROM ubuntu não fixa uma versão; novas construções podem usar uma base diferente. Não modificar retrospectivamente o relato do ambiente executado.
- Conservar credenciais fora do repositório e revisar imagens e logs antes de publicá-los.
- O horário do log foi apresentado em UTC; diferenças com o horário local não representam, por si só, erro.
- Um teste controlado do caminho on_failure pode ser realizado futuramente em branch separada, sem registrar sua realização antes de obter evidências.
- Fixar versões e adicionar testes são melhorias futuras, não entregas já executadas neste laboratório.

## Escopo documental

Este registro prioriza a memória técnica para futuras atualizações do portfólio. Não contém tokens, matrícula acadêmica, dados de cobrança, telefone ou códigos de verificação. O relatório original contém identificação acadêmica e deve ser revisado antes de eventual publicação pública.
