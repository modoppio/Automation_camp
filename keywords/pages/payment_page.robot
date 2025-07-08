*** Settings ***
Library    String
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Select Payment Channel
    [Arguments]    ${payment}
    ${new_locator}    String.Replace String    ${payment_page_locator.rb_payment}    {{payment}}    ${payment}
    SeleniumLibrary.Wait Until Element Is Visible    ${new_locator}    timeout=10s
    SeleniumLibrary.Click Element    ${new_locator}

Click on Next button
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.btn_next}
    SeleniumLibrary.Click Element    ${payment_page_locator.btn_next}

Input Card Number
    [Arguments]    ${card_no}
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.txt_card_no}
    SeleniumLibrary.Input Text    ${payment_page_locator.txt_card_no}    ${card_no}

Input Card Expire Date
    [Arguments]    ${card_exp}
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.txt_card_exp}
    SeleniumLibrary.Input Text    ${payment_page_locator.txt_card_exp}    ${card_exp}

Input Card CVC
    [Arguments]    ${card_cvc}
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.txt_card_cvc}
    SeleniumLibrary.Input Text    ${payment_page_locator.txt_card_cvc}    ${card_cvc}

Input Card Owner
    [Arguments]    ${card_owner}
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.txt_card_owner}
    SeleniumLibrary.Input Text    ${payment_page_locator.txt_card_owner}    ${card_owner}

Click on Confirm Payment
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.btn_confirm}
    SeleniumLibrary.Click Element    ${payment_page_locator.btn_confirm}

Page Should Display Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.modal_lbl_pay_success}

Close Login Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.modal_btn_pay_success}
    SeleniumLibrary.Click Element    ${payment_page_locator.modal_btn_pay_success}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${payment_page_locator.modal_btn_pay_success}

Page Should Display Payment Complete
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.lbl_pay_complete}

Get Order ID
    ${order_detail}=        SeleniumLibrary.Get Text    ${payment_page_locator.lbl_order_detail}
    ${order_detail_lines}=  String.Split String         ${order_detail}          \n
    ${order_id_lines}=      Collections.Get From List   ${order_detail_lines}    0
    ${order_id}=            String.Remove String        ${order_id_lines}         ORDER ID: 
    ${orderid}=             String.Remove String        ${order_id}    ${SPACE}
    [Return]    ${orderid}

Click on Continue Shopping
    SeleniumLibrary.Wait Until Element Is Visible    ${payment_page_locator.btn_con_shopping}
    SeleniumLibrary.Click Element    ${payment_page_locator.btn_con_shopping}