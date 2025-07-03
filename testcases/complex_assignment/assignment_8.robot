*** Test Cases ***
TC-001 Aggregate Financial Data
    &{aggregation_config}=    Load Financial Data Configuration
    Aggregate Financial Data    &{aggregation_config}    ${include_totals}