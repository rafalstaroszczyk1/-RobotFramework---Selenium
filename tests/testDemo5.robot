*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     tests.customLibraries
Test Setup      open the browser with the Mortgage payment url
#Test Teardown   Close Browser session
Resource        resource.robot

*** Variable ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
#Validate UnSuccesful Login
#    Fill the login Form     ${user_name}        ${invalid_password}
#    wait until element is located in the page   ${Error_Message_Login}
#    verify error message is correct


Validate Cards display in the Shopping Page
    Fill the login Form     ${user_name}        ${valid_password}
    wait until element is located in the page   ${Shop_page_load}
    Verify Card titles in the Shop page
    hello words
    Select the Card      Blackberry

Select the Form and navigate to Child window
    Fill the Login Details and Login Form

*** Keywords ***

Fill the login Form
    [arguments]     ${username}     ${password}
    input text      id:username     ${username}
    input password  id:password     ${password}
    click button    signInBtn

wait until element is located in the page
    [arguments]     ${element}
    wait until element is visible   ${element}

verify error message is correct
    element text should be           ${Error_Message_Login}      Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =   Create list     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =    get webelements    css:.card-title
    @{actualList} =     Create list
    FOR     ${element}  IN    @{elements}
        Log    ${element.text}
        Append To List  ${actualList}   ${element.text}

    END
    lists should be equal    ${expectedList}    ${actualList}

Select the Card
    [arguments]     ${cardName}
    ${elements} =    get webelements    css:.card-title
    ${index} =  Set Variable    1
       FOR   ${element}   IN    @{elements}
           Exit for loop if    '${cardName}' == '${element.text}'
           ${index} =  Evaluate  ${index} + 1
       END
    click button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and Login Form
    input text      id:username     ${user_name}
    input password  id:password     ${invalid_password}
    click element   css:input[value='user']
    wait until element is visible   css:.modal-body
    click button   id:okayBtn
    click button   id:okayBtn
    select from list by value      css:select.form-control     teach
    select checkbox     terms
    checkbox should be selected     terms
