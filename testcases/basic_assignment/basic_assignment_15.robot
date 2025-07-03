*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 Error Handling Example
    ${status}    Run Keyword And Return Status    Click Element    invalid_locator
    Log To Console    Status: ${status}
    Run Keyword And Ignore Error    Input Text    invalid_locator    value
    Log To Console    Ignored the error and continued