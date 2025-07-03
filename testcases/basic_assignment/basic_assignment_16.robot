*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 Test Factorial Calculation 
    ${result}    Calculate Factorial    5    
    Should Be Equal As Integers   ${result}    120

*** Keywords ***
Calculate Factorial
    [Arguments]    ${number}
    Run Keyword If    ${number} == 1    Return From Keyword    1
    ${value}       Evaluate    ${number} - 1
    ${previous}    Calculate Factorial    ${value}
    ${result}      Evaluate    ${number} * ${previous}
    Return From Keyword    ${result}