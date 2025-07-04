*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${html_path}    file:///Users/modoppio/Desktop/Automation_camp/Xpath%20exercises/Assignment.html

*** Test Cases ***
TC-001 
    Open Browser    ${html_path}    browser=chrome      #options=add_experimental_option("detach", True)
    Check Subtotal In Cart    0
    Check Product Price    Fish Sauce    50
    Check Qty In Cart    0
    Add Product To Cart    Fish Sauce
    Get All Product That Price Less Than    50
    Add Product To Cart    Sugar
    Remove Product In Cart    Fish Sauce
    Get All Product That Price Between    20    50

*** Keywords ***
Check Subtotal In Cart
    [Arguments]    ${subtotal}
    Wait Until Element Is Visible    id=cart-button
    Click Element    id=cart-button
    Wait Until Element Is Visible    id=cart-modal
    Element Text Should Be    id=cart-total    Total: ${subtotal} THB
    Click Element    id=close-cart

Check Product Price
    [Arguments]    ${product_name}    ${expected_price}
    Wait Until Element Is Visible    xpath=//div[@class="product"][1]
    ${product_price}=    Get Text    xpath=//div[@class="product"][h3="${product_name}"]/div[@class="price"]/span
    Should Be Equal    ${product_price}    ${expected_price}

Check Qty In Cart
    [Arguments]    ${expected_qty}
    Wait Until Element Is Visible    id=cart-button
    Element Text Should Be    id=cart-button    Cart (${expected_qty})

Add Product To Cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    xpath=//div[@class="product"][h3[text()="${product_name}"]]/button[text()="Add to Cart"]
    Click Element    xpath=//div[@class="product"][h3[text()="${product_name}"]]/button[text()="Add to Cart"]

Get All Product That Price Less Than
    [Arguments]    ${price}
    ${number}=       Get Element Count         xpath=//div[@id="product-list"]/div[@class="product"]
    # Log To Console    Total products found: ${number}
    @{selected_product}=    Create List
    @{non_selected_product}=    Create List
    ${index}    Evaluate    1
    FOR    ${index}    IN RANGE    1    ${number}+1
        ${product_name}=    Get Text    xpath=//div[@class="product"][${index}]/h3
        ${product_price}=    Get Text    xpath=//div[@class="product"][h3="${product_name}"]/div[@class="price"]/span
        Run Keyword If    ${product_price} <= ${price}
        ...    Append To List    ${selected_product}    ${product_name}
        ...  ELSE
        ...    Append To List    ${non_selected_product}    ${product_name}
    END
    Log To Console    Product <= ${price} : ${selected_product}
    # Log To Console    Product out condition: ${non_selected_product}

Remove Product In Cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    id=cart-button
    Click Element    id=cart-button
    Wait Until Element Is Visible    id=cart-modal
    Click Element    xpath=//ul[@id="cart-items"]/li[contains(text(),"${product_name}")]/button
    Click Element    id=close-cart

Get All Product That Price Between
    [Arguments]    ${min_price}    ${max_price}
    ${number}=       Get Element Count         xpath=//div[@id="product-list"]/div[@class="product"]
    # Log To Console    Total products found: ${number}
    @{selected_product}=    Create List
    @{non_selected_product}=    Create List
    ${index}    Evaluate    1
    FOR    ${index}    IN RANGE    1    ${number}+1
        ${product_name}=    Get Text    xpath=//div[@class="product"][${index}]/h3
        ${product_price}=    Get Text    xpath=//div[@class="product"][h3="${product_name}"]/div[@class="price"]/span
        Run Keyword If    ${product_price} > ${min_price} and ${product_price} < ${max_price}
        ...    Append To List    ${selected_product}    ${product_name}
        ...  ELSE
        ...    Append To List    ${non_selected_product}    ${product_name}
    END
    Log To Console    ${min_price} < Product < ${max_price} : ${selected_product}
    # Log To Console    Product out condition: ${non_selected_product}







