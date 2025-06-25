*** Settings ***
Documentation    Essa suíte testa o site da Amazon
Resource         amazon_resources.robot
Suite Setup      Abrir o navegador
Suite Teardown    Fechar o navegador


*** Test Cases ***
# título deve estar encostado na margem do editor
# usar TAB garante que dois espaços sejam dados no passo a passo do CT

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônico do site da Amazon.com.br
    ...                aqui pode continuar escrevendo o documentation
    [Tags]             menus 
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Mais vendidos"
    Então o título da página deve conter "Mais vendidos".
  
Caso de teste 02 - Pesquisa de um produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando digitar o nome de produto "Kerastase" no campo de pesquisa
    E clicar no botão de pesquisa
    Então o resultado da pesquisa deve listar o produto pesquisado

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou no resultado da pesquisa exibindo o produto "Kerastase"
    Quando adicionar o produto "Kerastase" no carrinho
    E clicar em "Ir para o carrinho"
    Então o produto "Kerastase" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou no carrinho de compras com o produto "Kerastase"
    Quando remover o produto "Kerastase" do carrinho
    Então o carrinho deve ficar vazio