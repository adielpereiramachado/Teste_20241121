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

## 5. Casos de Teste - "1.3.1.2 Resultados dos testes executados"

### 5.1 Item: "1.2.1 Login com diferentes tipos de usuários disponíveis"

**Pré-Condição:** Ter acesso às credenciais de Identificação de todos os Usuário (cada um com suas características para simulação).

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-01 | Verificar se realiza Login no Sistema:<br>1. Acessar site<br>2. Inserir o nome do Usuário no campo "Username"<br>3. Inserir a senha do Usuário no campo "Password"<br>4. Clicar no botão "Login"| . Login com sucesso:<br>1. O Sistema deve responde em no máximo 3 segundos<br>2. Sistema deve permitir o login<br>3. Ir para URL https://www.saucedemo.com/inventory.html<br>4. Exibir o texto "Swag Labs" no título da página.<br><br> . Login falha credencial:<br>1. Sistema não deve permitir Login.<br>2. Deve exibir mensagem "Epic sadface: Username and password do not match any user in this service".<br><br> . Login Usuário bloqueado:<br>1 Sistema não deve permitir Login.<br>2. Deve exibir mensagem "Epic sadface: Sorry, this user has been locked out.".<br>Obs. O termo "Epic sadface:" não tenho certeza se está certo, então sugeriria revisão.|

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-01_LDTUD-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-01.mp4 | - | - |
| CT-01_LDTUD-02 | Username "locked_out_user" / Password: "secret_sauce" | Não logou | OK | Usário deveria mesmo ser bloqueado e exibiu mensagem coerente para Usuário na tela de login | CT-01_LDTUD-02.mp4 | - | - |
| CT-01_LDTUD-03 | Username "problem_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-03.mp4 | - | - |
| CT-01_LDTUD-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demorou próximo de 5 seg. para responder, dessa forma não atendento o que foi espec. de 3 segundos. | NOK, Melhoria | (Melhoria) Poderia inserir função de "Loading..." enquanto realiza login, sem falar correção da causa raiz da demora atual claro. | CT-01_LDTUD-04.mp4 | Baixa | Média |
| CT-01_LDTUD-05 | Username "error_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-05.mp4 | - | - |
| CT-01_LDTUD-06 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | - | CT-01_LDTUD-06.mp4 | - | - |
| CT-01_LDTUD-07 | Username "standard_user" / Password: "1234" - (Senha Errada) | Exibiu mensagem de erro informando "Epic sadface: Username and password do not match any user in this service". | Melhoria | (Melhoria) (Usabilidade) Considero uma Melhoria a questão do texto não ser exibido por completo no campo destinado para tal.<br>(Melhoria) (Usabilidade) Poderia ter opção de visualizar/ocultar caracteres da senha.<br>(Melhoria) (Usabilidade) Sistema poderia ter opção "Esqueci a senha".<br>(Melhoria) (Usabilidade) (Risco) Poderia ter pelo menos funcação de captcha e/ou Autenticação com 2 fatores. | CT-01_LDTUD-07.mp4<br>CT-01_LDTUD-07.png | Baixa | Médio |

### 5.2 Item: "1.2.2 Ordenação e Filtragem de Produtos"

**Pré-Condição:** Estar logado e na página principal de listagem de produtos.

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
|CT-02|Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por nome do produto:<br>1. Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente.<br>2. Escolher a 2ª opção "Name (Z to A)".|1. O Sistema deve responde a ordenação em no máximo 2 segundos. (Obs.: Criei essa regra de tempo para simular um requisito de performance e ser visível quando usado Usuário que tem lentidão)<br>2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o nome de cada produto.|


| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-02_OFP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-02_OFP-01.mp4 | - | - |
| CT-02_OFP-02 | Username "locked_out_user" / Password: "secret_sauce" | Usuário não atende pré-condições de uso, bloqueado. | - | - | - | - | - |
| CT-02_OFP-03 | Username "problem_user" / Password: "secret_sauce" | Sistema não realiza ordenção de nenhum tipo. | NOK | - | CT-02_OFP-03.mp4 | Média | Médio |
| CT-02_OFP-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demora mais que 2 seg para realizar ordenação. | NOK, Melhoria | (Melhoria) Poderia inserir função de "Loading..." enquanto realiza ordenação dos produtos em tela, sem falar correção da causa raiz da demora atual claro. | CT-02_OFP-04.mp4 | Baixa | Médio |
| CT-02_OFP-05 | Username "error_user" / Password: "secret_sauce" | Sistema não realiza ordenão de nenhum tipo. | NOK | Exibe aviso de problema e que já foi relatado | CT-02_OFP-05.mp4 | Média | Médio |
| CT-02_OFP-06 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | Existem problemas de layout a ser tratado em outro CT | CT-02_OFP-06.mp4 | - | - |

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
|CT-02.01|Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por preço do produto:<br>1. Entrar na página de exibição dos produtos.<br>2. Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente<br>3. Escolher a 4ª opção "Price (high to low)".|1. O Sistema deve responde a ordenação em no máximo 2 segundos.<br>2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o valor de cada produto.

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-02.01_OFP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-02.01_OFP-01.mp4 | - | - |
| CT-02.01_OFP-02 | Username "problem_user" / Password: "secret_sauce" | Sistema não realiza ordenção de nenhum tipo. | NOK | - | CT-02.01_OFP-02.mp4 | Média | Média |
| CT-02.01_OFP-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Sistema demora mais que 2 seg para realizar ordenação. | NOK | Tendo em vista regra que idealizei de responder < de 2 seg para criar uma regra de performance (no dia a dia deve ter), assim considero NOK para investigarem causa raiz. | CT-02.01_OFP-03.mp4 | Baixa | Média |
| CT-02.01_OFP-04 | Username "error_user" / Password: "secret_sauce" | Sistema não realiza ordenão de nenhum tipo. | NOK | Exibe aviso de problema e que já foi relatado | CT-02.01_OFP-04.mp4 | Média | Média |
| CT-02.01_OFP-05 | Username "visual_user" / Password: "secret_sauce" | Sistema exibe novos valores dos produtos e não ordena corretamente que é o foco do teste. | NOK | Foi identificado p/ esse Usuário que o valor dos prod são alterados e a cada solicitação de ordenação os valor mudam. | CT-02.01_OFP-05.mp4 | Alta | Alto |

