*** Settings ***
Resource    ../import.robot

*** Keywords ***
Sign up new user
    [Arguments]    ${email}    ${password}
    signup.Input Email    ${email}
    signup.Input Password    ${password}
    signup.Input Confirm Password    ${password}
    signup.Click on signup
