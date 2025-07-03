*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 Age Verification 
    ${age}    Set Variable    18 
    Run Keyword If    ${age}>18    Log To Console    You are an adult ...    ELSE IF    ${age} == 18          Log To Console    You just became an adult ...    ELSE    Log To Console    You are underage

