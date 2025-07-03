*** Test Cases ***
TC-001 Generate Customer Profile
    &{customer_data}=    Get Customer Data
    Generate Customer Profile    &{customer_data}    ${output_format}