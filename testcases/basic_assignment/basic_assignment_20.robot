*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
Test With Tag 1
    [Tags]    smoke
    Log To Console    This is a smoke test

Test With Tag 2
    [Tags]    regression
    Log To Console    This is a regression test

Test With Multiple Tags
    [Tags]    smoke    critical
    Log To Console    This is a smoke and critical test