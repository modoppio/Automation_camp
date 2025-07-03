*** Test Cases ***
TC-001 Fetch Report Data
    Set Global Configuration
    &{query_params}=    Create Dictionary
        data_source=${data_source}
        filter_criteria=@{filter_criteria}
        sort_order=${sort_order}
    Fetch Report Data    &{query_params}    ${return_format}