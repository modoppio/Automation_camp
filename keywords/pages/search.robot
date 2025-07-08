*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Select Product
    [Arguments]    ${product_name}
    ${new_locator}=    String.Replace String    ${search_locator.product}    {{product_name}}    ${product_name}
    SeleniumLibrary.Wait Until Element Is Visible    ${new_locator}
    SeleniumLibrary.Click Element    ${new_locator}