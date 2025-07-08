*** Variables ***
${payment_page_locator.lbl_header}    xpath=//div[@class='payment-selection']/h1[text()='${payment_translation.header}']
${payment_page_locator.rb_payment}    xpath=//span[text()='{{payment}}']
${payment_page_locator.btn_next}    xpath=//span[text()='${payment_translation.btn_next}']
${payment_page_locator.txt_card_no}    id=basic_bin
${payment_page_locator.txt_card_exp}    id=basic_exp
${payment_page_locator.txt_card_cvc}    id=basic_cvc
${payment_page_locator.txt_card_owner}    id=basic_owner
${payment_page_locator.btn_confirm}    xpath=//span[text()='${payment_translation.btn_confirm}']
${payment_page_locator.modal_lbl_pay_success}    xpath=//div[@class='ant-modal-confirm-content' and text()='${payment_translation.success_msg}']
${payment_page_locator.modal_btn_pay_success}    xpath=//div[@class='ant-modal-confirm-btns']/button
${payment_page_locator.lbl_pay_complete}    xpath=//div[@class='success-title' and text()=' ${payment_translation.lbl_payment_complete} ']
${payment_page_locator.lbl_order_detail}    xpath=//div[@class='success-description']
${payment_page_locator.btn_con_shopping}    xpath=//span[text()='${payment_translation.btn_con_shopping}']