*** Settings ***
Library    String
Library    SeleniumLibrary

*** Keywords ***
Click on Pending Payment Status 
    SeleniumLibrary.Wait Until Element Is Visible    ${user_detail_locator.tab_order_stt}
    SeleniumLibrary.Click Element    ${user_detail_locator.tab_order_stt}

Page Should Display Order
    [Arguments]    ${orderid}
    ${new_locator}=    String.Replace String    ${user_detail_locator.lbl_order_id}    {{order_id}}    ${orderid}
    SeleniumLibrary.Wait Until Element Is Visible    ${new_locator}