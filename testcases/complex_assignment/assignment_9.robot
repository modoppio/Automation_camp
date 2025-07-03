*** Test Cases ***
TC-001 Configure Access Control
    Define User Roles    &{rules}
    Load Access Rules    ${default_access}
    &{aggregation_config}=    Create Dictionary
        rules=${rules}
        default_access=${default_access}
    Configure Access Control    &{aggregation_config}    ${include_totals}