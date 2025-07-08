*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go to Login Page
    SeleniumLibrary.Wait Until Element Is Visible    ${homepage_locator.btn_user}
    SeleniumLibrary.Click Element    ${homepage_locator.btn_user}
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.login_form}

Go to Cart Page
    SeleniumLibrary.Wait Until Element Is Visible    ${homepage_locator.btn_cart}
    SeleniumLibrary.Click Element    ${homepage_locator.btn_cart}
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.lbl_header}

Input Search
    [Arguments]    ${product}
    SeleniumLibrary.Wait Until Element Is Visible    ${homepage_locator.txt_search}
    SeleniumLibrary.Input Text    ${homepage_locator.txt_search}    ${product}

Click on Search button
    SeleniumLibrary.Wait Until Element Is Visible    ${homepage_locator.btn_search}
    SeleniumLibrary.Click Element    ${homepage_locator.btn_search}

Go to User Page
    SeleniumLibrary.Wait Until Element Is Visible    ${homepage_locator.btn_user}
    SeleniumLibrary.Click Element    ${homepage_locator.btn_user}
    SeleniumLibrary.Wait Until Element Is Visible    ${user_detail_locator.lbl_my_order}

