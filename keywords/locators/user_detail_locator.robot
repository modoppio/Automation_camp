*** Variables ***
${user_detail_locator.lbl_my_order}    xpath=//div[@class="ant-card-head-title" and text()='${order_detail_translation.header}']
${user_detail_locator.tab_order_stt}    xpath=//div[@role='tab' and text()='{{order_status}}']
${user_detail_locator.lbl_order_id}    xpath=//td[@class="ant-table-cell" and text()='${order_detail_translation.order_status_pending}']
