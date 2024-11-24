# Plano de Teste

***E-COMMERCE SAUCE DEMO***

*versão do documento: 1.0*

## 1. Objetivo:
Este artefato descreve o plano de teste contra o site https://www.saucedemo.com. 
Contido neste trabalho, os principais fluxos e cenários de teste como veremos a seguir.


## 2. Escopo dos Testes:
- Plataforma: Web
- URL: https://www.saucedemo.com
- Ambiente: Produção
- Versão: Não identificada

## 3. Credênciais de Identificação dos Usuários para acesso ao portal utilizados nos testes:
1. `standard_user` - Usuário normal para uso.
2. `locked_out_user` - Usuário com acesso bloqueado.
3. `problem_user` - Usuário com algum problema.
4. `performance_glitch_user` - Usuário que gera problema de performance no portal.
5. 'error_user' - Usuário com algum problema.
6. 'visual_user' - Usuário que gera problema de performance no portal.

## 4. Casos de Teste Geral

### 4.1 Teste de Login
| ID | Descrição | Usuário | Resultado Esperado |
|:--|:--|:--|:--|
| TL-01 | Login válido | standard_user | Acesso ao dashboard de produtos com titulo "Swag Labs" no topo página |
| TL-02 | Login usuário bloqueado | locked_out_user | Mensagem de erro de bloqueio |
| TL-03 | Login com usuário problem | problem_user | Verificar inconsistências na interface |

### 4.2 Teste de Produtos
| ID | Descrição | Ação | Resultado Esperado |
|:--|:--|:--|:--|
| PRD-01 | Ordenação por nome (A-Z) | Filtro de ordenação | Produtos em ordem alfabética crescente |
| PRD-02 | Ordenação por preço (baixo-alto) | Filtro de ordenação | Produtos do mais barato ao mais caro |

### 4.3 Fluxo de Compra
| ID | Descrição | Passos | Resultado Esperado |
|:--|:--|:--|:--|
| CPR-01 | Compra completa | Adicionar produto, carrinho, checkout | Finalização da compra com sucesso |
| CPR-02 | Remoção de item do carrinho | Adicionar e remover produto | Item removido corretamente |



## 6. Sugestões de Melhoria de UX/UI
- > As sugestões de melhorias que identifiquei, serão tratadas no documento xyz. ( - Adicionar feedback visual mais claro durante ações de compra / - Melhorar contraste de cores para acessibilidade / - Simplificar fluxo de checkout )

## 7. Bugs
- > Os bugs que identifiquei, serão tratados no documento xyz. ( - Lista de bugs será preenchida durante execução dos testes )







### 4.1 Teste de Login
| ID | Descrição | Usuário | Resultado Esperado | Resultado Obtido | Status | Versão |
|:--|:--|:--|:--|:--|:--|:--|
| TL-01 | Login válido | standard_user | Acesso ao dashboard de produtos com titulo "Swag Labs" no topo página | - | Não testado |-|
| TL-02 | Login usuário bloqueado | locked_out_user | Mensagem de erro de bloqueio | - | Não testado |-|
| TL-03 | Login com usuário problem | problem_user | Verificar inconsistências na interface | - | Não testado |-|

### 4.2 Teste de Produtos
| ID | Descrição | Ação | Resultado Esperado | Resultado Real | Status | Versão |
|:--|:--|:--|:--|:--|:--|:--|
| PRD-01 | Ordenação por nome (A-Z) | Filtro de ordenação | Produtos em ordem alfabética crescente | - | Não testado | -|
| PRD-02 | Ordenação por preço (baixo-alto) | Filtro de ordenação | Produtos do mais barato ao mais caro | - | Não testado | -|

### 4.3 Fluxo de Compra
| ID | Descrição | Passos | Resultado Esperado | Resultado Real | Status | Versão |
|:--|:--|:--|:--|:--|:--|:--|
| CPR-01 | Compra completa | Adicionar produto, carrinho, checkout | Finalização da compra com sucesso | - | Não testado | -|
| CPR-02 | Remoção de item do carrinho | Adicionar e remover produto | Item removido corretamente | - | Não testado | -|

## 9. Conclusão
Plano de testes preparado para cobertura abrangente do sistema.

**Data da Elaboração:** [Data Atual]
**Testador:** [Seu Nome]
