*** Settings ***
Library               RequestsLibrary
Library               String  
Library               Collections


*** Keywords ***
Criar um usuário novo
    ${random}=        Generate Random String    10     
    ${EMAIL}=         Set Variable              teste_${random}@email.com
    ${password}=      Set Variable              123456
    [Return]      ${EMAIL}    ${password}
    
Cadastrar usuário na ServeRest
    ${email}    ${password}=    Criar um usuário novo
    ${body}=                    Create Dictionary   
    ...                                 nome=Usuário Teste   
    ...                                 email=${EMAIL}  
    ...                                 password=${password}    
    ...                                 administrador=true  
   
    Criar sessão na ServeRest
    ${response}=                POST On Session    
    ...                                 serveRest    /usuarios    
    ...                                 json=${body}   
    
    Set Test Variable                   ${response}  
    [Return]                            ${EMAIL}    ${password}

Criar sessão na ServeRest
    ${headers}=       Create Dictionary         Content-Type=application/json
    Create Session    serveRest    https://serverest.dev    headers=${headers}

Conferir se o usuário foi cadastrado com sucesso     
    Log    ${response}    
    Dictionary Should Contain Item    ${response.json()}    message    Cadastro realizado com sucesso
    Should Be Equal As Strings    ${response.status_code}    201

Cadastrar usuário na ServeRest informando um email inválido
    ${password}=    Criar um usuário novo
    ${body}=        Create Dictionary   
    ...                                nome=Maria    
    ...                                email=EmailInvalido    
    ...                                password=${password}    
    ...                                administrador=true  
    Criar sessão na ServeRest
    
    ${response}=    POST On Session    
    ...                                serveRest    /usuarios    
    ...                                json=${body}   
    ...                                expected_status=anything

    Set Test Variable                  ${response}

Conferir mensagem de erro de email inválido
    Log    ${response}         
    Should Be Equal As Strings    ${response.status_code}    400

Cadastrar usuário na ServeRest informando uma senha vazia
    ${EMAIL}=        Criar um usuário novo
    ${body}=         Create Dictionary   
    ...                                   nome=Maria    
    ...                                   email=${EMAIL}    
    ...                                   password=    
    ...                                   administrador=true  
    Criar sessão na ServeRest
    
    ${response}=    POST On Session    
    ...                                   serveRest    /usuarios    
    ...                                   json=${body}
    ...                                   expected_status=anything  

    Set Test Variable              ${response}

Conferir mensagem de erro de senha vazia
    Log    ${response}    
    Should Be Equal As Strings    ${response.status_code}    400

Cadastrar usuário na ServeRest informando o campo de nome vazio
    ${EMAIL}    ${password}=    Criar um usuário novo
    ${body}=    Create Dictionary   
    ...                            nome=    
    ...                            email=${EMAIL}    
    ...                            password=${password}   
    ...                            administrador=true  
    Criar sessão na ServeRest
    
    ${response}=    POST On Session    
    ...                            serveRest    /usuarios    
    ...                            json=${body}
    ...                            expected_status=anything   

    Set Test Variable              ${response}

Conferir mensagem de erro de nome vazio
    Log    ${response}    
    Should Be Equal As Strings    ${response.status_code}    400

Cadastrar usuário na ServeRest informando o campo de email vazio
    ${password}=    Criar um usuário novo
    ${body}=    Create Dictionary   
    ...                            nome=Maria    
    ...                            email= 
    ...                            password=${password} 
    ...                            administrador=true  
    Criar sessão na ServeRest
    
    ${response}=    POST On Session    
    ...                            serveRest    /usuarios    
    ...                            json=${body}  
    ...                            expected_status=anything 

    Set Test Variable              ${response}

Conferir mensagem de erro de email vazio
    Log    ${response}    
    Should Be Equal As Strings    ${response.status_code}    400
