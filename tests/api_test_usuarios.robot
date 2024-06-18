*** Settings ***
Resource    ../resources/api_test_usuario.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar um novo usuario com sucesso na ServeRest
    Criar um usuario novo 
    Cadastrar o usuario criado na ServeRest
    Conferir se o usuario foi cadastrado corretamente