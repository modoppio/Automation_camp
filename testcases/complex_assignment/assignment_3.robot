*** Test Cases ***
TC-001 Execute Workflow
    @{steps}=    Load Workflow Steps
    Execute Workflow    @{steps}    ${log_progress}