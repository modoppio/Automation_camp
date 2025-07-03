*** Settings ***
Library      SeleniumLibrary
Suite Teardown    Log    Suite Teardown is running

*** Test Cases ***
Test Case With Teardown
    [Teardown]    Log    Test Case Teardown is running
    Keyword With Teardown

*** Keywords ***
Keyword With Teardown
    [Teardown]    Log    Keyword Teardown is running
    Log    Running the keyword