*** Settings ***
Library      SeleniumLibrary
Variables    ../../resources/config.yaml

*** Test Cases ***
TC-001 
    Open Browser    ${app_url} 
    Input Text    username_field    ${credentials.username} 
    Input Text    password_field    ${credentials.password}

*** Keywords ***