### 5.3 Item: "1.2.3 Fluxo completo de compra (do carrinho até finalização)" 
#### 5.3.1 Selecionando e tendo pelo menos um produto no Carrinho

**Pré-Condição:** Ter acesso ao Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-03 | Verificar funcionamento do fluxo completo de compra - Selecionando um produto pela tela principal:<br>1. Entrar na página de exibição dos produtos.<br>2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado.<br>3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página.<br>4. Na página do carrinho, verificar nome do produto, a descrição dos detalhes do produto e preço.<br>5. Clicar no botão "Checkout".<br>6. Preencher as informações de checkout na página "First Name", "Last Name" e "Zip/Postal Code" e clicar no botão "Continue".<br>7. Na página de resumo, verificar os detalhes do pedido, incluindo quantidade, o nome, descrição e preço do produto, bem como o total da compra.<br>8. Clicar no botão "Finish".<br>9. Clicar no botão "Back Home". | 1. Carrinho deve estar vazio.<br>2. Carrinho deve exibir qtde de produto.<br>3/4. Deve exibir detalhe do produto.<br>5. Deve redirecionar para nova página para inserir dados de entrega.<br>6. Os dados deve vir em branco possibilitando insersão nos 3 campos. Todos campos obrigatórios e qdo tentar avançar sem preencher deve exibir msg informativa do campo vazio para devido preenchimento.<br>7. Deve haver consistências do nome, descrição e valor do produto, bem como as totalização do valor.<br>8. O sistema deve ter acatado a ordem de compra dos produtos confirmados exibindo uma mensagem de conclusão da compra "THANK YOU FOR YOUR ORDER" e um botão "Back Home".<br>9. Em clicando em "Back Home" Sistema deve retornar à página principal dos produtos. |

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-03_FCC-01 | Username "standard_user" / Password: "secret_sauce", preenchendo os 3 campos obrigatório de entrega. | Resultado Obtido igual ao Resultado esperado | OK | - | CT-03_FCC_01.mp4 | - | - |
| CT-03_FCC-02 | Username "standard_user" / Password: "secret_sauce", sem preencher os campos obrigatório de entrega. | Resultado Obtido igual ao Resultado esperado | OK | Fiz esse teste adicional para ver o capo Fisrt Name e Zip/State Code como obrigatório, Ok | CT-03_FCC_02.mp4 | - | - |
| CT-03_FCC-03 | Username "problem_user" / Password: "secret_sauce" | Ao inserir valor para "Last Name", exibe no campo "First Name". | NOK | - | CT-03_FCC_03.mp4 | Alta | Alto |
| CT-03_FCC-04 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | Apesar da lentidão resultado final Ok | CT-03_FCC_04.mp4 | - | - |
| CT-03_FCC-05 | Username "error_user" / Password: "secret_sauce" | Ao inserir valor para "Last Name", nãõ registra insersão de nenhum valor. | NOK | Problema semelhante ao CT-04_FCC_03, mas este não insere o valor no campo First Name. | CT-03_FCC_05.mp4 | Alta | Alto |
| CT-03_FCC-06 | Username "visual_user" / Password: "secret_sauce" | Apresenta problema de layout significativo ícone do carrinho e botão de "Checkout" deslocado. | NOK | - | CT-03_FCC_06.mp4 | Média | Médio |


#### 5.3.1 Não selecionando nenhum produto com Carrinho vazio

**Pré-Condição:** Ter acesso ao Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-03.01 | Verificar funcionamento do fluxo completo de compra - Sem selecionar nenhum produto:<br>1. Entrar na página de exibição dos produtos.<br>2. Certificasse que o carrinho está vazio, se não tive remova os produtos até que fique sem nenhum.<br>3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página.<br>4. Na página do carrinho, observe e certificasse que não exibe produto algum.<br>5. Clicar no botão "Checkout". | 1. Ao  tentar executar o passo 5 click no btn "Checkout" o Sistema deveria validar a situação e não deixar avançar.<br>2. Poderia exibir uma mensagem informando que o carrinho está vazio e bloquear avançar no fluxo. |

| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-03.01_FCC-01 | Username "standard_user" / Password: "secret_sauce" | O Sistema não impediu de avançar no fluxo da compra mesmo não tendo produto no carrinho | NOK | - | CT-03.01_FCC-01.mp4 | Alta | Alto |

### 5.4 Item: "1.2.4 Remoção de itens do carrinho"

***Pré-Condição:*** Ter acesso ao Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-04 | Verificar a funcionalidade de remover produtos do Carrinho - pela página principal:<br>1. Entrar na página de exibição dos produtos.<br>2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado.<br>3. Após o botão mudar o texto de "Add to cart", clicar no botão que agora deve ter o texto "Remove".<br>4. Adicionar um produto ao carrinho novamente.<br>5. Clicar no ícone do Carrinho.<br>6. Clicar no btn "remove". | 1. Quando executado o passo 2, o Sistema deve exibir um contador sobre o ícone do carrinho localizado na parte superior à direita da página, sinalizando que o carrinho tem a quantidade de produto exibido.<br>2. Após execução do passo 3 e 6, o Sistema deve remover o contador sobre o ícone do carrinho, sinalizando que o carrinho está vazio. |


| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-04_RIC-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-04_RIC-01.mp4 | - | - |
| CT-04_RIC-02 | Username "problem_user" / Password: "secret_sauce" | 1. Para o produto "Sauce Labs Bike Light" não foi possível remover pela tela principal, somente clicando em "Remove" dentro do Carrinho.<br>2. O Nome do produto "Test.allTehThings() T-Shirt (Red)" contém erro.<br>3. Imagens dos produtos contém erro exibindo um cachorro.<br>4. Não foi possível add no carrinho o produto "Test.allTehThings() T-Shirt (Red)"<br>5. Ao entrar em detalhe do produto "Sauce Labs Fleece Jacket" o nome muda para "Item NOT FOUD". | NOk | - | CT-04_RIC-02.mp4 | Alta | Alto |
| CT-04_RIC-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | Ok | Apesar da lentidão resultado final Ok | CT-04_RIC-03.mp4 | - | - |
| CT-04_RIC-04 | Username "error_user" / Password: "secret_sauce" | 1. Para o produto "Sauce Labs Backpack" não foi possível remover pela tela principal, nem pela de detalhe do produto, somente clicando em "Remove" dentro do Carrinho.<br>2. Para o "Test.allTehThings() T-Shirt (Red)" não foi possível add no carrinho pela tela principal. | NOK | - | CT-04_RIC-04.mp4 | Alta | Alto |
| CT-04_RIC-05 | Username "visual_user" / Password: "secret_sauce" | 1. Para o produto "Test.allTehThings() T-Shirt (Red)" o btn "Add to cart" e por conseq. "Remove" são exibidos desalinhados for ado frame com info do produto. | NOK | - | CT-04_RIC-05.mp4 | Alta | Alto |

### 5.5 Item: "1.2.5 Navegação entre páginas"
**Pré-Condição:** Ter acesso ao Sistema.

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


| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-05_NEP-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | (Melhoria) Deixar os itens do menu visiveis ou pelo menos com opção de ocultar/exibir. (Usabilidade)<br>(Melhoria) Exibir em uma parte superior da tela, Caminho completo da aplicação para melhor entendimento onde se está navegando. | CT-05_NEP-01.mp4 | Baixa | Baixo |
| CT-05_NEP-02 | Username "problem_user" / Password: "secret_sauce" | Todas imagens comprometidas e ao clicar na foto do "Sauce Labs Backpack", na tela de detalhe exibe outro nome e foto do produto e também não é possível avançar pois não aceita add no carrinho. | NOK | - | CT-05_NEP-02.mp4 | Alta | Alto |




### 5.6 Item: "1.2.6 Logout"
**Pré-Condição:** Ter acesso ao Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado |
|--------------|-------------------|-------------------|
| CT-06 | Verificar a funcionalidade de Logout:<br>1. Entrar na página de exibição dos produtos.<br>2. Clicar no botão que abre o menu, localizado na parte superior da tela do lado esquerdo.<br>3. Selecionar a opção "Logout" | Após executar o passo 3, o Sistema deve realizar o logout, exibindo novamente a tela de Login |


| ID de Execução | Credencial | Resultado Obtido | Status | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|------------|-----------------|--------|------------|-----------|-------------------|----------------------|
| CT-06_LO-01 | Username "standard_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | Usando o site nese desafio, percebi que caso faça logout com produto no carrinho ao relogar os produtos estão lá. Não sei se isso é uma boa estratégia para 'vender' mais, ou não, por ter chance de confusão pelo Usuário ao relogar. | CT-06_LO-01 | - | - |
| CT-06_LO-02 | Username "problem_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-02 | - | - |
| CT-06_LO-03 | Username "performance_glitch_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-03 | - | - |
| CT-06_LO-04 | Username "error_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-04 | - | - |
| CT-06_LO-05 | Username "visual_user" / Password: "secret_sauce" | Resultado Obtido igual ao Resultado esperado | OK | - | CT-06_LO-05 | - | - |




### 5.7 Item: Layout - Avaliação de Layout / Usabilidade

**Pré-Condição:** Ter acesso ao Sistema.

