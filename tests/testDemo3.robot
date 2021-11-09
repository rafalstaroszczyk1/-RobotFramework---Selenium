*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary
#Test Teardown   Close Browser
Test Template   Validate UnSuccesful Login

*** Variable ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***      username      password
Invalid username        Rafal         learning
Invalid password        rahulshetty   Rafal
special charakters      ^&*(          ()__

*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form     ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver     Chrome     executable_path=c:\\selenium_drivers\\chromedriver.exe
    go to  https://www.rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]     ${username}     ${password}
    input text      id:username     ${username}
    input password  id:password     ${password}
    click button    signInBtn

wait until it checks and display error message
    wait until element is visible   ${Error_Message_Login}

Test Template   Validate USuccesful Login
verify error message is correct
    element text should be           ${Error_Message_Login}      Incorrect username/password.


    

