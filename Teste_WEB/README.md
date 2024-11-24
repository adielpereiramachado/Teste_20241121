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
5. 'error_user' - Usuário com algum problema.
6. 'visual_user' - Usuário que gera problema visual no Sistema.

## 5. Casos de Testes

### 5.1 Login

#### 5.1.1 Cenário de Teste
Verificação de Login no Sistema "1.2.1 Login com diferentes tipos de usuários disponíveis"

#### 5.1.2 Pré-Condição
Ter acesso às credenciais de Usuário com permissão de Login - Username:"standard_user" Password:"secret_sauce"


| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|------------|
| LGI-01 | Login com sucesso no Sistema com credencial que permite login corretamente.<br>Utilizando no teste Username:"standard_user".<br>1. Acessar site<br>2. Inserir no campo "Username" o valor "standard_user"<br>3. Inserir no campo "Password" o valor "secret_sauce"<br>4. Clicar no botão "Login". | 1. Sistema deve permitir o login<br>2. Ir para URL https://www.saucedemo.com/inventory.html<br>3. Exibir o texto "Swag Labs" no título da página. | Resultado Obtido igual ao Resultado esperado | OK | Evidência |
| LGI-02 | Login SEM sucesso no Sistema com Username que permite login corretamente mas Password Errada.<br>Utilizando no teste Username:"standard_user".<br>1. Acessar site<br>2. Inserir no campo "Username" o valor "standard_user"<br>3. Inserir no campo "Password" o valor "1234"<br>4. Clicar no botão "Login". | 1. Sistema NÃO deve permitir o login<br>2. Exibir mensagem abaixo do campo "Password" e acima do botão "Login" (entre os 2 campos)<br>3. O Texto da mensagem deve ser:"Epic sadface: Username and password do not match any user in this service" | Resultado Obtido igual ao Resultado esperado. Mas tem sugestão de melhoria visual. | Melhoria | Considero uma melhoria a questão do texto não ser exibido por completo no campo destinado para tal.<br>Obs.: Para todos os testes foram usadas as configurações: Resolução da tela: 1920x1080, Escala: 100%, Zoom no Browse: 100% [Evidencia](https://github.com/adielpereiramachado/Github_Cursos/blob/main/Desafios/06_Preparacao_Teste_Emprego_Be_Talent/Teste_WEB/Evidencias/LGI-02_Melhoria_01.png) |
| LGI-03 | Login SEM sucesso no Sistema com Username e Password sem preenchimento (em branco).<br>Utilizando no teste Username:"".<br>1. Acessar site<br>2. Inserir no campo "Username" o valor ""<br>3. Inserir no campo "" o valor "1234"<br>4. Clicar no botão "Login". | 1. Sistema NÃO deve permitir o login<br>2. Exibir mensagem abaixo do campo "Password" e acima do botão "Login" (entre os 2 campos)<br>3. O Texto da mensagem deve ser:"Epic sadface: Username is required" | Resultado Obtido igual ao Resultado esperado | OK | [Evidência](https://github.com/adielpereiramachado/Github_Cursos/blob/main/Desafios/06_Preparacao_Teste_Emprego_Be_Talent/Teste_WEB/Evidencias/LGI-04_NOK.mp4) |


