*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***

Criar um usuario novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@gmail.com
    Log    ${EMAIL_TESTE}


Cadastrar o usuario criado na ServeRest
    ${bory}    Create Dictionary
    ...    nome=Felipe alves
    ...    email=${EMAIL_TESTE}
    ...    password=1234
    ...    administrador=true
    Log    ${bory}

    Criar Sessão na ServeRest

    ${resposta}    POST On Session    
    ...    alias=ServeRest    
    ...    url=/usuarios    
    ...    json=${bory}  

    Log    ${resposta.json()}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}



Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}


Conferir se o usuario foi cadastrado corretamente
    Log    ${RESPOSTA}
    ${message}    Set Variable    ${RESPOSTA}[message]
    Should Be Equal As Strings    ${message}    Cadastro realizado com sucesso

    
     

    