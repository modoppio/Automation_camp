*** Settings ***
Resource    ../import.robot

*** Keywords ***
Login with Username and Password
    [Arguments]    ${email}    ${password}
    login.Input Username    ${email}
    login.Input Password    ${password}
    login.Click on login