| Item | Descrição - Página - Avaliado: "Fluxo Completo de Compra" | Resultado esperado | standard_user | visual_user | Severidade (téc.) | Impacto (p/ Usuários) |
|------|----------------------------------------------------------|-------------------|--------------|-------------|------------------|----------------------|
| LU-01 | Página de exibição dos produtos | 1. O Sistema deve exibir uma página principal com a lista dos produtos | Ok | OK | - | - |
| LU-02 | Idem anterior | 1. Deve exibir na parte superior da página botão de menu (à esquerda), ao centro ter o texto "Swag Labs" e botão do carrinho (à direita) | Ok - (Melhoria) Poderia exibir o nome do Usuário logado | NOK - Ícone do Carrinho fora da posição correta | Baixa | Média |
| LU-03 | Idem anterior | 1. Logo abaixo do menu deve exibir texto fazendo menção a funcionalidade atual, nesse caso "Products", do lado oposto opção de ordenação dos produtos com valor padrão "Name (A to Z)" | Ok | OK | - | - |
| LU-04 | Idem anterior | 1. Na parte central da página exibir os produtos | Ok | OK | - | - |
| LU-05 | Idem anterior | 1. Cada produto deve conter: Imagem, Nome, descrição, valor e btn "Add to Card" | Ok - (Melhoria) Poderia exibir opção de inserir qtde do produto para vender mais de um | NOK - Problema com imagem do produto, texto do nome (1º) e descrição do produto e botão "Add to cart" desalinhado (último) | Média | Média |
| LU-06 | Idem anterior | 1. Na parte inferior, ícone com links para redes sociais e texto de propriedade do Sistema. | Ok | Ok | - | - |
| LU-07 | 2. Entrando no detalhe do produto, seja clicando na foto do produto ou no nome do produto, p.exe.: Sauce Labs Backpack (depois pode escolher outro se for o caso) | O sistema deve redirecionar para outra página contendo:  1. Menu à esquerda da parte superior. | Ok | OK | - | - |
| LU-08 | Idem anterior | 1. Título da página no centro da parte superior. | Ok | OK | - | - |
| LU-09 | Idem anterior | 1. Carrinho à direita da parte superior. | Ok | NOK - Íconde do Carrinho fora da possição correta. LU-09_visual-user.png | Baixa | Média |
| LU-10 | Idem anterior | 1. Um botão abaixo do botão menu e com texto "Back to products" | Ok | Ok | - | - |
| LU-11 | Idem anterior | 1. Imagem ampliada do produto selecionado. | Ok | Ok | - | - |
| LU-12 | Idem anterior | 1. Nome do produto. | Ok | Ok | - | - |
| LU-13 | Idem anterior | 1. Descrição do produto. | Ok | NOK - Problema com texto da descrição do produto. LU-13_visual-user.png | Média | Média |
| LU-14 | Idem anterior | 1. Valor do produto | Ok | NOK - Para o produto "Sauce Labs Bike Light" na tela principal exibe um valor e ao entrar na tela de detalhe exibe outro. LU-14_visual-user.mp4 | Alta | Alto |
| LU-15 | Idem anterior | 1. Botão abaixo do valor com texto "Add to cart" | Ok - (Melhoria) Iidem LU-05 | OK | - | - |
| LU-16 |  3. Clicando no botão "Add to cart" e depois no ícone do Carrinho, vai para nova página do Carrinho. | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho adiciona contador indicando que tem produto | Ok | NOK - Carrinho continua desalihado. LU-23_visual-user.png | Baixa | Média |
| LU-17 | Idem anterior | 1. Indicação de quantidade de produto | OK - (Melhoria) Iidem LU-05 | OK | - | - |
| LU-18 | Idem anterior | 1. Nome do produto. | Ok | OK | - | - |
| LU-19 | Idem anterior | 1. Descrição do produto. | Ok | NOK - Problema com texto da descrição do produto. LU-23_visual-user.png | Baixa | Média |
| LU-20 | Idem anterior | 1. Valor do produto | Ok | NOK -Valor mudou novamente. LU-23_visual-user.png | Alta | Alto |
| LU-21 | Idem anterior | 1. Botão lado do valor com texto "Remove" | Ok | OK | - | - |
| LU-22 | Idem anterior | 1. Na parte inferior abaixo do valor, deve exibir btn "Continue Shopping". | Ok | OK | - | - |
| LU-23 | Idem anterior | 1. Na parte inferior abaixo do btn "Remove", deve exibir btn "Chekout". | Ok | NOK - Botão "Checkout" em local incorreto, está´exibindo acima do Carrinho. LU-23_visual-user.png | Baixa | Média |
| LU-24 | 4. Clicando no botão "Checkout" vai para outra página "Your information" | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho. | Ok | NOK - Carrinho continua desalihado. LU-24_visual-user.png" | Baixa | Média |
| LU-25 | Idem anterior | 1. Deve exibir 3 imput para inserir "First Name", "Last Name" e "Zip/State Code" | Ok | OK | - | - |
| LU-26 | Idem anterior | 1. Na parte inferior à esquerda, deve exibir btn "Cancel". | Ok | Ok | - | - |
| LU-27 | Idem anterior | 1. Na parte inferior à direita, deve exibir btn "Continue". | Ok | Ok | - | - |
| LU-28 | 5. Clicando no botão "Checkout" vai para página "Overview" | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho. | Ok | NOk - Carrinho continua desalihado. LU-28_visual-user.png" | Baixa | Média |
| LU-29 | Idem anterior | 1. Mesmo quadro com Quantidade, Nome, Descrição e valor do produto. | Ok | NOK - .Problema com texto da descrição do produto. LU-29_visual-user.png | Baixa | Média |
| LU-30 | Idem anterior | 1. Informações sobre valores totais e taxas | Ok | OK | - | - |
| LU-31 | Idem anterior | 1. Na parte inferior à esquerda, deve exibir btn "Cancel". | Ok | OK | - | - |
| LU-32 | Idem anterior | 1. Na parte inferior à direita, deve exibir btn "Finish". | Ok | OK | - | - |
| LU-33 | 6. Clicando no botão "Finish", vai para tela "Complete!" | Nessa tela deve mante os 3 componentes:  1. Menu,  2. Título,  3. Carrinho que nesse momento o contador deve ser retirado (zerado). | Ok | NOK - Carrinho continua desalihado, mas sem o contador indicando que corretamente está vazio. LU-33_visual-user.png | Baixa | Média |
| LU-34 | Idem anterior | 1. Deve exibir msg confirmando a compra "Thank you for your order!", " Your order has been dispatched, and will arrive just as fast as the pony can get there!" e um icone de um visto em cor Verde. 2. Exibe um texto abaixo do menu "Checkout: Complete!". 3. Deve exibir ainda um botão "Back Home" na cor Verde, na parte inferior da tela. | OK - (Melhoria) A palavra/termo Ponei, não considero a mais indica, pois Usuários podem não gostardo tom de brincadeira, etc. Sugestão de rever frase deixando mais formal. LU-34_standart-user.png | OK - (Melhoria) A palavra/termo Ponei, não considero a mais indica, pois Usuários podem não gostardo tom de brincadeira, etc. Sugestão de rever frase deixando mais formal. LU-34_visual-user.png | - | - |
| LU-35 | 7. Clicar no botão "Back Home". | 1. O Sistema deve retornar para a página principal exibindo os produtos. 2. Mudar a URL para: https://www.saucedemo.com/inventory.html | Ok | NOK - Exibe os mesmos problemas já relatados em LU-02 e LU-05 | Baixa | Média |
| LU-36 | 8. Clicar no botão que abre o menu, localizado na parte superior da tela do lado esquerdo e  Selecionar a opção "Logout". | 1. O Sistema deve realizar o logout, exibindo novamente a tela de Login. 2. Mudar a URL para: https://www.saucedemo.com/ | Ok | Ok | - | - |



### 5.8 Item: ista de Melhorias: "1.3.1.3 Sugestões de melhorias de UX/UI"


