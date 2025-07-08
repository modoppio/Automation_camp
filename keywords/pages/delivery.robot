*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Page Should Display User Email
    SeleniumLibrary.Wait Until Element Is Not Visible    ${delivery_locator.txt_email_digit}
Input Name
    [Arguments]    ${name}
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.txt_name}
    SeleniumLibrary.Input Text    ${delivery_locator.txt_name}    ${name}

Input Surname
    [Arguments]    ${surname}
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.txt_surname}
    SeleniumLibrary.Input Text    ${delivery_locator.txt_surname}    ${surname}

Input Shipping Address
    [Arguments]    ${address}
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.txt_shipping_address}
    SeleniumLibrary.Input Text    ${delivery_locator.txt_shipping_address}    ${address}

Input Phone Number
    [Arguments]    ${phone_no}
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.txt_phone_no}
    SeleniumLibrary.Input Text    ${delivery_locator.txt_phone_no}    ${phone_no}

Click on Pay button
    SeleniumLibrary.Wait Until Element Is Visible    ${delivery_locator.btn_pay}
    SeleniumLibrary.Click Element    ${delivery_locator.btn_pay}
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.lbl_header}