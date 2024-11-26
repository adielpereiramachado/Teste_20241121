*** Settings ***
Library    Dialogs
Library    FakerLibrary
Library    OperatingSystem
Library    DateTime
Library    Browser
...        timeout=00:00:03                  #tempo limite de espera entre as interações
...        enable_presenter_mode=${false}    #velocidade reduzida qdo true sem ser hedless e caso NÃO ache elemento habilita Record Selector
Library    SeleniumLibrary



*** Variables ***
${BROWSER}           chromium
${HEADLESS}          ${false}
${SITE}              https://www.saucedemo.com/
${ID_CASO_DE_TESTE}  0
${ID_PAUSAR}         0

${USUARIO}    standard_user              # Usuario SEM lentidão proposital
# ${USUARIO}    performance_glitch_user    # Usuario COM lentidão proposital de 00:00:05 seg no login por exemplo nessa config vai dar certo


*** Keywords ***

 Obtendo data hora
    ${DATA_HORA}    Get Current Date    result_format=%Y-%m-%d_%H%M%S
    Set Suite Variable    ${DATA_HORA}
    

Abrir o navegador
    ${ID_CT}    IDENTIFICA ID DO CASO DE TESTE
    Log    \nID:${ID_CT}    console=true
    New Browser    browser=${BROWSER}   headless=${HEADLESS}
    New Context    viewport={'width':1750, 'height':850}    # monitor 1 com escala 115%
    # ...            recordVideo={'dir': '${CURDIR}/Relatorios/Evidencias'}     #, 'size':{'width':1650, 'height':800}}
    # ...            tracing=${CURDIR}/Relatorios/Evidencias/${DATA_HORA}.zip
    
Ir para o site saucedemo
    New Page       url=${SITE}    

Logar
    Fill Text           \#user-name    ${USUARIO} 
    Fill Text           \#password    secret_sauce
    Click               \#login-button

Adicionar produto no carrinho
    Click               \#add-to-cart-sauce-labs-backpack

Ir para carrinho
    Click               .shopping_cart_link

Ir para preenchimento de dados entrega
    Click               \#checkout
    Fill Text           \#first-name    Nome
    Fill Text           \#last-name    Sobre Nome
    Fill Text           \#postal-code    12345678

Ir para conf
    Click               \#continue
    
Ir para Overview
    Click               \#finish

Ir para Clomplete
    Click               \#back-to-products

Voltar para pagina principal
    Click               \#react-burger-menu-btn

Fazer logout
    Click               \#logout_sidebar_link


IDENTIFICA ID DO CASO DE TESTE
    ${ID_CASO_DE_TESTE}    Evaluate    ${ID_CASO_DE_TESTE} + 1
    Set Suite Variable    ${ID_CASO_DE_TESTE}    ${ID_CASO_DE_TESTE}
    RETURN    Caso-${ID_CASO_DE_TESTE}