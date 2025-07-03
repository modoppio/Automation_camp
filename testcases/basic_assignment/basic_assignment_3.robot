*** Settings ***
Library     SeleniumLibrary


*** Variables ***
&{user_info}    name=name    age=age    city=city

*** Test Cases ***
TC-001 
    Print User Info    &{user_info}

*** Keywords ***
Print User Info
    [Arguments]    &{user_info}
    Log To Console    Log Name: ${user_info["name"]}
    Log To Console    Log Age: ${user_info["age"]}
    Log To Console    Log City: ${user_info["city"]}