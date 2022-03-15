*** Settings ***
Resource    base.robot
Test Setup  Iniciar  
Test Teardown   Fechar  


*** Test Cases ***
Realizar login Zé delivery página inicial
    Go to                           ${url}
    botaoEntrar
    realizarLogin 
    confirmarMaiorIdade
    validarMensagem

    
***Keywords***
botaoEntrar
    Click Element                   css:button[id="welcome-button-sign-in"] 
    Sleep                           2
    Click Element                   css:button[id="onetrust-accept-btn-handler"]

realizarLogin 
    Input text                      css:input[id="login-mail-input-email"]       emailvalido
    Input text                      css:input[id="login-mail-input-password"]    senhadoemail
    Click Element                   css:button[type="submit"]

confirmarMaiorIdade
    Sleep                           5
    Click Element                   css:button[id="age-gate-button-yes"]

validarMensagem
    Sleep                           5
    Page Should contain             Nenhum distribuidor aberto no momento
    #Mensagem exibida após as 1:30hrs de segunda a quinta

