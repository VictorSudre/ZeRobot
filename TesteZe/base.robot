*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}                      https://ze.delivery/
${botaoEntrar}              css:button[id="welcome-button-sign-in"]
${botaoAceitarCookies}      css:button[id="onetrust-accept-btn-handler"]
${inserirEmail}             css:input[id="login-mail-input-email"]
${inserirSenha}             css:input[id="login-mail-input-password"]
${botaoLogin}               css:button[type="submit"]
${botao18Sim}               css:button[id="age-gate-button-yes"]
${campoPesquisa}            css:input[id="search-product-input"]
${produtoSelecionado}       css:li[id="search-product-list-item-product-16665"]
${adicionarProduto}         css:button[id="add-product"]
${sacola}                   id:product-card
${botaoContinuar}           css:button[id="finish-order"]
${detalheEndereço}          id:checkout-card-address-details
${listaProdutos}            id:products-summary
${detalheCupom}             id:checkout-card-coupon-details
${botaoSelecionarForma}     id:finish-order
${dinheiro}                 id:Dinheiro


*** Keywords
Iniciar 
    Open Browser                 ${url}     chrome

Fechar 
    #Capture Page Screenshot
    Close Browser

acessarPagina
    Go to                           ${url}

clicarNoBotaoEntrar
    Click Element                   ${botaoEntrar} 
    Sleep                           2
    Click Element                   ${botaoAceitarCookies}

realizarLogin 
    Input text                      ${inserirEmail}        #inserir email
    Input text                      ${inserirSenha}        #inserir senha
    Click Element                   ${botaoLogin}

confirmarMaiorIdade
    Sleep                           7
    Click Element                   ${botao18Sim}

selecionarProduto
    Sleep                           2
    Input text                      ${campoPesquisa}       Brahma Duplo
    Sleep                           3
    Click Element                   ${produtoSelecionado}
    Sleep                           2

validarProduto
    Page should contain                                    Brahma Duplo Malte 350ml - Pack de 24 unidades
    Click Element                   ${adicionarProduto}
    Sleep                           5
    Element Should Contain          ${sacola}              Brahma Duplo Malte 350ml - Pack de 24 unidades
    Sleep                           2

continuarCompra
    Click Element                  ${botaoContinuar}
    Sleep                          5
    Element Should Contain         ${detalheEndereço}      Rua Faustino Alende, 40
    Element Should Contain         ${listaProdutos}        Brahma Duplo Malte 350ml - Pack de 24 unidades
    Element Should Contain         ${detalheCupom}         DOUCABOR9
    Sleep                          5

selecionarFormaDePagamento
    Click Element                  ${botaoSelecionarForma}
    Sleep                          5
    
validarFormaDePagamento
    Page Should Contain            PAGAMENTO NA ENTREGA
    Page Should Contain            PAGAMENTO ONLINE
    Click Element                  ${dinheiro}
    Sleep                          5