| ID de Execução | Descrição do teste passo a passo | Credencial utilizada no Teste | Resultado esperado | Resultado Obtido | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários) |
|---------------|----------------------------------|-------------------------------|--------------------|-----------------|--------------|-----------|--------------------|----------------------|
| CT-01_LDTUD-04 | Verificar se realiza Login no Sistema:<br>1. Acessar site.<br>2. Inserir o nome do Usuário no campo "Username"<br>3. Inserir a senha do Usuário no campo "Password"<br>4. Clicar no botão "Login". | Username "performance_glitch_user" / Password: "secret_sauce" | 1. O Sistema deve responde em no máximo 3 segundos.<br>2. Sistema deve permitir o login.<br>3. Ir para URL https://www.saucedemo.com/inventory.html.<br>4. Exibir o texto "Swag Labs" no título da página. | Sistema demorou próximo de 5 seg. para responder, dessa forma não atendendo o que foi especificado de 3 segundos. | **(Melhoria)** Poderia inserir função de "Loading..." enquanto realiza login, sem falar correção da causa raiz da demora atual claro. | CT-01_LDTUD-04.mp4 | Baixa | Média |
| CT-01_LDTUD-07 | Idem anterior | Username "standard_user" / Password: "1234" - (Senha Errada) | Exibir mensagem ao Usuário que não corresponde a usuário/senha validos | Exibiu mensagem de erro informando "Epic sadface: Username and password do not match any user in this service". No entanto a mensagem quase fica impossível de ler devido tamanho do texto | **(Melhoria) (Usabilidade)** Considero uma Melhoria a questão do texto não ser exibido por completo no campo destinado para tal.<br>**(Melhoria) (Usabilidade)** Poderia ter opção de visualizar/ocultar caracteres da senha.<br>**(Melhoria) (Usabilidade)** Sistema poderia ter opção "Esqueci a senha".<br>**(Melhoria) (Usabilidade) (Risco)** Poderia ter pelo menos função de captcha e/ou Autenticação com 2 fatores. | CT-01_LDTUD-07.mp4<br>CT-01_LDTUD-07.png | Baixa | Média |
| CT-02_OFP-04 | Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por nome do produto:<br>1. Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente.<br>2. Escolher a 2ª opção "Name (Z to A)". | Username "performance_glitch_user" / Password: "secret_sauce" | 1. O Sistema deve responde a ordenação em no máximo 2 segundos.<br>2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o nome de cada produto. | Sistema demora mais que 2 seg para realizar ordenação. | **(Melhoria)** Poderia inserir função de "Loading..." enquanto realiza ordenação dos produtos em tela, sem falar correção da causa raiz da demora atual claro. | CT-02_OFP-04.mp4 | Baixa | Média |
| CT-05_NEP-01 | Navegação entre as Páginas durante Fluxo Completo de Compra<br>Avaliação do Menu do Sistema<br>*Obs. Fiz um ultra resumo, para mais detalhes ver Casos de teste 5.5 Navegação Entre Páginas | Username "standard_user" / Password: "secret_sauce" | Conseguir finalizar compra<br>*Obs. Fiz um ultra resumo, para mais detalhes ver Casos de teste 5.5 Navegação Entre Páginas | **(Melhoria)** Deixar os itens do menu visíveis ou pelo menos com opção de ocultar/exibir. (Usabilidade)<br>**(Melhoria)** Exibir em uma parte superior da tela, Caminho completo da aplicação para melhor entendimento onde se está navegando. | **(Melhoria)** Deixar os itens do menu visíveis ou pelo menos com opção de ocultar/exibir. (Usabilidade)<br>**(Melhoria)** Exibir em uma parte superior da tela, Caminho completo da aplicação para melhor entendimento onde se está navegando. | CT-05_NEP-01.mp4 | Baixa | Baixo |
| R7-01 | Verificar comportamento do Sistema quando alterar ID de produto pela URL<br>1. Entrar na página de exibição dos produtos.<br>2. Clicar na foto de um produto.<br>3. Alterar o id do produto na URL para um inexistente e teclar "Enter".<br>4. Click no botão "Add to cart".<br>5. Clicar no ícone do carrinho de compras localizado no canto superior direito da página. | Username "standard_user" / Password: "secret_sauce" | Fazer alguma validação e não deixar adicionar ao carrinho um produto inexistente. | Após executar o passo 5, o Sistema tenta trocar de página mas não exibe mais nada. Saindo e retornando ainda consta o 'produto' no carrinho.<br>Tendo em vista a característica de não retirar o produto do carrinho ao fazer "Logout", fica impossível finalizar novas compras. Para sair dessa situação, deve-se entrar novamente no Sistema, selecionar um produto e alterar para o mesmo ID do produto inexistente, dessa forma o sistema vai exibir a foto de um cachorro como da primeira vez e basta clicar no botão 'Remove'. | Após executar o passo 3, o Sistema deveria confirmar se existe mesmo o ID passado e só exibir a tela com novas informações caso existisse o ID alterado e passo na URL passado.<br>Ou alguma ideia melhor que essa, o que não pode é continuar assim. | R7-01.mp4 | Alta | Alto |
| R7-02 | Verificar comportamento do Sistema quando alterado nome do Usuário em configurações de Cookies<br>Verificar comportamento quando alterado id do produto<br>1. Entrar na página de exibição dos produtos.<br>2. Abrir opção do desenvolvedor no Browser.<br>3. Ir na opção "Application" > "Storage" > Cookies campo "Value".<br>4. Trocar de standard_user para visual_user. | Username "standard_user" / Password: "secret_sauce" | Não deixar vulnerável a troca do Usuário pelo Cookies | Após executar o passo 4 e voltando para a página do sistema, ele reage com as características do user inserido, neste caso apresentando problemas visuais. | Sistema não deveria permitir uma "troca" de usuário sem as devidas validações.<br>**(Melhoria)** Poderia ter validação de Captcha e/ou autenticação de 2 fatores para maior segurança. | R7-02.mp4 | Alta | Alto |

## Resumo Executivo de Melhorias

### Principais Pontos de Melhoria:
- Implementar função de "Loading" durante processos lentos
- Melhorar usabilidade das mensagens de erro
- Adicionar opções de segurança como autenticação de dois fatores
- Melhorar tempo de resposta do sistema
- Validar entrada de dados e IDs de produtos
- Aprimorar visualização do menu e navegação



### 5.9 Item: "1.3.1.4 Lista de bugs encontrados (se houver)"


