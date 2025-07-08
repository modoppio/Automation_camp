*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Email
    [Arguments]    ${email}
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.txt_email}
    SeleniumLibrary.Input Text    ${signup_locator.txt_email}    ${email}

Input Password
    [Arguments]    ${password}
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.txt_password}
    SeleniumLibrary.Input Text    ${signup_locator.txt_password}    ${password}

Input Confirm Password
    [Arguments]    ${password}
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.txt_confirm_password}
    SeleniumLibrary.Input Text    ${signup_locator.txt_confirm_password}    ${password}

Click on signup
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.btn_signup}
    SeleniumLibrary.Click Element    ${signup_locator.btn_signup}

Page Should Display Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.modal_lbl_signup_success}

Close Signup Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.modal_btn_signup_success}
    SeleniumLibrary.Click Element    ${signup_locator.modal_btn_signup_success}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${signup_locator.modal_btn_signup_success}
    