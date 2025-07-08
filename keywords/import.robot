*** Settings ***
Library    SeleniumLibrary
Library    String

Variables    ../resources/testdata/testdata.yaml
Variables    ../resources/setting/${env}/setting.yaml
Variables    ../resources/translation/${lang}.yaml

Resource    common.robot

Resource    ./pages/homepage.robot
Resource    ./pages/login.robot
Resource    ./pages/signup.robot
Resource    ./pages/search.robot
Resource    ./pages/product_detail.robot
Resource    ./pages/delivery.robot
Resource    ./pages/payment_page.robot
Resource    ./pages/user_detail_page.robot

Resource    ./locators/homepage_locator.robot
Resource    ./locators/login_locator.robot
Resource    ./locators/signup_locator.robot
Resource    ./locators/search_locator.robot
Resource    ./locators/product_detail_locator.robot
Resource    ./locators/delivery_locator.robot
Resource    ./locators/payment_page_locator.robot
Resource    ./locators/user_detail_locator.robot

Resource    ./features/signup_feature.robot
Resource    ./features/login_feature.robot
Resource    ./features/home_feature.robot