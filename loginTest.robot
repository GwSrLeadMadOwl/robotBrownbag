*** Settings ***
Library    SeleniumLibrary
Resource   ./loginResource.robot
Test Teardown    Close Browser

*** Test Cases ***
Login to the account through the google
    Open google
    login to application    ${email}    ${password}
    
Login to the account through the edge
    Open edge
    login to application    ${email}    ${password}
    