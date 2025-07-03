*** Test Cases ***
TC-001 Validate Permissions
    &{user_data}=    Get User Info    ${user_id}
    Validate User Permissions    &{user_data}    ${required_role}    ${required_access}
