*** Settings ***
Library     SeleniumLibrary


*** Variables ***
@{fruits}    apple    banana    cherry

*** Test Cases ***
TC-001 
    Print Fruits    @{fruits}

*** Keywords ***
Print Fruits
    [Arguments]    @{fruits}
    FOR    ${fruit}    IN    @{fruits} 
            Log To Console    ${fruit}    
    END