*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${BROWSER}    Chrome

*** Keywords ***

Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser    

Dado que estou na home page da Amazon.com.br
    Go To    ${URL}

Quando acessar o menu "Mais vendidos"
    Click Element    css=.nav-a[href='/gp/bestsellers/?ref_=nav_cs_bestsellers']
    Wait Until Page Contains Element    xpath=//h1[contains(text(), 'Mais vendidos')]

Então o título da página deve conter "Mais vendidos".
    Element Should Be Visible    xpath=//h1[contains(text(), 'Mais vendidos')]

Quando digitar o nome de produto "Kerastase" no campo de pesquisa
    Input Text    id=twotabsearchtextbox    Kerastase

E clicar no botão de pesquisa
    Click Element    css=.nav-search-submit

Então o resultado da pesquisa deve listar o produto pesquisado
    Wait Until Page Contains Element    xpath=//span[contains(text(), 'Kerastase')]
    Element Should Be Visible    xpath=//span[contains(text(), 'Kerastase')]

Dado que estou no resultado da pesquisa exibindo o produto "Kerastase"
    Wait Until Page Contains Element    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]
    Element Should Be Visible    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]

Quando adicionar o produto "Kerastase" no carrinho
    Click Element    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]
    Click Element    id=add-to-cart-button
    Wait Until Page Contains Element    xpath=//h1[contains(text(), 'Adicionado ao carrinho')]
    Element Should Be Visible    xpath=//h1[contains(text(), 'Adicionado ao carrinho')]

E clicar em "Ir para o carrinho"
    Click Element    xpath=(//a[@href='/cart?ref_=sw_gtc'])
    Wait Until Page Contains Element    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]

Então o produto "Kerastase" deve ser mostrado no carrinho
    #Click Element    css=.nav-cart-icon
    Wait Until Page Contains Element    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]
    Element Should Be Visible    xpath=(//span[@class='a-truncate-cut'])[1]

Dado que estou no carrinho de compras com o produto "Kerastase"
    Wait Until Page Contains Element    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]
    
Quando remover o produto "Kerastase" do carrinho
    Click Element    css=input[value='Excluir']

Então o carrinho deve ficar vazio
    Element Should Be Visible    xpath=(//div[@class='sc-list-item-removed-msg-delete a-padding-medium'])[1]
    Element Should Not Be Visible    xpath=(//span[contains(text(),'Kérastase Máscara de Tratamento Resistance Masque ')])[1]
