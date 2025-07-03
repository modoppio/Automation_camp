*** Settings ***
Library     SeleniumLibrary


*** Variables ***
@{hero}    ironman    batman    captain     superman       hulk     shazam      thor    flash    blackwidow    wonder woman    hawkeye
${last_name}    blackwidow

*** Test Cases ***
TC-001 Filter hero
    Loop Until    ${last_name}    @{hero}

*** Keywords ***
Loop Until
    [Arguments]    ${name}    @{value}
    ${i}       Set Variable    0
    FOR    ${index}    IN    @{value}
        IF    ${i}%2 == 0
            Log To Console    ${index}
        END
        Exit For Loop If    "${index}"=="${name}"
        ${i}       Evaluate    ${i}+1
    END