| ID de Execução | Descrição do teste passo a passo | Credêncial utilizada no Teste | Resultado esperado | Resultado Obtido | Observação | Evidência | Severidade (téc.) | Impacto (p/ Usuários)
|------------|-------------------|---------|-------------------|-----------------|------------|------------|---------|---------|
| CT-01_LDTUD-04 | Verificar se realiza Login no Sistema: 1. Acessar site. 2. Inserir o nome do Usuário no campo "Username" 3. Inserir a senha do Usuário no campo "Password" 4. Clicar no botão "Login". | Username "performance_glitch_user" / Password: "secret_sauce" | 1. O Sistema deve responde em no máximo 3 segundos. 2. Sistema deve permitir o login. 3. Ir para URL https://www.saucedemo.com/inventory.html. 4. Exibir o texto "Swag Labs" no título da página. | Sistema demorou próximo de 5 seg. para responder, dessa forma não atendento o que foi espec. de 3 segundos. | NOK - Criei essa 'regra' de tempo para simular alguma exigênia que ocorre realemten no dia a dia, por isso o NOK. (Melhoria) Poderia inserir função de "Loading..." enquanto realiza login, sem falar correção da causa raiz da demora atual claro. | CT-01_LDTUD-04.mp4 | Baixa | Médio |
| CT-02_OFP-03 | Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por nome do produto: 1. Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente. 2. Escolher a 2ª opção "Name (Z to A)". | Username "problem_user"     / Password: "secret_sauce" | 1. O Sistema deve responde a ordenação em no máximo 2 segundos. 2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o nome de cada produto. | Sistema não realiza ordenção de nenhum tipo. | - | CT-02_OFP-03.mp4 | Média | Médio |
| CT-02_OFP-04 | Idem anterior | Username "performance_glitch_user" / Password: "secret_sauce" | Idem anterior | Sistema demora mais que 2 seg para realizar ordenação. | (Melhoria) Poderia inserir função de "Loading..." enquanto realiza ordenação dos produtos em tela, sem falar correção da causa raiz da demora atual claro. | CT-02_OFP-04.mp4 | Baixa | Médio |
| CT-02_OFP-05 | Idem anterior | Username "error_user"         / Password: "secret_sauce" | Idem anterior | Sistema não realiza ordenão de nenhum tipo. | Exibe aviso de problema e que já´foi relatado | CT-02_OFP-05.mp4 | Média | Médio |
| CT-02.01_OFP-02 | Verificar a funcionalidade da opção de ordenação e filtragem de produtos, selecionando ordenação por preço do produto: 1. Entrar na página de exibição dos produtos. 2. Clicar no componente de ordenação e filtragem, representado pela caixa de seleção exibindo a ordenação corrente. 3. Escolher a 4ª opção "Price (high to low)". | Username "problem_user"     / Password: "secret_sauce" | 1. O Sistema deve responde a ordenação em no máximo 2 segundos. 2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o valor de cada produto. | Sistema não realiza ordenção de nenhum tipo. | - | CT-02.01_OFP-02.mp4 | Média | Médio |
| CT-02.01_OFP-03 | Idem anterior | Username "performance_glitch_user" / Password: "secret_sauce" | Idem anterior | Sistema demora mais que 2 seg para realizar ordenação. | Tendo em vista regra que idealizei de responder < de 2 seg para criar uma regra de performance (no dia a dia deve ter), assim considero NOK para investigarem causa raiz. | CT-02.01_OFP-03.mp4 | Baixa | Médio |
| CT-02.01_OFP-04 | Idem anterior | Username "error_user"         / Password: "secret_sauce" | Idem anterior | Sistema não realiza ordenão de nenhum tipo. | Exibe aviso de problema e que já´foi relatado | CT-02.01_OFP-04.mp4 | Média | Médio |
| CT-02.01_OFP-05 | Idem anterior | Username "visual_user"       / Password: "secret_sauce" | 1. O Sistema deve responde a ordenação em no máximo 2 segundos. 2. Sistema deve ordenar os produtos de forma decrescente, utilizando como base para ordenação o valor de cada produto. | Sistema exibe novos valores dos produtos e não ordena corretamente que é o foco do teste. | Foi identificado p/ esse Usuárioque o valor dos prod são alterados e a cada solicitação de ordenação os valor mudam. | CT-02.01_OFP-05.mp4 | Alta | Alto |
| CT-03_FCC-03 | Verificar funcionamento do fluxo completo de compra - Selecionando um produto pela tela principal: 1. Entrar na página de exibição dos produtos. 2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado. 3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página. 4. Na página do carrinho, verificar nome do produto, a descrição dos detalhes do produto e preço. 5. Clicar no botão "Checkout". 6. Preencher as informações de checkout na página "First Name", "Last Name" e "Zip/Postal Code" e clicar no botão "Continue". 7. Na página de resumo, verificar os detalhes do pedido, incluindo quantidade, o nome, descrição e preço do produto, bem como o total da compra. 8. Clicar no botão "Finish". 9. Clicar no botão "Back Home". | Username "problem_user"     / Password: "secret_sauce" | 1. Carrinho deve estar vazio. 2. Carrinho deve exibir qtde de produto. 3/4. Deve exibir detalhe do produto. 5. Deve redirecionar para nova página para inserir dados de entrega. 6. Os dados deve vir em branco possibilitando insersão nos 3 campos. Todos campos obrigatórios e qdo tentar avançar sem preencher deve exibir msg informativa do campo vazio para devido preenchimento. 7. Deve haver consistências do nome, descrição e valor do produto, bem como as totalização do valor. 8. O sistema deve ter acatado a ordem de compra dos produtos confirmados exibindo uma mensagem de conclusão da compra "THANK YOU FOR YOUR ORDER" e um botão "Back Home". 9. Em clicando em "Back Home" Sistema deve retornar à página principal dos produtos. | Ao inserir valor para "Last Name" , exibe no campo "First Name". | - | CT-03_FCC_03.mp4 | Alta | Alto |
| CT-03_FCC-05 | Idem anterior | Username "error_user"         / Password: "secret_sauce" | Idem anterior | Ao inserir valor para "Last Name" , nãõ registra insersão de nenhum valor. | Problema semelhante ao CT-04_FCC_03, mas este não insere o valor no campo First Name. | CT-03_FCC_05.mp4 | Alta | Alto |
| CT-03_FCC-06 | Idem anterior | Username "visual_user"       / Password: "secret_sauce" | Idem anterior | Apresenta problema de layout significativo ícone do carrinho e botão de "Checkout" deslocado. | - | CT-03_FCC_06.mp4 | Média | Médio |
| CT-03.01_FCC-01 | Verificar funcionamento do fluxo completo de compra - Sem selecionar nenhum produto: 1. Entrar na página de exibição dos produtos. 2. Certificasse que o carrinho está vazio, se não tive remova os produtos até que fique sem nenhum. 3. Clicar no ícone do carrinho de compras localizado no canto superior direito da página. 4. Na página do carrinho, observe e certificasse que não exibe produto algum. 5. Clicar no botão "Checkout". | Username"standard_user"     / Password: "secret_sauce" | 1. Ao  tentar executar o passo 5 click no btn "Checkout" o Sistema deveria validar a situação e não deixar avançar. 2. Poderia exibir uma mensagem informando que o carrinho está vazio e bloquear avançar no fluxo. | O Sistema não impediu de avançar no fluxo da compra mesmo não tendo produto no carrinho | - | CT-03.01_FCC-01.mp4 | Alta | Alto |
| CT-04_RIC-02 | Verificar a funcionalidade de remover produtos do Carrinho - pela página principal: 1. Entrar na página de exibição dos produtos. 2. Adicionar um produto ao carrinho clicando no botão "Add to cart" correspondente ao produto desejado. 3. Após o botão mudar o texto de "Add to cart", clicar no botão que agora deve ter o texto "Remove". 4. Adicionar um produto ao carrinho novamente. 5. Clicar no ícone do Carrinho. 6. Clicar no btn "remove". | Username "problem_user"     / Password: "secret_sauce" | 1. Quando executado o passo 2, o Sistema deve exibir um contador sobre o ícone do carrinho localizado na parte superior à direita da página, sinalizando que o carrinho tem a quantidade de produto exibido. 2. Após execução do passo 3 e 6, o Sistema deve remover o contador sobre o ícone do carrinho, sinalizando que o carrinho está vazio. | 1. Para o produto "Sauce Labs Bike Light" não foi possível remover pela tela principal, somente clicando em "Remove" dentro do Carrinho. 2. o Nome do produto "Test.allTehThings() T-Shirt (Red)" contem erro. 3. Imagens dos produtos contém erro exibindo um cachorro. 4. Não foi possível add no carrinho o produto "Test.allTehThings() T-Shirt (Red)" 5. Ao entrar em detalhe do produto " Sauce Labs Fleece Jacket" o nome muda para "Item NOT FOUD". | - | CT-04_RIC-02.mp4 | Alta | Alto |
| CT-04_RIC-04 | Idem anterior | Username "error_user"         / Password: "secret_sauce" | Idem anterior | 1. Para o produto "Sauce Labs Backpack" não foi possível remover pela tela principal, nem pela de detalhe do produto, somente clicando em "Remove" dentro do Carrinho. 2. Para o "Test.allTehThings() T-Shirt (Red)" não foi possível add no carrinho pela tela principal.  | - | CT-04_RIC-04.mp4 | Alta | Alto |
| CT-04_RIC-05 | Idem anterior | Username "visual_user"       / Password: "secret_sauce" | Idem anterior | 1. Para o produto ""Test.allTehThings() T-Shirt (Red)" o btn "Add to cart" e por conseq. "Remove" são exibidos desalinhados for ado frame com info do produto. | - | CT-04_RIC-05.mp4 | Alta | Alto |
| CT-05_NEP-02 | Navegação entre as Páginas durante Fluxo Completo de Compra *Obs. Fiz um ultra resumo, para mais detalhes ver Casos de teste 5.5 Navegação Entre Páginas  | Username "problem_user"     / Password: "secret_sauce" | Conseguir filnalizar compra  *Obs. Fiz um ultra resumo, para mais detalhes ver Casos de teste 5.5 Navegação Entre Páginas  | Todas imagens comprometidas e ao clicar na foto do "Sauce Labs Backpack" , na tela de detalhe exibe outro nome e foto do produto e também não é possível avançar pois não aceita add no carrinho. | - | CT-05_NEP-02.mp4 | Alta | Alto |
| LU-02 | Verificação de Layout durante Fluxo Completo de Compra. Tela: Principal de exibição dos produtos | Username "visual_user" / Password: "secret_sauce" | 1. Deve exibir na parte superior da página botão de menu (à esquerda), ao centro ter o texto "Swag Labs" e botão do carrinho (à direita). | NOK - Íconde do Carrinho fora da possição correta. LU-02_visual-user.png | - | LU-02_visual-user.png | Baixa | Médio |
| LU-05 | Idem anterior | Idem anterior | 1. Cada produto deve conter: Imagem, Nome, descrição, valor e btn "Add to Card". | NOK - Problema com imagem do produo, texto do nome  (1º)e descrição do produto e botão "Add to cart" desalinhado (último). LU-05_visual-user.png |  | LU-05_visual-user.png | Média | Médio |
| LU-09 | 2. Entrando no detalhe do produto, seja clicando na foto do produto ou no nome do produto, p.exe.: Sauce Labs Backpack (depois pode escolher outro se for o caso) | Idem anterior | 1. Carrinho à direita da parte superior. | NOK - Íconde do Carrinho fora da possição correta. LU-09_visual-user.png | - | LU-09_visual-user.png | Baixa | Médio |
| LU-13 | Idem anterior | Idem anterior | 1. Exibir Descrição completa  do produto. | NOK - Problema com texto da descrição do produto. LU-13_visual-user.png | - | LU-13_visual-user.png | Média | Médio |
| LU-14 | Idem anterior | Idem anterior | 1. Exibir Valor do produto | NOK - Para o produto "Sauce Labs Bike Light" na tela principal exibe um valor e ao entrar na tela de detalhe exibe outro. LU-14_visual-user.mp4 | - | LU-14_visual-user.mp4 | Alta | Alto |
| LU-16 |  3. Clicando no botão "Add to cart" e depois no ícone do Carrinho, vai para nova página do Carrinho. | Idem anterior | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho adiciona contador indicando que tem produto | NOK - Carrinho continua desalihado. LU-23_visual-user.png | - | LU-23_visual-user.png | Baixa | Médio |
| LU-19 | Idem anterior | Idem anterior | 1. Exibir Descrição completa  do produto. | NOK - Problema com texto da descrição do produto. LU-23_visual-user.png | - | LU-23_visual-user.png | Baixa | Médio |
| LU-20 | Idem anterior | Idem anterior | 1. Exibir Valor do produto | NOK -Valor mudou novamente. LU-23_visual-user.png | - | LU-23_visual-user.png | Alta | Alto |
| LU-23 | Idem anterior | Idem anterior | 1. Na parte inferior abaixo do btn "Remove", deve exibir btn "Chekout". | NOK - Botão "Checkout" em local incorreto, está´exibindo acima do Carrinho. LU-23_visual-user.png | - | LU-23_visual-user.png | Baixa | Médio |
| LU-24 | 4. Clicando no botão "Checkout" vai para outra página "Your information" | Idem anterior | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho. | NOK - Carrinho continua desalihado. LU-24_visual-user.png" | - | LU-24_visual-user.png" | Baixa | Médio |
| LU-28 | 5. Clicando no botão "Checkout" vai para página "Overview" | Idem anterior | Nessa tela deve mante os 3 componentes: 1. Menu,  2. Título. 3. Carrinho. | NOk - Carrinho continua desalihado. LU-28_visual-user.png" | - | LU-28_visual-user.png" | Baixa | Médio |
| LU-29 | Idem anterior | Idem anterior | 1. Mesmo quadro com Quantidade, Nome, Descrição e valor do produto. | NOK - .Problema com texto da descrição do produto. LU-29_visual-user.png | - | LU-29_visual-user.png | Baixa | Médio |
| LU-33 | 6. Clicando no botão "Finish", vai para tela "Complete!" | Idem anterior | Nessa tela deve mante os 3 componentes:  1. Menu,  2. Título,  3. Carrinho que nesse momento o contador deve ser retirado (zerado). | NOK - Carrinho continua desalihado, mas sem o contador indicando que corretamente está vazio. LU-33_visual-user.png | - | LU-33_visual-user.png | Baixa | Médio |
| LU-35 | 7. Clicar no botão "Back Home". | Idem anterior | 1. O Sistema deve retornar para a página principal exibindo os produtos. 2. Mudar a URL para: https://www.saucedemo.com/inventory.html | NOK - Exibe os mesmos problemas já relatados em LU-02 e LU-05 | - | LU-02 e LU-05 | Baixa | Médio |

