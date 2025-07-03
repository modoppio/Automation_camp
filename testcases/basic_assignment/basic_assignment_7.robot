*** Settings ***
Library      SeleniumLibrary
Variables    ../../resources/variables.yaml

*** Test Cases ***
TC-001 
    Log To Console    ${user.name}, ${user.age}, ${user.city}

*** Keywords ***