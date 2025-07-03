*** Test Cases ***
TC-001 Process Data Pipeline
    &{pipeline_config}=    Load Pipeline Configuration    @{stages}    ${input_format}    ${output_format}
    Process Data Pipeline    &{pipeline_config}    ${execute_in_parallel}0