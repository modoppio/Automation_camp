*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
TC-001 
    Greet User    John

*** Keywords ***
Greet User
    [Arguments]    ${name}="Guest"
    Log To Console    "Hello, ${name}"