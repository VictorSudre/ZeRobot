*** Settings ***
Resource    base.robot
Resource    steps.robot
Test Setup  Iniciar  
Test Teardown   Fechar  


*** Test Cases ***
Realizar compra no Zé delivery
    Dado que eu acesse a aplicação do zé delivery
    E realize login
    Quando eu selecionar o produto desejado
    E seguir para finalização da compra
    Então eu devo selecionar a forma de pagamento
    #E finalizar o pedido. (Não aplicado por se tratar de uma aplicação real)
    

