*** Settings ***
Resource    resources_login.robot
Resource    ../cadastro/resources_cadastro.robot


*** Test Cases ***

Test Case 01 - Realizar Login com Sucesso
    [Documentation]    Testa o login com sucesso
    [Tags]    smoke     login
    Realizar Login com Sucesso

Test Case 02 - Realizar Login com Email Inválido
    [Documentation]    Testa o login com email inválido    
    [Tags]    smoke    login
    Realizar Login com Email Inválido

Test Case 03 - Realizar Login com Senha Inválida
    [Documentation]    Testa o login com senha inválida    
    [Tags]    smoke    login
    Realizar Login com Senha Inválida