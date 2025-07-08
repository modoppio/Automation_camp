*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open website
    SeleniumLibrary.Open Browser    ${url}    gc    options=add_experimental_option("detach", True)
    SeleniumLibrary.Maximize Browser Window

Close website
    SeleniumLibrary.Close all browsers