#### 5.9.1 Observações Gerais:
- Principais áreas com defeitos:
  1. Login
  2. Ordenação de produtos
  3. Fluxo de compra
  4. Remoção de produtos no carrinho

### 5.10 Item: "1.3.1.5 Análise de riscos da aplicação"


| ID | Resumo | Passo a Passo | Resultado Obtido | Minha sugestão | Evidência | Severidade (téc.) | Impacto (p/ Usuários) 
|------------|-------------------|---------|-------------------|-----------------|------------|------------|---------|
| R7-01 | Verificar comportamento do Sistema quando alterar ID de produto pela URL | 1. Entrar na página de exibição dos produtos. 2. Clicar na foto de um produto. 3. Alterar o id do produto na URL para um inexistente e teclar "Enter". 4. Click no botão "Add to cart". 5. Clicar no ícone do carrinho de compras localizado no canto superior direito da página. | Após executar o passo 5, o Sistema tenta trocar de página mas não exibe mais nada. Saindo e retornando ainda consta o 'produto' no carrinho. Tendo em vista a caracteristica de não retirar o produto do carrinho ao fazer "Logout", fica impossível finalizar novas compra. Para sair dessa situação, deve-se entar novamente no Sistema, selecionar um produto e alterar para o mesmo ID do produto inexiste, dessa forma o sistema vai exibir a foto de um cachorro como da imeira vez e basta clicar no botão 'Remove". | Após executar o passo 3, o Sistema deveria confirmar se existe mesmo o ID passado e só exibir a tela com novas informações caso existisse o ID alterado e passo na URL passado. Ou alguma idea melhor que essa, o que não pode é continuar assim. | R7-01.mp4 | Alta | Alto |
| R7-02 | Verificar comportamento do Sistema quando alterado nome do Usuário em configurações de Cookies | Verificar comportamento quando alterado id do produto 1. Entrar na página de exibição dos produtos. 2. Abrir opção do desenvolvedor no Browser. 3. Ir na opção "Appication" > "Storage" > Cookies" campo "Value". 4. Trocar  de standard_user para visual_user.  | Após executar o passo 4 e voltando para a página do sistema, ele reagem com as caracteristica do user inserido, neste caso apresentando problemas visuais. | Sistema não deveria permitir uma "troca" de usuário sem as devidas validações. (Melhoria) Poderia ter validação de Captcha e/ou aut de 2 fatores para maior segurança. | R7-02.mp4 | Alta | Alto |


