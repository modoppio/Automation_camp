*** Variables ***
${login_locator.login_form}    class=form-login
${login_locator.txt_username}    xpath=//label[@title='Username']/ancestor::div[contains(@class, 'ant-form-item')]//input
${login_locator.txt_password}    xpath=//label[@title='Password']/ancestor::div[contains(@class, 'ant-form-item')]//input
${login_locator.btn_login}       xpath=//button[@type='submit']/span[text()='${login_translation.btn}']
${login_locator.modal_lbl_login_success}    xpath=//div[@class='ant-modal-confirm-content' and text()='${login_translation.success_msg}']
${login_locator.modal_btn_login_success}    xpath=//div[@class='ant-modal-confirm-btns']/button
${login_locator.btn_sign_up}    xpath=//div[@class='ant-form-item-control-input-content']/button[@type='button']