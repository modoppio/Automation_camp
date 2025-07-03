*** Test Cases ***
TC-001 Perform Data Migration
    &{migration_config}=    Configure Data Migration
    ${run_in_dry_mode}    Set Variable    true
    Perform Data Migration    &{migration_config}    ${run_in_dry_mode}