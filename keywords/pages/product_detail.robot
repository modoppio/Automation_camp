*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Product to Cart
    SeleniumLibrary.Wait Until Element Is Visible    ${product_detail_locator.btn_add_to_cart}
    SeleniumLibrary.Click Element    ${product_detail_locator.btn_add_to_cart}

Page Should Display Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${product_detail_locator.modal_lbl_add_product_success} 

Close Add Product Success Modal
    SeleniumLibrary.Wait Until Element Is Visible    ${product_detail_locator.modal_btn_add_product_success}
    SeleniumLibrary.Click Element    ${product_detail_locator.modal_btn_add_product_success}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${product_detail_locator.modal_btn_add_product_success}
    