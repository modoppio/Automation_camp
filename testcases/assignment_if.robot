*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${score}    90

*** Test Cases ***
TC-001 
    Grade for    ${score}

*** Keywords ***
Grade for
    [Arguments]    ${value}
    IF         ${value} >= 90 
        Log To Console    A
    ELSE IF    ${value} >= 80
        Log To Console    B
    ELSE IF    ${value} >= 70
        Log To Console    C
    ELSE IF    ${value} >= 60
        Log To Console    D
    ELSE IF    ${value} < 60
        Log To Console    F
    END