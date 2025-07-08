*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Username
    [Arguments]    ${email}
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.txt_username}
    SeleniumLibrary.Input Text    ${login_locator.txt_username}    ${email}

Input Password
    [Arguments]    ${password}
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.txt_password}
    SeleniumLibrary.Input Text    ${login_locator.txt_password}    ${password}

Click on login
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.btn_login}
    SeleniumLibrary.Click Element    ${login_locator.btn_login}

Page Should Display Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.modal_lbl_login_success}

Close Login Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.modal_btn_login_success}
    SeleniumLibrary.Click Element    ${login_locator.modal_btn_login_success}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${login_locator.modal_btn_login_success}

Go to Sign up Page
    SeleniumLibrary.Wait Until Element Is Visible    ${login_locator.btn_sign_up}
    SeleniumLibrary.Click Element    ${login_locator.btn_sign_up}
    SeleniumLibrary.Wait Until Element Is Visible    ${signup_locator.lbl_header}
