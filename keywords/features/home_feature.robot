*** Settings ***
Resource    ../import.robot

*** Keywords ***
Search Product
    [Arguments]    ${product}
    homepage.Input Search    ${product}
    homepage.Click on Search button