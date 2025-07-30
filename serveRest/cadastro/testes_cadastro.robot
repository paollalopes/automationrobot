*** Settings ***
Resource      resources_cadastro.robot


*** Test Cases ***

Test Case 01: Criar Usuário na ServeRest 
    [Documentation]    Criação de novo usuário
    Criar um usuário novo
    Cadastrar usuário na ServeRest
    Conferir se o usuário foi cadastrado com sucesso

Test Case 02: Criar Usuário na ServeRest com Email Válido
    [Documentation]    Cadastro de um novo usuário na ServeRest com email válido
    Criar um usuário novo
    Cadastrar usuário na ServeRest
    Conferir se o usuário foi cadastrado com sucesso

Test Case 03: Criar Usuário na ServeRest com Email Inválido
    [Documentation]    Cadastro de um novo usuário na ServeRest com email inválido
    Criar um usuário novo
    Cadastrar usuário na ServeRest informando um email inválido  
    Conferir mensagem de erro de email inválido

Test Case 04: Criar Usuário na ServeRest com Senha Vazia
    [Documentation]    Cadastro de um novo usuário na ServeRest com senha vazia
    Criar um usuário novo
    Cadastrar usuário na ServeRest informando uma senha vazia  
    Conferir mensagem de erro de senha vazia

Test Case 06: Criar Usuário na ServeRest com Nome Vazio
    [Documentation]    Cadastro de um novo usuário na ServeRest com nome vazio
    Criar um usuário novo
    Cadastrar usuário na ServeRest informando o campo de nome vazio  
    Conferir mensagem de erro de nome vazio

Test Case 07: Criar Usuário na ServeRest com Email Vazio
    [Documentation]    Cadastro de um novo usuário na ServeRest com email vazio
    Criar um usuário novo
    Cadastrar usuário na ServeRest informando o campo de email vazio  
    Conferir mensagem de erro de email vazio

