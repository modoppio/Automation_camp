*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 Example Test With Setup And Teardown
    [Setup]    Open Browser    https://example.com    chrome
    [Teardown]    Close Browser
    Log To Console    Test is running