*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
TC-001 Loop Control Example 
    FOR    ${number}    IN RANGE    1    10
        Run Keyword If    ${number} == 5    Exit For Loop
        Run Keyword If    ${number} == 3    Continue For Loop    
        Log To Console    ${number}
    END
