*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Open url
    [Arguments]       ${url}=https://www.google.com/      ${browser}=gc
    Open Browser      ${url}          ${browser}

Input search
    [Arguments]       ${value}
    Input Text        id=APjFqb       ${value}

Return text search
    [Arguments]       ${text}
    ${text_search}    Set Variable   ${text}
    [Return]          ${text_search}