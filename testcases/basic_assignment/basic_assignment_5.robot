*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
TC-001 
    Print All Items    apple    banana    cherry

*** Keywords ***
Print All Items
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}    
       Log To Console    ${item} 
    END