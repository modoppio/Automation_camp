*** Variables ***
${delivery_locator.lbl_header}    xpath=//div[@class='ant-card-body']/h2[text()='${delivery_translation.header}']
${delivery_locator.txt_name}    xpath=//input[@placeholder='${delivery_translation.name}']
${delivery_locator.txt_surname}    xpath=//input[@placeholder='${delivery_translation.surname}']
${delivery_locator.txt_shipping_address}    xpath=//input[@placeholder='${delivery_translation.shipping_address}']
${delivery_locator.txt_phone_no}    xpath=//input[@placeholder='${delivery_translation.phone_no}']
${delivery_locator.txt_email_digit}    xpath=//input[@placeholder='${delivery_translation.email}']/ancestor::span[contains(@class, 'ant-input-affix-wrapper')]//span[contains(text(),'0 /')]
${delivery_locator.btn_pay}    xpath=//button[@type="button"]/span[text()='${delivery_translation.btn_pay}']