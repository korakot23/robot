*** Settings ***
Library           Selenium2Library
#Setup before testing
Test Setup        ไปที่ localhost หน้า Login
#Before exit test
Test Teardown     Close Browser

*** Variables ***
#username & password
${USER NAME}        demo
${USER PASSWORD}    mode

#Const
${HOST}    http://localhost:7272/html
${LOGIN SUCCESS PATH}     welcome.html

#Login page element
${LOGIN USERNAME ELE}     username_field
${LOGIN PASSWORD ELE}     password_field
${LOGIN SUBMIT BUTTON}    login_button

#Login success check condition
${LOGIN SUCCESS TITLE}           Welcome Page
${LOGIN SUCCESS BODY CONTAIN}    Welcome Page
${LOGIN SUCCESS LOGOUT TEXT}     logout
${LOGIN SUCCESS LOGOUT LINK}     .


*** Testcases ***
Login Success
  [Documentation]     A test suite with a single test for valid login.\n
  ...               This test has a workflow that is created using keywords in
  ...               the imported resource file.
  ใส่ username และ password
  กดปุ่ม Login
  เชคว่า Login สำเร็จ
  [Teardown]    Close Browser

*** Keywords ***
ไปที่ localhost หน้า Login
  Open Browser    ${HOST}

ใส่ username และ password
  Input Text      ${LOGIN USERNAME ELE}         ${USER NAME}
  Input Text      ${LOGIN PASSWORD ELE}         ${USER PASSWORD}

กดปุ่ม Login
  Click Button    ${LOGIN SUBMIT BUTTON}

เชคว่า Login สำเร็จ
  Location Should Be     ${HOST}/${LOGIN SUCCESS PATH}
  Title Should Be        ${LOGIN SUCCESS TITLE}
  Page Should Contain    ${LOGIN SUCCESS BODY CONTAIN}
  Page Should Contain    ${LOGIN SUCCESS LOGOUT TEXT}
  Page Should Contain Link    ${LOGIN SUCCESS LOGOUT LINK}
