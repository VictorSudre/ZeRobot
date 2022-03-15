*** Settings ***
Resource    base.robot
Test Setup  Iniciar  
Test Teardown   Fechar  


*** Test Cases ***
Realizar compra no Zé delivery
    acessarPagina
    clicarNoBotaoEntrar
    realizarLogin 
    confirmarMaiorIdade
    selecionarProduto
    validarProduto
    continuarCompra
    selecionarFormaDePagamento
    validarFormaDePagamento

    
***Keywords***
acessarPagina
    Go to                           ${url}
clicarNoBotaoEntrar
    Click Element                   css:button[id="welcome-button-sign-in"] 
    Sleep                           2
    Click Element                   css:button[id="onetrust-accept-btn-handler"]

realizarLogin 
    Input text                      css:input[id="login-mail-input-email"]       #inserir email
    Input text                      css:input[id="login-mail-input-password"]    #inserir senha
    Click Element                   css:button[type="submit"]

confirmarMaiorIdade
    Sleep                           7
    Click Element                   css:button[id="age-gate-button-yes"]

selecionarProduto
    Sleep                           2
    Input text                      css:input[id="search-product-input"]        Brahma Duplo
    Sleep                           3
    Click Element                   css:li[id="search-product-list-item-product-16665"]
    Sleep                           2

validarProduto
    Page should contain             Brahma Duplo Malte 350ml - Pack de 24 unidades
    Click Element                   css:button[id="add-product"]
    Sleep                           5
    Element Should Contain          id:product-card        Brahma Duplo Malte 350ml - Pack de 24 unidades
    Sleep                           2

continuarCompra
    Click Element                  css:button[id="finish-order"]
    Sleep                          5
    Element Should Contain         id:checkout-card-address-details                  Rua Faustino Alende, 40
    Element Should Contain         id:products-summary        Brahma Duplo Malte 350ml - Pack de 24 unidades
    Element Should Contain         id:checkout-card-coupon-details                                 DOUCABOR9
    Sleep                          5

selecionarFormaDePagamento
    Click Element                  id:finish-order
    Sleep                          5
    
validarFormaDePagamento
    Page Should Contain            PAGAMENTO NA ENTREGA
    Page Should Contain            PAGAMENTO ONLINE
    Click Element                  id:Dinheiro
    Sleep                          5



