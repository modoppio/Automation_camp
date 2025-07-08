*** Variables ***
${product_detail_locator.btn_add}    xpath=//div[@class='control-group']//span[text()='+']
${product_detail_locator.btn_deduct}    xpath=//div[@class='control-group']//span[text()='-']
${product_detail_locator.btn_add_to_cart}    xpath=//div[@class='cart-add']//span[text()='${product_detail_translation.add_to_cart}']
${product_detail_locator.modal_lbl_add_product_success}    xpath=//div[@class='ant-modal-confirm-content' and text()='${product_detail_translation.success_msg}']
${product_detail_locator.modal_btn_add_product_success}    xpath=//div[@class='ant-modal-confirm-btns']/button