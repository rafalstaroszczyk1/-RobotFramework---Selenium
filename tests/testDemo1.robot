*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser

*** Variable ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver     Chrome     executable_path=c:\\selenium_drivers\\chromedriver.exe
    go to  https://www.rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    input text      id:username     rahulshettyacademy
    input password  id:password     12345678
    click button    signInBtn

wait until it checks and display error message
    wait until element is visible   ${Error_Message_Login}

verify error message is correct
    element text should be           ${Error_Message_Login}      Incorrect username/password.


    

