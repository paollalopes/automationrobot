*** Settings ***
Library               RequestsLibrary
Library               String  
Library               Collections
Resource              ../cadastro/resources_cadastro.robot

*** Keywords ***

Realizar Login com Sucesso
    [Documentation]    Realiza o login com sucesso
    Criar sessão na ServeRest
    ${email}    ${password}=      Cadastrar usuário na ServeRest

    ${body}=                      Create Dictionary    
    ...                                           email=${email}    
    ...                                           password=${password}
   
    ${response}=                  POST            https://serverest.dev/login    
    ...                                           json=${body}
    ...                                           expected_status=anything 
    
    Log To Console                Email: ${email}
    Log To Console                Senha: ${password}
    Log To Console                Status: ${response.status_code}
    Log To Console                Motivo: ${response.reason}
    Log To Console                Body: ${response.text}
    
    Should Be Equal As Strings    ${response.status_code}    200
   


Realizar Login com Email Inválido
    [Documentation]    Realiza o login com email inválido
    Criar sessão na ServeRest 
    ${password}=                  Cadastrar usuário na ServeRest  
    ${body}=                      Create Dictionary    
    ...                                               email=gtdfcxbedfx  
    ...                                               password=${password}
   
    ${response}=                  POST On Session  ServeRest  /login    
    ...                                               json=${body}
    ...                                               expected_status=anything 
    
    Should Be Equal As Strings    ${response.status_code}    400

Realizar Login com Senha Inválida
    [Documentation]    Realiza o login com senha inválida
    Criar sessão na ServeRest 
    ${email}=                     Cadastrar usuário na ServeRest    
    ${body}=                      Create Dictionary    
    ...                                             email=${email}  
    ...                                             password=hegydbahisuk
   
    ${response}=                 POST On Session  ServeRest  /login    
    ...                                             json=${body}
    ...                                             expected_status=anything 
    
    Should Be Equal As Strings    ${response.status_code}    400    


