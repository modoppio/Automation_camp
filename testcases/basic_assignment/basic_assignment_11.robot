*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 
    &{user}=    Create User Info
    Log To Console    Name:${user.name}

*** Keywords ***
Create User Info
    &{user_info}=    Create Dictionary    name=John    age=30    city=Bangkok
    Return From Keyword    ${user_info}