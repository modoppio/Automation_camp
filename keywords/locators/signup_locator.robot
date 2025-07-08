*** Variables ***
${signup_locator.lbl_header}    xpath=//div[@class='header-login']/h1[text()='${signup_translation.header}']
${signup_locator.txt_email}     id=basic_username
${signup_locator.txt_password}    id=basic_password
${signup_locator.txt_confirm_password}    id=basic_confirmPassword
${signup_locator.btn_signup}    xpath=//button[@type='submit']
${signup_locator.modal_lbl_signup_success}    xpath=//div[@class='ant-modal-confirm-content' and text()='${signup_translation.success_msg}']
${signup_locator.modal_btn_signup_success}    xpath=//div[@class='ant-modal-confirm-btns']/button