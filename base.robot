*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}     https://ze.delivery/

*** Keywords
Iniciar 
    Open Browser                 ${url}     chrome

Fechar 
    #Capture Page Screenshot
    Close Browser