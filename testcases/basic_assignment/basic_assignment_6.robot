*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
TC-001 
    Set Global Variable    ${GLOBAL_VAR}    Global Value
    Use Local Variable

*** Keywords ***
Use Local Variable
    ${LOCAL_VAR}    Set Variable    Local Value
    Log To Console    Local Variable inside Keyword: ${LOCAL_VAR}
    Log To Console    Global Variable inside Keyword: ${GLOBAL_VAR}