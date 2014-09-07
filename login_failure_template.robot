*** Settings ***
Library           Selenium2Library

#Setup before testing
Test Setup        Go to Login Page

#suite setup
Suite Setup       Open Browser With Login Page

#Before exit test
Suite Teardown     Close Browser

Resource           resources/login.robot


*** Testcases ***                        USERNAME                    PASSWORD
Invalid Login Template
  [Template]    Invalid Login Template
  #Username------------------|Password----------------|

  ${EMPTY}                    ${EMPTY}
  ${VALID USER PASSWORD}      ${VALID USER PASSWORD}
  ${INVALID USER PASSWORD}    ${INVALID USER PASSWORD}
  ${VALID USER NAME}          ${EMPTY}
  ${VALID USER NAME}          ${INVALID USER PASSWORD}
  ${INVALID USER NAME}        ${EMPTY}
  ${INVALID USER NAME}        ${INVALID USER PASSWORD}
  ${INVALID USER NAME}        ${VALID USER PASSWORD}

*** Keywords ***
Invalid Login Template
  [Arguments]     ${user}    ${password}
  Input Username And Password     ${user}    ${password}
  Press Login
  Login Failure check
  Go To           ${HOST}
