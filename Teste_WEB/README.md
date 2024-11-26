# Plano de Teste - WEB (UI)
***[E-COMMERCE SAUCE DEMO](https://www.saucedemo.com/)***

*versão do documento: 1.0*

## 1. Objetivo:
Este artefato descreve o plano de teste contra o site https://www.saucedemo.com. 
Contido neste trabalho, os principais fluxos e cenários de teste como veremos a seguir.


## 2. Escopo dos Testes:
- Plataforma: Web
- Site: https://www.saucedemo.com
- Ambiente: Produção
- Versão: Não identificada
- 
## 3. Considerações iniciais:

## 4. Credênciais de Identificação dos Usuários para acesso ao portal utilizados nos testes:
1. `standard_user` - Usuário normal para uso.
2. `locked_out_user` - Usuário com acesso bloqueado.
3. `problem_user` - Usuário com algum problema.
4. `performance_glitch_user` - Usuário que simula problema de performance no Sistema.
5. `error_user` - Usuário com algum problema.
6. `visual_user` - Usuário que gera problema visual no Sistema.

## 5. Casos de Teste - 1.3.1.2 Resultados dos testes executados

### 5.1 Login com Diferentes Tipos de Usuários Disponíveis

#### 5.1.1 Cenário de Teste: 1.2.1 Login com diferentes tipos de usuários disponíveis

**Pré-Condição:** Ter acesso às credenciais de Identificação de todos os Usuário (cada um com suas características para simulação).

##### Caso de Teste CT-01

**Descrição do teste passo a passo:**
1. Verificar se realiza Login no Sistema:
   - Acessar site
   - Inserir o nome do Usuário no campo "Username"
   - Inserir a senha do Usuário no campo "Password"
   - Clicar no botão "Login"

**Resultado esperado:**
1. O Sistema deve responde em no máximo 3 segundos
2. Sistema deve permitir o login
3. Ir para URL https://www.saucedemo.com/inventory.html
4. Exibir o texto "Swag Labs" no título da página

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-01_LDTUD-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-01.mp4 | - | - |
| CT-01_LDTUD-02 | Username "locked_out_user" / Password: "secret_sauce" | Não logou | OK | Usário deveria mesmo ser bloqueado e exibiu mensagem coerente para Usuário na tela de login | CT-01_LDTUD-02.mp4 | - | - |
| CT-01_LDTUD-03 | Username "problem_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-03.mp4 | - | - |
| CT-01_LDTUD-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demorou próximo de 5 seg. para responder, dessa forma não atendento o que foi espec. de 3 segundos. | NOK, Melhoria | (Melhoria) Poderia inserir função de "Loading..." enquanto realiza login, sem falar correção da causa raiz da demora atual claro. | CT-01_LDTUD-04.mp4 | Baixa | Média |
| CT-01_LDTUD-05 | Username "error_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-05.mp4 | - | - |
| CT-01_LDTUD-06 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-06.mp4 | - | - |
| CT-01_LDTUD-07 | Username "standard_user" / Password: "1234" - (Senha Errada) | Exibiu mensagem de erro informando "Epic sadface: Username and password do not match any user in this service". | Melhoria | (Melhoria) (Usabilidade) Considero uma Melhoria a questão do texto não ser exibido por completo no campo destinado para tal.<br>(Melhoria) (Usabilidade) Poderia ter opção de visualizar/ocultar caracteres da senha.<br>(Melhoria) (Usabilidade) Sistema poderia ter opção "Esqueci a senha".<br>(Melhoria) (Usabilidade) (Risco) Poderia ter pelo menos funcação de captcha e/ou Autenticação com 2 fatores. | CT-01_LDTUD-07.mp4<br>CT-01_LDTUD-07.png | Baixa | Média |

### 5.2 Ordenação e Filtragem de Produtos

#### 5.2.1 Cenário de Teste: 1.2.2 Ordenação e Filtragem de Produtos

**Pré-Condição:** Estar logado e na página principal de listagem de produtos.

##### Caso de Teste CT-02

**Descrição do teste:**
1. Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por nome do produto:
   - Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente
   - Escolher a 2ª opção "Name (Z to A)"

**Resultado esperado:**
1. O Sistema deve responde a ordenação em no máximo 2 segundos
2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o nome de cada produto

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-02_OFP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-02_OFP-01.mp4 | - | - |
| CT-02_OFP-02 | Username "locked_out_user" / Password: "secret_sauce" | Usuário não atende pré-condições de uso, bloqueado. | - | - | - | - | - |
| CT-02_OFP-03 | Username "problem_user" / Password: "secret_sauce" | Sistema não realiza ordenção de nenhum tipo. | NOK | - | CT-02_OFP-03.mp4 | Média | Média |
| CT-02_OFP-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demora mais que 2 seg para realizar ordenação. | NOK, Melhoria | (Melhoria) Poderia inserir função de "Loading..." enquanto realiza ordenação dos produtos em tela, sem falar correção da causa raiz da demora atual claro. | CT-02_OFP-04.mp4 | Baixa | Média |
| CT-02_OFP-05 | Username "error_user" / Password: "secret_sauce" | Sistema não realiza ordenão de nenhum tipo. | NOK | Exibe aviso de problema e que já foi relatado | CT-02_OFP-05.mp4 | Média | Média |
| CT-02_OFP-06 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | Existem problemas de layout a ser tratado em outro CT | CT-02_OFP-06.mp4 | - | - |

##### Caso de Teste CT-02.01

**Descrição do teste:**
1. Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por preço do produto:
   - Entrar na página de exibição dos produtos
   - Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente
   - Escolher a 4ª opção "Price (high to low)"

**Resultado esperado:**
1. O Sistema deve responde a ordenação em no máximo 2 segundos
2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o valor de cada produto

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-02.01_OFP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-02.01_OFP-01.mp4 | - | - |
| CT-02.01_OFP-02 | Username "problem_user" / Password: "secret_sauce" | Sistema não realiza ordenção de nenhum tipo. | NOK | - | CT-02.01_OFP-02.mp4 | Média | Média |
| CT-02.01_OFP-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demora mais que 2 seg para realizar ordenação. | NOK | Tendo em vista regra que idealizei de responder < de 2 seg para criar uma regra de performance (no dia a dia deve ter), assim considero NOK para investigarem causa raiz. | CT-02.01_OFP-03.mp4 | Baixa | Média |
| CT-02.01_OFP-04 | Username "error_user" / Password: "secret_sauce" | Sistema não realiza ordenão de nenhum tipo. | NOK | Exibe aviso de problema e que já foi relatado | CT-02.01_OFP-04.mp4 | Média | Média |
| CT-02.01_OFP-05 | Username "visual_user" / Password: "secret_sauce" | Sistema exibe novos valores dos produtos e não ordena corretamente que é o foco do teste. | NOK | Foi identificado p/ esse Usuário que o valor dos prod são alterados e a cada solicitação de ordenação os valor mudam. | CT-02.01_OFP-05.mp4 | Alta | Alto |

# 5.3 Fluxo Completo de Compra

## 5.3.1 Cenário de Teste 1.2.3 Fluxo Completo de Compra (do carrinho até finalização)

### Pré-Condição: 
Ter acesso ao Sistema.

### Caso de Teste

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-03 | Verificar funcionamento do fluxo completo de compra - Selecionando um produto pela tela principal:<br>1. Entrar na página de exibição dos produtos.<br>2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado.<br>3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página.<br>4. Na página do carrinho, verificar nome do produto, a descrição dos detalhes do produto e preço.<br>5. Clicar no botão "Checkout".<br>6. Preencher as informações de checkout na página "First Name", "Last Name" e "Zip/Postal Code" e clicar no botão "Continue".<br>7. Na página de resumo, verificar os detalhes do pedido, incluindo quantidade, o nome, descrição e preço do produto, bem como o total da compra.<br>8. Clicar no botão "Finish".<br>9. Clicar no botão "Back Home". | 1. Carrinho deve estar vazio.<br>2. Carrinho deve exibir qtde de produto.<br>3/4. Deve exibir detalhe do produto.<br>5. Deve redirecionar para nova página para inserir dados de entrega.<br>6. Os dados deve vir em branco possibilitando insersão nos 3 campos. Todos campos obrigatórios e qdo tentar avançar sem preencher deve exibir msg informativa do campo vazio para devido preenchimento.<br>7. Deve haver consistências do nome, descrição e valor do produto, bem como as totalização do valor.<br>8. O sistema deve ter acatado a ordem de compra dos produtos confirmados exibindo uma mensagem de conclusão da compra "THANK YOU FOR YOUR ORDER" e um botão "Back Home".<br>9. Em clicando em "Back Home" Sistema deve retornar à página principal dos produtos. |

### Execuções de Teste

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-03_FCC-01 | Username "standard_user" / Password: "secret_sauce", preenchendo os 3 campos obrigatório de entrega. | Resultado Obtido igual ao Resultado esperado | OK | - | CT-03_FCC_01.mp4 | - | - |
| CT-03_FCC-02 | Username "standard_user" / Password: "secret_sauce", sem preencher os campos obrigatório de entrega. | Resultado Obtido igual ao Resultado esperado | OK | Fiz esse teste adicional para ver o capo Fisrt Name e Zip/State Code como obrigatório, Ok | CT-03_FCC_02.mp4 | - | - |
| CT-03_FCC-03 | Username "problem_user" / Password: "secret_sauce" | Ao inserir valor para "Last Name", exibe no campo "First Name". | NOK | - | CT-03_FCC_03.mp4 | Alta | Alto |
| CT-03_FCC-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | Apesar da lentidão resultado final Ok | CT-03_FCC_04.mp4 | - | - |
| CT-03_FCC-05 | Username "error_user" / Password: "secret_sauce" | Ao inserir valor para "Last Name", nãõ registra insersão de nenhum valor. | NOK | Problema semelhante ao CT-04_FCC_03, mas este não insere o valor no campo First Name. | CT-03_FCC_05.mp4 | Alta | Alto |
| CT-03_FCC-06 | Username "visual_user" / Password: "secret_sauce" | Apresenta problema de layout significativo ícone do carrinho e botão de "Checkout" deslocado. | NOK | - | CT-03_FCC_06.mp4 | Média | Médio |

## 5.3.2 Cenário de Teste 1.2.3 Fluxo Completo de Compra (sem selecionar produto)

### Pré-Condição: 
Ter acesso ao Sistema.

### Caso de Teste

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-03.01 | Verificar funcionamento do fluxo completo de compra - Sem selecionar nenhum produto:<br>1. Entrar na página de exibição dos produtos.<br>2. Certificasse que o carrinho está vazio, se não tive remova os produtos até que fique sem nenhum.<br>3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página.<br>4. Na página do carrinho, observe e certificasse que não exibe produto algum.<br>5. Clicar no botão "Checkout". | 1. Ao  tentar executar o passo 5 click no btn "Checkout" o Sistema deveria validar a situação e não deixar avançar.<br>2. Poderia exibir uma mensagem informando que o carrinho está vazio e bloquear avançar no fluxo. |

### Execuções de Teste

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-03.01_FCC-01 | Username "standard_user" / Password: "secret_sauce" | O Sistema não impediu de avançar no fluxo da compra mesmo não tendo produto no carrinho | NOK | - | CT-03.01_FCC-01.mp4 | Alta | Alto |

## 5.4 Cenário de Teste 1.2.4 Remoção de Itens do Carrinho

### Pré-Condição: 
Ter acesso ao Sistema.

### Caso de Teste

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-04 | Verificar a funcionalidade de remover produtos do Carrinho - pela página principal:<br>1. Entrar na página de exibição dos produtos.<br>2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado.<br>3. Após o botão mudar o texto de "Add to cart", clicar no botão que agora deve ter o texto "Remove".<br>4. Adicionar um produto ao carrinho novamente.<br>5. Clicar no ícone do Carrinho.<br>6. Clicar no btn "remove". | 1. Quando executado o passo 2, o Sistema deve exibir um contador sobre o ícone do carrinho localizado na parte superior à direita da página, sinalizando que o carrinho tem a quantidade de produto exibido.<br>2. Após execução do passo 3 e 6, o Sistema deve remover o contador sobre o ícone do carrinho, sinalizando que o carrinho está vazio. |

### Execuções de Teste

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-04_RIC-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-04_RIC-01.mp4 | - | - |
| CT-04_RIC-02 | Username "problem_user" / Password: "secret_sauce" | 1. Para o produto "Sauce Labs Bike Light" não foi possível remover pela tela principal, somente clicando em "Remove" dentro do Carrinho.<br>2. O Nome do produto "Test.allTehThings() T-Shirt (Red)" contém erro.<br>3. Imagens dos produtos contém erro exibindo um cachorro.<br>4. Não foi possível add no carrinho o produto "Test.allTehThings() T-Shirt (Red)"<br>5. Ao entrar em detalhe do produto "Sauce Labs Fleece Jacket" o nome muda para "Item NOT FOUD". | NOk | - | CT-04_RIC-02.mp4 | Alta | Alto |
| CT-04_RIC-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | Apesar da lentidão resultado final Ok | CT-04_RIC-03.mp4 | - | - |
| CT-04_RIC-04 | Username "error_user" / Password: "secret_sauce" | 1. Para o produto "Sauce Labs Backpack" não foi possível remover pela tela principal, nem pela de detalhe do produto, somente clicando em "Remove" dentro do Carrinho.<br>2. Para o "Test.allTehThings() T-Shirt (Red)" não foi possível add no carrinho pela tela principal. | NOK | - | CT-04_RIC-04.mp4 | Alta | Alto |
| CT-04_RIC-05 | Username "visual_user" / Password: "secret_sauce" | 1. Para o produto "Test.allTehThings() T-Shirt (Red)" o btn "Add to cart" e por conseq. "Remove" são exibidos desalinhados for ado frame com info do produto. | NOK | - | CT-04_RIC-05.mp4 | Alta | Alto |


## 5.5 Cenário de Teste 1.2.5 Navegação entre Páginas

### Pré-Condição: 
Ter acesso ao Sistema.

### Casos de Teste

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-05.01 | 1. Entrar na página de exibição dos produtos | 1. O Sistema deve exibir uma página com a lista dos produtos.<br>2. Deve exibir um título na parte superior da página deve ter o texto "Swag Labs" entre o botão de menu (à esquerda) e botão do carrinho (à direita).<br>3. Mudar a URL para: https://www.saucedemo.com/inventory.html |
| CT-05.02 | 2. Clicar sobre foto do produto com nome, p.exe.: Sauce Labs Backpack | 4. O sistema de redirecionar para outra página contendo um botão abaixo do botão menu e com texto "Back to products", imagem ampliada do produto selecionado, nome do produto, descrição do produto, valor do produto, um botão na parte inferior com texto "Add to cart", título da página na parte superior não muda e exibe também o carrinho à direita.<br>5. Mudar a URL para: https://www.saucedemo.com/inventory-item.html?id=4 |
| CT-05.03 | 3. Clicar no botão "Add to cart" | 6. O Sistema deve exibir um contador sobre o ícone do carrinho localizado na parte superior à direita da página, sinalizando que o carrinho tem a quantidade de produto exibido e mudar o texto do botão clicado para "Remove" com borda cor vermelha (não peguei o RGB por falta de tempo) |
| CT-05.04 | 4. Clicar no ícone do carrinho de compras localizado no canto superior direito da página | 7. O Sistema de redirecionar para outra página onde mantem o menu à esquerda, título ao centro e Carrinho à direita. Exibe a Quantidade de cada produto selecionado, nome do produto, descrição do produto, preço e botão "Remove".<br>8. Deve exibir ainda 2 botões: "Continue Shopping" e "Checkout" na cor Verde, ambos na parte inferior da tela.<br>9. Mudar a URL para https://www.saucedemo.com/cart.html |
| CT-05.05 | 5. Clicar no botão "Checkout" | 10. O Sistema de redirecionar para outra página onde mantem o menu à esquerda, título ao centro e Carrinho à direita. Exibe a 3 campos para inserir: "First Name", "Last Name" e "Zip/Postal Code".<br>11. Exibe um texto abaixo do menu "Checkout: Your Information".<br>12. Deve exibir ainda 2 botões: "Cancel" e "Continue" na cor Verde, ambos na parte inferior da tela.<br>13. Mudar a URL para https://www.saucedemo.com/checkout-step-one.html |
| CT-05.06 | 6. Preencher as informações de checkout na página "First Name", "Last Name" e "Zip/Postal Code" e clicar no botão "Continue" | 14. O Sistema de redirecionar para outra página onde mantem o menu à esquerda, título ao centro e Carrinho à direita. Exibe a Quantidade de cada produto selecionado, nome do produto, descrição do produto, preço.<br>15. Exibe à direita informações sobre "Payment Information", "Shipping Information", "Price Total", valor "Tax" e "Total" geral.<br>16. Exibe um texto abaixo do menu "Checkout: Overview".<br>17. Deve exibir ainda 2 botões: "Cancel" e "Finish" na cor Verde, ambos na parte inferior da tela.<br>18. Mudar a URL para https://www.saucedemo.com/checkout-step-two.html |
| CT-05.07 | 7. Clicar no botão "Finish" | 19. O Sistema de redirecionar para outra página onde mantem o menu à esquerda, título ao centro e Carrinho à direita. Exibe msg confirmando a compra "Thank you for your order!", "Your order has been dispatched, and will arrive just as fast as the pony can get there!" e um icone de um visto em cor Verde.<br>20. Exibe um texto abaixo do menu "Checkout: Complete!".<br>21. Deve exibir ainda um botão "Back Home" na cor Verde, na parte inferior da tela.<br>22. Mudar a URL para https://www.saucedemo.com/checkout-complete.html |
| CT-05.08 | 8. Clicar no botão "Back Home" | 23. O Sistema deve retornar para a página principal exibindo os produtos.<br>24. Mudar a URL para: https://www.saucedemo.com/inventory.html |
| CT-05.09 | 9. Clicar no botão que abre o menu, localizado na parte superior da tela do lado esquerdo e Selecionar a opção "Logout" | 25. O Sistema deve realizar o logout, exibindo novamente a tela de Login.<br>26. Mudar a URL para: https://www.saucedemo.com/ |

### Execuções de Teste

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-05_NEP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | (Melhoria) Deixar os itens do menu visiveis ou pelo menos com opção de ocultar/exibir. (Usabilidade)<br>(Melhoria) Exibir em uma parte superior da tela, Caminho completo da aplicação para melhor entendimento onde se está navegando. | CT-05_NEP-01.mp4 | Baixa | Baixo |
| CT-05_NEP-02 | Username "problem_user" / Password: "secret_sauce" | Todas imagens comprometidas e ao clicar na foto do "Sauce Labs Backpack", na tela de detalhe exibe outro nome e foto do produto e também não é possível avançar pois não aceita add no carrinho. | NOK | - | CT-05_NEP-02.mp4 | Alta | Alto |

## 5.6 Cenário de Teste 1.2.6 Logout

### Pré-Condição: 
Ter acesso ao Sistema.

### Caso de Teste

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-06 | Verificar a funcionalidade de Logout:<br>1. Entrar na página de exibição dos produtos.<br>2. Clicar no botão que abre o menu, localizado na parte superior da tela do lado esquerdo.<br>3. Selecionar a opção "Logout" | Após executar o passo 3, o Sistema deve realizar o logout, exibindo novamente a tela de Login |

### Execuções de Teste

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-06_LO-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | Usando o site nese desafio, percebi que caso faça logout com produto no carrinho ao relogar os produtos estão lá. Não sei se isso é uma boa estratégia para 'vender' mais, ou não, por ter chance de confusão pelo Usuário ao relogar. | CT-06_LO-01 | - | - |
| CT-06_LO-02 | Username "problem_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-02 | - | - |
| CT-06_LO-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-03 | - | - |
| CT-06_LO-04 | Username "error_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-04 | - | - |
| CT-06_LO-05 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-05 | - | - |

## 5.7 Layout - Avaliação de Layout / Usabilidade

### Pré-Condição: 
Ter acesso ao Sistema.

### Avaliação de Layout

| Item | Descrição - Página - Avaliado: "Fluxo Completo de Compra" | Resultado esperado | standard_user | visual_user | Severidade (téc.) | Impacto (p/ Usuários) |
|------|----------------------------------------------------------|-------------------|--------------|-------------|------------------|----------------------|
| LU-01 | Página de exibição dos produtos | 1. O Sistema deve exibir uma página principal com a lista dos produtos | Ok | OK | - | - |
| LU-02 | Idem anterior | 1. Deve exibir na parte superior da página botão de menu (à esquerda), ao centro ter o texto "Swag Labs" e botão do carrinho (à direita) | Ok - (Melhoria) Poderia exibir o nome do Usuário logado | NOK - Ícone do Carrinho fora da posição correta | Baixa | Média |
| LU-03 | Idem anterior | 1. Logo abaixo do menu deve exibir texto fazendo menção a funcionalidade atual, nesse caso "Products", do lado oposto opção de ordenação dos produtos com valor padrão "Name (A to Z)" | Ok | OK | - | - |
| LU-04 | Idem anterior | 1. Na parte central da página exibir os produtos | Ok | OK | - | - |
| LU-05 | Idem anterior | 1. Cada produto deve conter: Imagem, Nome, descrição, valor e btn "Add to Card" | Ok - (Melhoria) Poderia exibir opção de inserir qtde do produto para vender mais de um | NOK - Problema com imagem do produto, texto do nome (1º) e descrição do produto e botão "Add to cart" desalinhado (último) | Média | Média |

# final do arq 3.0 pend 3.1 ...

























