*** Settings ***
Library    SeleniumLibrary
Resource   ./loginResource.robot
Suite Setup    Open google
Suite Teardown    Close Browser
Test Template    Check errors of login process

*** Test Cases ***    email    password
Invalid email                   ${invalid_email}    ${password}
Invalid password                ${email}            ${invalid_password}
invalid email and password      ${invalid_email}    ${invalid_password}

