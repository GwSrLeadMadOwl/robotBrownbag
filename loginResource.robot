*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                https://www.basharacare.com/ae_en
${title}              BasharaCare : Your Professional Skincare Store. Free Products Delivery Dubai Abu Dhabi UAE

${login_button}       button.accountTrigger-trigger-cWR
${email}              s.rogozinnikovs@accenture.com
${invalid_email}      notuser@yahoo.com
${email_input}        input.textInput-input-1BC
${password}           Qwerty1234
${invalid_password}   cqsasdcqdfq
${password_input}     .password-root-VJi input.textInput-input-1BC
${signin_button}      button.button-root_highPriority-WS4
${signout_button}     button.accountMenuItems-signOut-ciI
${loading_icon}       div.accountMenu-loading--sY

${received_msg}        
${warning_msg}        The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.
${warningMsg_locator}    div.errorMessage-root-uB8 .errorMessage-errorMessage-pas

*** Keywords ***
Open google
    Open Current Browser    chrome

Open edge
    Open Current Browser    edge

Open Current Browser
    [Arguments]    ${browserpage}
    Open Browser    ${url}    ${browserpage}
    Maximize Browser Window
    Title should be    ${title}

login to application
    [Arguments]    ${argemail}    ${argpassword}
    Click Button    css:${login_button}
    Input Text    css:${email_input}    ${argemail}
    Input Password    css:${password_input}    ${argpassword}
    Click Button    css:${signin_button}
    Wait Until Element Is Not Visible    css:${loading_icon}    timeout=30

Check errors of login process
    [Arguments]    ${argemail}    ${argpassword}
    login to application    ${argemail}    ${argpassword}
    ${received_msg}=    Get Text    css:${warningMsg_locator}
    Should Be Equal As Strings    ${received_msg}    ${warning_msg}
