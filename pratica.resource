*** Variables ***
${SITE}              https://www.saucedemo.com/ 
${BROWSER}           Chrome
${INPUT_USER}        css=#user-name
${USER}              standard_user
${INPUT_PASSWORD}    css=#password
${PASSWORD}          secret_sauce
${BUTTON_LOGIN}      css=#login-button
${TSHIRT}            css=#item_3_title_link > div
${ADD_TSHIRT}        xpath=//*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
${CAR}               css=#shopping_cart_container > a
${CHECKOUT}          css=#checkout
${INPUT_NAME}        css=#first-name
${NAME}              Anna
${INPUT_LASNAME}     css=#last-name
${LASTNAME}          Lopes    
${INPUT_ZIP}         css=#postal-code
${ZIPCODE}           06401120
${BUTTON_CONTINUE}   css=#continue
${BUTTON_FINISH}     css=#finish
${VALIDATION}        css=#checkout_complete_container > h2
${MESSAGE}           THANK YOU FOR YOUR ORDER
${BACKPACK}          css=#item_4_title_link > div
${ADD_BACKPACK}      xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
${SORT_CONTAINER}    css=#header_container > div.header_secondary_container > div.right_component > span > select
${ORDER_LOWTOHIGH}   css=#header_container > div.header_secondary_container > div.right_component > span > select > option:nth-child(3)
${PRODUCT1}          xpath=//*[@id="add-to-cart-sauce-labs-onesie"]
${PRODUCT2}          xpath=//*[@id="add-to-cart-sauce-labs-bike-light"]


*** Keywords ***
Dado que estou no site Saucedemo
    Open Browser     ${SITE}            ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   0.75

Quando eu faço login
    Input Text       ${INPUT_USER}      ${USER} 
    Input Text       ${INPUT_PASSWORD}  ${PASSWORD} 
    Wait and Click   ${BUTTON_LOGIN} 

E seleciono a camisa vermelha e coloco no carrinho
    Wait and Click   ${TSHIRT} 
    Wait and Click   ${ADD_TSHIRT} 

E abro o carrinho e clico em Checkout
    Wait and Click   ${CAR}
    Wait and Click   ${CHECKOUT}

E adiciono os dados para checkout
    Input Text       ${INPUT_NAME}       ${NAME}
    Input Text       ${INPUT_LASNAME}    ${LASTNAME}
    Input Text       ${INPUT_ZIP}        ${ZIPCODE}
    Wait and Click   ${BUTTON_CONTINUE}

Então finalizo a compra
    Wait and Click                        ${BUTTON_FINISH}
    Element Should Contain                ${VALIDATION}      ${MESSAGE}  
    Close Browser

E seleciono a bolsa e coloco no carrinho
    Wait and Click   ${BACKPACK}
    Wait and Click   ${ADD_BACKPACK}  

E ordeno os produtos do menor para o maior valor e seleciono dois produtos de menor valor
   Wait and Click    ${SORT_CONTAINER}
   Wait and Click    ${ORDER_LOWTOHIGH} 
   Wait and Click    ${PRODUCT1}   
   Wait and Click    ${PRODUCT2}

Wait and Click 
    [Arguments]                          ${ELEMENT}
    Wait Until Element is Visible        ${ELEMENT}
    Click Element                        ${ELEMENT}