### 5.11 Item: "1.3.2.1 Testes de responsividade" e "1.3.2.2 Testes de acessibilidade"
Não consegui avançar nesse item apesar de acreditar muito em seu valor e perceber que o Site usado, necessita realmente de algumas melhorias nestes quesitos.<br>
No entanto, executei uma avaliação com "PageSpeed Insights" do google, onde deixo o relatório disponível na pasta .\Relatorios.



### 5.12 Item: "1.3.2.3 Sugestões de automação"
Quando o assunto é automatização, acredito que o escopo do que se deve ou não ser automatizado, passa por alguns critérios.<br> Abaixo descrevo alguns começando pelos de maior relavância:<br>
1.Fluxos onde se existir defeito, o impacto para o Negócio é grande (geralmente passa por assuntos de perda financeira, mas não só);<br>2. Fluxos onde se executa muitas vezes e/ou são muito longos e/ou demorados;<br>3. Fluxos onde a parte do Sistema demanda mais complexidade no código;<br>4.Fluxos onde sejá fácil mensuração de tempo/velocidade/duração para constante comparação (acada execução), assim possibilitando identificar o quanto antes algum problema quanto a performance.



Aqui deixo (pasta .\Robotframework) um exemplo prático bem simples, para ter uma noção do teste com Robotframework utilizando a Library Browser do Playwright (venho estudando recentemente essa combinação).












