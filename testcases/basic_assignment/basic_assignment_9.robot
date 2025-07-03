*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 
    ${square}    Calculate Square   4
    Should Be Equal As Integers    ${square}    16

*** Keywords ***
Calculate Square
    [Arguments]    ${number}
    ${result}    Evaluate    ${number} * ${number}
    Return From Keyword    ${result}