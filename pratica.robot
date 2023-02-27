*** Settings ***
Library    SeleniumLibrary
Resource   ./pratica.resource

*** Comment ***
Teste realizado utilizando Robot Framework.
Para ralização do mesmo é necessário ter instalado Chrome, Python, Robot Framework e Selenium Library.
Para executar o teste é preciso inserir no terminal da pasta DesafioJusta o seguinte comando: robot pratica.robot

*** Test Cases ***
Processo de compra de camisa vermelha na loja Sauce Demo
  Dado que estou no site Saucedemo
  Quando eu faço login
  E seleciono a camisa vermelha e coloco no carrinho
  E abro o carrinho e clico em Checkout
  E adiciono os dados para checkout
  Então finalizo a compra

Processo de compra de bolsa na loja Sauce Demo
  Dado que estou no site Saucedemo
  Quando eu faço login
  E seleciono a bolsa e coloco no carrinho
  E abro o carrinho e clico em Checkout
  E adiciono os dados para checkout
  Então finalizo a compra

Processo de ordenar os valores do menor para o maior e comprar os dois produtos menores na loja Sauce Demo
  Dado que estou no site Saucedemo
  Quando eu faço login
  E ordeno os produtos do menor para o maior valor e seleciono dois produtos de menor valor
  E abro o carrinho e clico em Checkout
  E adiciono os dados para checkout
  Então finalizo a compra


