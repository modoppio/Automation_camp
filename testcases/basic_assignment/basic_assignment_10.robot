*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 
    @{my_fruits}    Create Fruit List   
    Log To Console    ${my_fruits[0]}

*** Keywords ***
Create Fruit List
    ${fruits}    Create List    apple banana cherry 
    Return From Keyword    ${fruits}