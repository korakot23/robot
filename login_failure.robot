*** Settings ***
Library           Selenium2Library

#Setup before testing
Test Setup        Go to Login Page

#test template
Test Template     Invalid Login

#suite setup
Suite Setup       Open Browser With Login Page

#Before exit test
Suite Teardown     Close Browser

#resource
Resource           resources/login.robot

*** Testcases ***                        USERNAME                    PASSWORD
username empty password empty            ${EMPTY}                    ${EMPTY}
username empty password correct          ${VALID USER PASSWORD}      ${VALID USER PASSWORD}
username empty password incorrect        ${INVALID USER PASSWORD}    ${INVALID USER PASSWORD}
username correct password empty          ${VALID USER NAME}          ${EMPTY}
username correct password incorrect      ${VALID USER NAME}          ${INVALID USER PASSWORD}
username incorrect password empty        ${INVALID USER NAME}        ${EMPTY}
username incorrect password incorrect    ${INVALID USER NAME}        ${INVALID USER PASSWORD}
username incorrect password correct      ${INVALID USER NAME}        ${VALID USER PASSWORD}
