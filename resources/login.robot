*** Variables ***
#username & password
${VALID USER NAME}          demo
${VALID USER PASSWORD}      mode
${INVALID USER NAME}        abc
${INVALID USER PASSWORD}    abc

#Const
${HOST}                   http://localhost:7272/html
${LOGIN FAILURE PATH}     error.html

#Login page element
${LOGIN USERNAME ELE}     username_field
${LOGIN PASSWORD ELE}     password_field
${LOGIN SUBMIT BUTTON}    login_button

#Login success check condition
${LOGIN FAILURE TITLE}           Error Page
${LOGIN FAILURE BODY CONTAIN}    Error Page


*** Keywords ***
Invalid Login
  [Arguments]     ${user}    ${password}
  Input Username And Password     ${user}    ${password}
  Press Login
  Login Failure check

Open Browser With Login Page
  Open Browser    ${HOST}
  Maximize Browser Window

Go to Login Page
  Go To    ${HOST}

Input Username And Password
  [Arguments]     ${user}    ${password}
  Input Text      ${LOGIN USERNAME ELE}         ${user}
  Input Text      ${LOGIN PASSWORD ELE}         ${password}

Press Login
  Click Button    ${LOGIN SUBMIT BUTTON}

Login Failure check
  Location Should Be     ${HOST}/${LOGIN FAILURE PATH}
  Title Should Be        ${LOGIN FAILURE TITLE}
  Page Should Contain    ${LOGIN FAILURE BODY CONTAIN}
