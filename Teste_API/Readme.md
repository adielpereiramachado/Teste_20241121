# Plano de Teste - API #

***[RESTFULL BOOKER](https://restful-booker.herokuapp.com/)***

*versão do documento: 1.0*

## 1. Objetivo:
Este artefato descreve o plano de teste contra o site https://restful-booker.herokuapp.com/. 
Contido neste trabalho, os principais fluxos e cenários de teste para avaliação.


## 2. Escopo dos Testes:
- Plataforma: API
- URL: https://restful-booker.herokuapp.com/
- Ambiente: Produção
- Versão: Não identificada


## 3. Considerações iniciais:
- Lendo o Site (https://restful-booker.herokuapp.com), é descrito (em tradução) que a API é 'carregada' de bugs. No entanto, segundo minha análise (posso estar errado) a própria documentação da API (https://restful-booker.herokuapp.com/apidoc/index.html) contém alguns bugs. Dessa forma, no artefato com os Casos de Teste, descrevi no Resultado Esperado o que considerei correto esperar da API e não somente a descrição literal encontrada no site, em alguns casos cheguei a descrever por conta próprio por não encontrar um Resultado Esperado na documentação (espec.).

- Com o intuito de melhor identificação dos casos de teste, usei iniciais da descrição do caso de teste na identificação individual de cada teste, por exemplo:  
Criação do Token: **CTK-01**, **CTK-01**, etc.  
Criação de uma Nova Reserva: **CNR-01**, **CNR-02**, etc.

- Também com a intenção de identificar melhor os Casos de Testes vs "requests" utilizada, na descrição do teste cito na parte inferior o nome da "requests", por exemplo:  
. "Passar credenciais corretas para criação com sucesso do Token  
  **2.2.1.1 Gerar token de autenticação - CreateToken"**  
. "Tentar criar nova reserva passando Data Chekin maior que Data Checkout  
  **2.2.2.1.b Criar uma Nova Reserva passando chekin maior checkout- CreateBooking - CNR-02-05"**

- Para identificar os "Scripts" de testes que falharam escritos dentro de cada "requests", citei no final da descrição do teste a identificação do Caso de Teste que falhou, por exemplo:  
. "Tentar criar nova reserva passando Data Chekin maior que Data Checkout  
  2.2.2.1.b Criar uma Nova Reserva passando chekin maior checkout- CreateBooking - **CNR-02-05"**  
No exemplo acima, demonstro que disparando a "requests" os Casos de Teste CNR-02 e CNR-05 falharam. Dessa maneira achei fácil para quando executo os testes, diferenciar os testes que já sei que vão falhar dos que passaram a falhar (exemplo com o Newman).

## 4. Casos de Teste
### 4.1 Casos de Teste - Autenticação 

#### 4.1.1 Cenário de Teste 
Verificação da Criação do Token "2.2.1.1 Gerar token de autenticação"

#### 4.1.2 Pré-Condição
Ter acesso às credenciais corretas para "username" : "admin" e "password" : "password123"

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|------------|
| CTK-01 | Passar credenciais corretas para criação com sucesso do Token | Deve permitir a criação do Token com retorno de exemplo:<br>{<br>&nbsp;&nbsp;&nbsp;&nbsp;"token": "abc123"<br>}<br>Verificar características do body da resposta. Tem de ter um campo "token" sendo string.<br>*Teste de verificação dentro da requisição. | Criou Token | OK | - |
| CTK-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos.<br>*Teste de verificação dentro da requisição.<br>** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | - |
| CTK-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | - |
| CTK-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser:<br>type: "array",<br>&nbsp;&nbsp;&nbsp;&nbsp;items: {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type: "object",<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;properties: {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bookingid: {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type: "integer"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;required: ["bookingid"]<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | - |

### 4.2 Casos de Teste - Tentativa de Geração de Token com Credenciais Inválidas

#### 4.2.1 Cenário de Teste
Verificação da Criação do Token com Problema "2.2.1.2 Tentar gerar token com credenciais inválidas"

#### 4.2.2 Pré-Condição
Ter acesso às credenciais INcorretas para "username" e "password"

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status |
|---------------|-------------------|-------------------|------------------|---------|
| CTKP-01 | Passar credenciais INcorretas para tentativa de criação do Token (Passada Usuário: Ok / Senha: NOK) 2.2.1.2.b Tentar gerar token com credenciais inválidas SenhaErrada- CreateToken | Não deve criar o Token e retorno deve ser conforme exemplo:<br>{<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": "Bad credentials"<br>} | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos.<br>*Teste de verificação dentro da requisição.<br>** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-04 | Idem anterior | Verificar conteúdo da resposta. Tem de ter um campo "reason" com valor "Bad credentials" sendo string.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-05 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser:<br>{<br>&nbsp;&nbsp;"type": "object",<br>&nbsp;&nbsp;"properties": {<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"type": "string"<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;},<br>&nbsp;&nbsp;"required": ["reason"]<br>}<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-06 | Passar credenciais INcorretas para tentativa de criação do Token (Passada Usuário: NOk / Senha: OK) 2.2.1.2.c Tentar gerar token com credenciais inválidas - CreateToken - user errado | Não deve criar o Token e retorno deve ser conforme exemplo:<br>{<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": "Bad credentials"<br>} | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-07 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos.<br>*Teste de verificação dentro da requisição.<br>** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-08 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-09 | Idem anterior | Verificar conteúdo da resposta. Tem de ter um campo "reason" com valor "Bad credentials" sendo string.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-10 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser:<br>{<br>&nbsp;&nbsp;"type": "object",<br>&nbsp;&nbsp;"properties": {<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"type": "string"<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;},<br>&nbsp;&nbsp;"required": ["reason"]<br>}<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-11 | Passar credenciais INcorretas para tentativa de criação do Token (Passada Usuário: NOk / Senha: NOK) 2.2.1.2.d Tentar gerar token com credenciais inválidas - CreateToken - senha e password errados | Não deve criar o Token e retorno deve ser conforme exemplo:<br>{<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": "Bad credentials"<br>} | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-12 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos.<br>*Teste de verificação dentro da requisição.<br>** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-13 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-14 | Idem anterior | Verificar conteúdo da resposta. Tem de ter um campo "reason" com valor "Bad credentials" sendo string.<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |
| CTKP-15 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser:<br>{<br>&nbsp;&nbsp;"type": "object",<br>&nbsp;&nbsp;"properties": {<br>&nbsp;&nbsp;&nbsp;&nbsp;"reason": {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"type": "string"<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;},<br>&nbsp;&nbsp;"required": ["reason"]<br>}<br>*Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | Ok |


### 4.3 Cenário de Teste: Verificação da Criação de uma Nova Reserva "2.2.2.1 Criar uma nova reserva"

**Pré-Condição:** -

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|-------------|
| CNR-01 | Criação de uma Reserva nova no sistema conforme: ```json {"firstname": "PrimeiroNome", "lastname": "SobreNome", "totalprice": 123, "depositpaid": true, "bookingdates": {"checkin": "2024-02-05", "checkout": "2024-03-20"}, "additionalneeds": "Breakfast"}``` 2.2.2.1 Criar uma nova reserva - CreateBooking | Deve permitir a criação de uma nova reserva e retornar (ID muda): ```json {"bookingid": 3488, "booking": {"firstname": "PrimeiroNome", "lastname": "SobreNome", "totalprice": 123, "depositpaid": true, "bookingdates": {"checkin": "2025-02-05", "checkout": "2025-03-20"}, "additionalneeds": "Breakfast"}}``` | Resultado Obtido igual ao Resultado esperado | OK | |
| CNR-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| CNR-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200. *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| CNR-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser: ```json {"type": "array", "items": "title": "Generated schema for Root", "type": "object", "properties": {"bookingid": {"type": "number"}, "booking": {"type": "object", "properties": {"firstname": {"type": "string"}, "lastname": {"type": "string"}, "totalprice": {"type": "number"}, "depositpaid": {"type": "boolean"}, "bookingdates": {"type": "object", "properties": {"checkin": {"type": "string"}, "checkout": {"type": "string"}}, "required": ["checkin", "checkout"]}, "additionalneeds": {"type": "string"}}, "required": ["firstname", "lastname", "totalprice", "depositpaid", "bookingdates", "additionalneeds"]}}, "required": ["bookingid", "booking"]}``` *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| CNR-05 | Tentar criar nova reserva passando Data Chekin maior que Data Checkout 2.2.2.1.b Criar uma Nova Reserva passando chekin maior checou- CreateBooking - CNR-02-05 | Sistema poderia recusar criação, exibindo mensagem de erro | Sistema permitiu a criação da reserva mesmo passando data Chekin maior que data Chekout. | NOK | Para esse teste considerei que não deveria ser correto acatar a criação da reserva e por isso o Status Code deveria ser diferente de 200, no caso cito por exemplo 500. |
| CNR-06 | Idem anterior | Sistema poderia exibir Status Code diferente de 200, p.ex.: 500 - Internal Server Error | Sistema poderia exibir Status Code p.ex.: 500 - Internal Server Error indicando algum problema por conta da Data Checkin ser maior que Data checkout | NOK | Para esse teste considerei que não deveria ser correto acatar a criação da reserva e por isso o Status Code deveria ser diferente de 200, no caso cito por exemplo 500. |
| CNR-07 | Tentar criar nova reserva NÃO passando Data Checkin 2.2.2.1.c Criar uma Nova Reserva sem data chekin - CreateBooking - CNR-07-08-09 | Sistema poderia recusar criação, exibindo mensagem de erro | Sistema permitiu a criação da reserva mesmo passando data Chekin vazia | NOK | Para esse teste considerei que não deveria ser correto acatar a criação da reserva sem Data Chekin e por isso o Status Code deveria ser diferente de 200, no caso cito por exemplo 500. |
| CNR-08 | Idem anterior | Sistema poderia exibir Status Code diferente de 200, p.ex.: 500 - Internal Server Error | Sistema permitiu a criação da reserva mesmo passando data Chekin vazia | NOK | Para esse teste considerei que não deveria ser correto acatar a criação da reserva sem Data Chekin e por isso o Status Code deveria ser diferente de 200, no caso cito por exemplo 500. |
| CNR-09 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve por sinaç não deve acatar resposta. | Tendo em vista que acatou a requisição | NOK | Não tem esse ponto na espec. considerei que o retonro para uma solicitação indevida poderia ser p.ex.: [], mas poderia mudar conforme espec. |


# Cenário de Teste: Verificação de Busca de Reserva Específica "2.2.2.2 Buscar uma reserva específica"

**Pré-Condição:** Existir uma reserva criada no Sistema. Para meus testes, uso dados dos registros que passo para criar uma reserva para fazer as buscas.

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|-------------|
| BRE-01 | Fazendo busca de uma reserva existente no Sistema passando um ID recém criado 2.2.2.2 Buscar uma Reserva Específica - GetBooking | Deve exibir dados mais detalhados da reserva: ```json {"firstname": "PrimeiroNome", "lastname": "SobreNome", "totalprice": 123, "depositpaid": true, "bookingdates": {"checkin": "2025-02-05", "checkout": "2025-03-20"}, "additionalneeds": "Breakfast"}``` | Resultado Obtido igual ao Resultado esperado | OK | Melhoria: Poderia retornar o ID para fazer validação. |
| BRE-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| BRE-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200. *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| BRE-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser: ```json {"type": "array", "items": "type": "object", "properties": {"firstname": {"type": "string"}, "lastname": {"type": "string"}, "totalprice": {"type": "number"}, "depositpaid": {"type": "boolean"}, "bookingdates": {"type": "object", "properties": {"checkin": {"type": "string"}, "checkout": {"type": "string"}}, "required": ["checkin", "checkout"]}, "additionalneeds": {"type": "string"}}, "required": ["firstname", "lastname", "totalprice", "depositpaid", "bookingdates", "additionalneeds"]}``` *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| BRE-05 | Fazendo busca de uma reserva INexistente no Sistema 2.2.2.2.b Buscar uma Reserva Específica - Inexistente - GetBooking | Não deve exibir dados mais detalhados da reserva, por não ter localizado. Ao invés disso, pode exibir mensagem de erro. | Resultado Obtido igual ao Resultado esperado | OK | |
| BRE-06 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| BRE-07 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 404. *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | Não achei na espec. mas considerei correto que devesse realmente retornar 404 not found |

# Cenário de Teste: Verificação de Busca de TODAS as reservas "2.2.2.3 Listar todas as reservas"

**Pré-Condição:** Existir uma reserva criada no Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|-------------|
| BTR-01 | Fazendo busca de todas reservas existente no Sistema 2.2.2.3 Listar todas as reservas - GetBookingIds | Deve exibir dados mais detalhados da reserva: ```json [{"bookingid": 1916}, {"bookingid": 822}, {"bookingid": 517}]``` | Resultado Obtido igual ao Resultado esperado | OK | |
| BTR-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| BTR-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200. *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| BTR-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser: ```json {"type": "array", "items": "type": "array", "items": {"type": "object", "properties": {"bookingid": {"type": "number"}}, "required": ["bookingid"]}}``` *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |


# Cenário de Teste: Verificação da Atualização de uma Reserva Existente "2.2.2.4 Atualizar uma reserva existente"

**Pré-Condição:** Existir uma reserva criada no Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|-------------|
| ARE-01 | Fazendo uma alteração de uma reserva existente no Sistema 2.2.2.4 Atualizar uma Reserva Existente - UpdateBooking | Deve atualizar o resgitro com os novos valores e exibir os dados em detalhe da reserva já alterada: ```json {"firstname": "PrimeiroNome Modificado", "lastname": "Sobre Nome", "totalprice": 111, "depositpaid": true, "bookingdates": {"checkin": "2025-01-02", "checkout": "2026-01-02"}, "additionalneeds": "Breakfast"}``` | Resultado Obtido igual ao Resultado esperado | OK | |
| ARE-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| ARE-03 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser 200. *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| ARE-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser: ```json {"type": "array", "items": "type": "object", "properties": {"firstname": {"type": "string"}, "lastname": {"type": "string"}, "totalprice": {"type": "number"}, "depositpaid": {"type": "boolean"}, "bookingdates": {"type": "object", "properties": {"checkin": {"type": "string", "format": "date"}, "checkout": {"type": "string", "format": "date"}}, "required": ["checkin", "checkout"]}, "additionalneeds": {"type": "string"}}, "required": ["firstname", "lastname", "totalprice", "depositpaid", "bookingdates", "additionalneeds"]}``` *Teste de verificação dentro da requisição. | Resultado Obtido igual ao Resultado esperado | OK | |
| ARE-05 | Atualizando uma reserva Deixando o nome em branco. Verificar se o campo "firstname" possui um valor diferente de vazio. 2.2.2.4.b Atualizar uma reserva existente - UpdateBooking - ARE-05-07-08 | Sistema não deveria permitir esse tipo de atualização e retornar algum tipo de mensagem de erro | Permitiu alteração do Nome para deixar o Nome em branco (apagou o nome) | NOK | Na espec. não faz menção a essa situação, mas considerei um problema ter permitido deixar o nome em branco. Sugiro revisão da espec. |
| ARE-06 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| ARE-07 | Idem anterior | Verificação do Status de Resposta (Status Code). O Status Code deve ser diferente de 200, p.ex.: 400,404,409 ou 422 *Teste de verificação dentro da requisição. | Sistema retornou Status Code 200 | NOK | Na espec. não faz menção a essa situação, mas considerei ser um problema permitir apagar Nome e por tanto exibir Status code 200. Sugiro revisão da espec. |
| ARE-08 | Idem anterior | O Campo Nome não pode ser apagado ficando em branco | Ficou em branco, o Sistema permitiu Apagar o Nome | NOK | Na espec. não faz menção a essa situação, mas considerei um problema ter permitido deixar o nome em branco. Sugiro revisão da espec. |


# Cenário de Teste: Verificação de Deletar uma Reserva "2.2.2.5 Deletar uma reserva"

**Pré-Condição:** Existir uma reserva criada no Sistema.

| Caso de Teste | Descrição do teste | Resultado esperado | Resultado Obtido | Status | Observação |
|---------------|-------------------|-------------------|------------------|---------|-------------|
| DR-01 | Passar uma reserva existente para deletar. 2.2.2.5 Deletar uma reserva - DeleteBooking - DR-03-04 | Sistema deve acatar solicitação e deletar o registo. | Resultado Obtido igual ao Resultado esperado | OK | |
| DR-02 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| DR-03 | Idem anterior | Verificação do Status de Resposta (Status Code). Na espec. diz "200" e cita também, "201"). Para ambos considero incorreto, no caso acho 202 ou 204 a melhor alternativa *Teste de verificação dentro da requisição. | Não exibe 202 nem 204, mas sim 201 que é associado a criação de registro. | NOK | Considerei um problema a descrição na espec. para esse item. Está descrito que o Status Code deve ser 200 e no exemplo 201. Sugiro revisão da espec. |
| DR-04 | Idem anterior | Verificar o Schema da resposta. O schema dessa resposta deve ser (texto): Created. Considero incorreto, no caso essa descrição, onde penso que deveria exibir algum texto fazendo menção a deltear o registro. *Teste de verificação dentro da requisição. | Exibe texto Created e não um texto fazendo menção que o registro foi deletado | NOK | Considerei um problema a descrição na espec. para esse item. Está descrito que deve exibir o texto 'Created'. Sugiro revisão da espec. |
| DR-05 | Passar uma reserva INexistente para deletar. 2.2.2.5.b Deletar uma Reserva - DeleteBooking - DR-07-08 | Sistema NÃO deve permitir/acatar essa requisição até por que não existe o registro | Ok, não permitiu. | OK | |
| DR-06 | Idem anterior | Simulei uma necessidade da resposta ser exibida em no máximo 2 segundos. *Teste de verificação dentro da requisição. ** Criação minha, não consta na espec. | Resultado Obtido igual ao Resultado esperado | OK | |
| DR-07 | Idem anterior | Verificação do Status de Resposta (Status Code). Na espec. não localizei, sendo assim considerei o Status Code mais adequado como sendo 404. *Teste de verificação dentro da requisição. | Está retornando Status Code 405 e não me parece o mais indicado. | NOK | Não identifiquei na espec. qual seria o comportamento esperado para quando passar um Id insexiste para ser deletado. |
| DR-08 | Idem anterior | Verificar caracteristicas do body da resposta. *Teste de verificação dentro da requisição. | Está retornando "Method Not Allowed", não me parece ser o mais indicado para essa situação em que o Método es´ta correto, só não localizou a reserva para deletar. | NOK | Não identifiquei na espec. qual seria o comportamento esperado para quando passar um Id insexiste para ser deletado. |



