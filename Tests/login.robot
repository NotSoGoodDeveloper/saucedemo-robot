*** Settings ***
Documentation     Saucedemo test
Library           SeleniumLibrary
Library           JSONLibrary
Library           OperatingSystem
Library           BuiltIn
Library           /Users/vianneeliseo/PycharmProjects/saucedemo-robot/Tests/lib/Inventory.py


*** Variables ***
#Login Elements
${LOGIN URL}      https://www.saucedemo.com
${BROWSER}        Chrome
${USERNAME_FLD}  //*[@id='user-name']
${PASSWORD_FLD}  //*[@id='password']
${CLICK_BTN}  //*[@id='login-button']
${BASE_DIR}       ${CURDIR}/..
${JSON_FILE}      ${BASE_DIR}/tests/data/product.json


#Inventory Elements
${KEBAB_OPTION}  //*[@id='react-burger-menu-btn']
${PAGE_TITLE}  //*[@id="header_container"]/div[1]/div[2]/div
${SHOPPING_CART_ICON}  //*[@id="shopping_cart_container"]
${PRODUCT_LABEL}  //*[@id="header_container"]/div[2]/span
${SORT_DROPDOWN}  //*[@id="header_container"]/div[2]/div/span/select
${INVENTORY_CONTAINER}  //*[@id="inventory_container"]
${TWITTER_ICON}  //*[@id="page_wrapper"]/footer/ul/li[1]/a
${FB_ICON}  //*[@id="page_wrapper"]/footer/ul/li[2]/a
${LINKEDIN_ICON}  //*[@id="page_wrapper"]/footer/ul/li[3]/a
${FOOTER_TEXT}  //*[@id="page_wrapper"]/footer/div

*** Test Cases ***
The user must be login with valid credentials
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Input Text  ${USERNAME_FLD}  standard_user
    Input Text  ${PASSWORD_FLD}  secret_sauce
    Click Element  ${CLICK_BTN}

The list of available products with correct details and elements should display
    Element Should be visible  ${KEBAB_OPTION}
    Element Text Should Be  ${PAGE_TITLE}  Swag Labs
    Element Should be visible  ${SHOPPING_CART_ICON}
    Element Text Should be  ${PRODUCT_LABEL}  Products
    Element Should be visible  ${SORT_DROPDOWN}
    Element Should be visible  ${INVENTORY_CONTAINER}
    Element Should be visible  ${TWITTER_ICON}
    Element Should be visible  ${FB_ICON}
    Element Should be visible  ${LINKEDIN_ICON}
    Element Text Should be  ${FOOTER_TEXT}  © 2024 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy
    Log    JSON File Path: ${JSON_FILE}

    ${json_data}=    Load JSON From File    ${JSON_FILE}
    ${product_list}=    Get Product List
    Log    ${product_list}





