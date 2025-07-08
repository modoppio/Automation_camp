*** Settings ***
Resource    ../keywords/import.robot
Test Setup        common.Open website
Test Teardown      common.Close website

*** Test Cases ***
TC-001 Register new user
    homepage.Go to Login Page
    login.Go to Sign up Page
    signup_feature.Sign up new user    ${user_info.email}    ${user_info.password}
    signup.Page Should Display Success Modal
    signup.Close Signup Success Modal

TC-002 Login with new user and place order
    homepage.Go to Login Page
    login_feature.Login with Username and Password    ${user_info.email}    ${user_info.password}
    login.Page Should Display Success Modal
    login.Close Login Success Modal
    home_feature.Search Product    ${search_info.keyword}
    search.Select Product    ${search_info.product_name}
    product_detail.Add Product to Cart
    product_detail.Page Should Display Success Modal
    product_detail.Close Add Product Success Modal
    homepage.Go to Cart Page
    delivery.Page Should Display User Email
    delivery.Input Name    ${user_info.name}
    delivery.Input Surname    ${user_info.surname}
    delivery.Input Shipping Address    ${user_info.shipping_address}
    delivery.Input Phone Number    ${user_info.phone_no}
    delivery.Click on Pay button
    payment_page.Select Payment Channel    ${payment_info.channel}
    payment_page.Click on Next button
    payment_page.Input Card Number    ${payment_info.card_no}
    payment_page.Input Card Expire Date    ${payment_info.card_exp}
    payment_page.Input Card CVC    ${payment_info.card_cvc}
    payment_page.Input Card Owner    ${payment_info.card_owner}
    payment_page.Click on Confirm Payment
    payment_page.Page Should Display Success Modal
    payment_page.Close Login Success Modal
    payment_page.Page Should Display Payment Complete
    ${order_id}=    payment_page.Get Order ID
    payment_page.Click on Continue Shopping
    homepage.Go to User Page
    user_detail_page.Page Should Display Order    ${order_id}


# Assignment
# Step
# 1. Enter website https://training-platform.doppio-tech.com
# 2. Register new account
# 3. Login with the registered account
# 4. Search product ("phone”)
# 5. add phone to cart
# 6. Fill Delivery info field
# 7. Purchase the product with credit card 4111 1111 1111 1111
# 8. Exp and cvc can be any
# 9. Navigate to my order page
# 10. The order should be created