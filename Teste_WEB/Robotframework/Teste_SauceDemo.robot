*** Settings ***
Resource           Teste_SauceDemo.resource
Suite Setup        Obtendo data hora
Suite Teardown     Browser.Close Browser

*** Test Cases *** 
1.2.3 Fluxo completo de compra (do carrinho ate finalizacao)
    Abrir o navegador
    Ir para o site saucedemo 
    Logar
    Adicionar produto no carrinho
    Ir para carrinho
    Ir para preenchimento de dados entrega
    Ir para conf
    Ir para Overview
    Ir para Clomplete
    Voltar para pagina principal
    Fazer logout