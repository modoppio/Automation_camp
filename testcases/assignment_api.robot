
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem


*** Test Cases ***
TC-001 Verify when input wrong username or password, API should return error
    #call API with wrong username / password
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio222  password=12345
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=401
    Should Be Equal     ${resp.json()['status']}    error
    Should Be Equal     ${resp.json()['message']}    invalid username or password

TC-002 Verify That Can Get Asset List From Get API correctly
    #call API to login and get token 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    #call Get API to get asset (with token) and verify status code is 200
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    #check response contains at least 1 assets
    ${count}=       Get Length  ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}

TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token 
    Create Session      assetSession             http://localhost:8082
    # check response code = 401
    ${get_resp}=    GET On Session      assetSession    /assets    expected_status=401
    # check error message
    Should Be Equal     ${get_resp.json()['status']}    error
    Should Be Equal     ${get_resp.json()['message']}    you do not have access to this resource


TC-004 Verify that create asset API can work correctly 
    #call create asset API (POST /assets) with valid token
    Create Session      assetSession             http://localhost:8082
    ${token_request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${token_resp}=    POST On Session     assetSession    /login      json=${token_request_body}    expected_status=200
    ${token}=   Set Variable    ${token_resp.json()['message']}
    ${create_request_body}=    Create Dictionary   assetId=a99c  assetName=Macpro m1    assetType=${1}    inUse=${True}
    ${create_header}=    Create Dictionary       token=${token}
    # check response code = 200
    ${create_resp}=    POST On Session     assetSession    /assets      json=${create_request_body}    headers=${create_header}    expected_status=200
    # check status message = success
    Should Be Equal     ${create_resp.json()['status']}    success
    # check that created asset can be returned from GET /assets
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${create_header}
    ${asset_count}=    Get Length  ${get_resp.json()}
    ${index}=    Set Variable    0
    ${match_found}=    Set Variable    false
    FOR    ${index}    IN RANGE    ${asset_count}
        ${item}=    Set Variable    ${get_resp.json()}[${index}]
        ${asset_detail}    Create Dictionary   assetId=${item['assetId']}  assetName=${item['assetName']}    assetType=${item['assetType']}    inUse=${item['inUse']}
        Run Keyword If    '${asset_detail['assetId']}' == '${create_request_body['assetId']}'    
        ...    Run Keywords
        ...    Set Test Variable    ${match_found}    true
        ...    AND    Should Be Equal    ${asset_detail}    ${create_request_body}
        ...    AND    Exit For Loop
    END
    Should Be Equal    ${match_found}    true

TC-005 Verify that cannot create asset with duplicated ID 
    #call create asset with valid token but use duplicate asset ID
    Create Session      assetSession             http://localhost:8082
    ${token_request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${token_resp}=    POST On Session     assetSession    /login      json=${token_request_body}    expected_status=200
    ${token}=   Set Variable    ${token_resp.json()['message']}
    ${create_request_body}=    Create Dictionary   assetId=a99c  assetName=Macpro m1    assetType=${1}    inUse=${True}
    ${create_header}=    Create Dictionary       token=${token}
    ${create_resp}=    POST On Session     assetSession    /assets      json=${create_request_body}    headers=${create_header}
    # check status message
    Should Be Equal     ${create_resp.json()['status']}    failed
    # check error message 
    Should Be Equal     ${create_resp.json()['message']}    id : ${create_request_body['assetId']} is already exists , please try with another id
    # check that no duplicated asset returned from GET /assets
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${create_header}
    ${asset_count}=    Get Length  ${get_resp.json()}
    ${index}=    Set Variable    0
    ${asset_ids}    Create List
    FOR    ${index}    IN RANGE    ${asset_count}
        ${item}=    Set Variable    ${get_resp.json()}[${index}]
        Append To List  ${asset_ids}    ${item['assetId']}
    END
    # Log To Console    ${asset_ids}
    ${has_duplicates}=    Evaluate    len(set(${asset_ids})) != len(${asset_ids})
    Should Be Equal     ${has_duplicates}    ${False}

TC-006 Verify that modify asset API can work correctly 
    #call modify asset with valid token and try to change name of some asset
    Create Session      assetSession             http://localhost:8082
    ${token_request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${token_resp}=    POST On Session     assetSession    /login      json=${token_request_body}    expected_status=200
    ${token}=   Set Variable    ${token_resp.json()['message']}
    ${modify_request_body}=    Create Dictionary   assetId=a99c  assetName=Macpro m1    assetType=${1}    inUse=${True}
    ${modify_header}=    Create Dictionary       token=${token}
    ${modify_resp}=    PUT On Session     assetSession    /assets      json=${modify_request_body}    headers=${modify_header}    expected_status=200
    #check status message = success
    Should Be Equal     ${modify_resp.json()['status']}    success
    Should Be Equal     ${modify_resp.json()['message']}    remark: asset id will not be changed in any cases
    #call get api to check that asset Name has been changed
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${modify_header}
    ${asset_count}=    Get Length  ${get_resp.json()}
    ${index}=    Set Variable    0
    ${match_found}=    Set Variable    false
    FOR    ${index}    IN RANGE    ${asset_count}
        ${item}=    Set Variable    ${get_resp.json()}[${index}]
        ${asset_detail}    Create Dictionary   assetId=${item['assetId']}  assetName=${item['assetName']}    assetType=${item['assetType']}    inUse=${item['inUse']}
        Run Keyword If    '${asset_detail['assetId']}' == '${modify_request_body['assetId']}'    
        ...    Run Keywords
        ...    Set Test Variable    ${match_found}    true
        ...    AND    Should Be Equal    ${asset_detail}    ${modify_request_body}
        ...    AND    Exit For Loop
    END
    Should Be Equal    ${match_found}    true

TC-007 Verify that delete asset API can work correctly
    #call delete asset
    Create Session      assetSession             http://localhost:8082
    ${token_request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${token_resp}=    POST On Session     assetSession    /login      json=${token_request_body}    expected_status=200
    ${token}=   Set Variable    ${token_resp.json()['message']}
    ${del_header}=    Create Dictionary    token=${token}
    ${del_resp}=    DELETE On Session      assetSession    /assets/a99c    headers=${del_header}    expected_status=200
    Should Be Equal     ${del_resp.json()['status']}    success
    #call GET to check that asset has been deleted
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${del_header}
    ${asset_count}=    Get Length  ${get_resp.json()}
    ${index}=    Set Variable    0
    ${asset_ids}    Create List
    FOR    ${index}    IN RANGE    ${asset_count}
        ${item}=    Set Variable    ${get_resp.json()}[${index}]
        ${asset_id}=    Set Variable    ${item['assetId']}
        ${match_found}    Set Variable    ${False}
        Run Keyword If    '${asset_id}' == 'a99c'
        ...    Set Variable    ${match_found}    ${True}
        Run Keyword If    ${match_found} == ${True}    Exit For Loop
    END
    Should Be Equal     ${match_found}    ${False}
    

TC-008 Verify that cannot delete asset which ID does not exists 
    #call delete asset with non-existing id
    Create Session      assetSession             http://localhost:8082
    ${token_request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${token_resp}=    POST On Session     assetSession    /login      json=${token_request_body}    expected_status=200
    ${token}=   Set Variable    ${token_resp.json()['message']}
    ${del_header}=    Create Dictionary    token=${token}
    ${del_resp}=    DELETE On Session      assetSession    /assets/a11111    headers=${del_header}    expected_status=200 
    #check error message 
    Should Be Equal     ${del_resp.json()['status']}    failed
    Should Be Equal     ${del_resp.json()['message']}    cannot find this id in database




