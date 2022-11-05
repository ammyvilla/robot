*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${url}   http://test.port80.me:3000/login
${browser}   Chrome
${username}   tester01
${username_invalid}   terte1
${password}   test123456
${password_invalid}   test123

*** Test Cases ***
1. Login Success
   [tags]   success
   Mark True Condition
   Set Selenium Implicit Wait   3
   Input Username   ${username}
   Input Password   ${password}
   Click Button Login
   Wait Until Page Contains   ภาพรวม
   Close Browser

2. Login Fail Input Username Wrong
   [tags]   fail
   Mark True Condition
   Set Selenium Implicit Wait   3
   Input Username   ${username_invalid}
   Input Password   ${password}
   Click Button Login
   Wait Until Page Contains  Username หรือ รหัสผ่านไม่ถูกต้อง


3. Login Fail Input Password Wrong
   [tags]   fail
   Input Username   ${username}
   Input Password   ${password_invalid}
   Click Button Login
   Wait Until Page Contains   Username หรือ รหัสผ่านไม่ถูกต้อง
   Close Browser

4. Login Fail No Input data
   [tags]  Fail
   Mark True Condition
   Set Selenium Implicit Wait   3
   Click Button Login
   Element Should Be Focused   css:input[id="userName"]
   Close Browser

5. Login Fail input username only
   [tags]  Fail
   Mark True Condition
   Set Selenium Implicit Wait   3
   Input Username   ${username}
   Click Button Login
   Element Should Be Focused  css:input[id="password"]
   Close Browser

6. Login Fail input password only
   [tags]  Fail
   Mark True Condition
   Set Selenium Implicit Wait   3
   Input Password   ${password}
   Click Button Login
   Element Should Be Focused   css:input[id="userName"]
   Close Browser

*** Keywords ***
Open Website  
   Open Browser   ${url}   ${browser}
Mark True Condition
   Open Website
   Maximize Browser Window
   Set Selenium Implicit Wait   3
   Click Element   xpath=//*[@id="login-style"]/div[2]/form/div[3]/a
   Wait Until Page Contains   ข้อกำหนดและเงื่อนไขการใช้งาน
   Click Element   xpath=//*[@id="term-of-user"]/div/div/label/div
   Click Element  css:button[class="nextStep2"]
   Wait Until Page Contains   ความยินยอมเพื่อวัตถุประสงค์ทางการตลาด
   Click Element   css:input[value="true"]    
   Click Button  css:button[class="nextStep2"]
   Wait Until Page Contains   ความยินยอมในการเปิดเผยข้อมูลเพื่อวัตถุประสงค์ทางการตลาด
   Click Element   css:input[value="true"]
   Click Button  css:button[class="nextStep2"]
   Wait Until Page Contains   ความยินยอมสำหรับพันธมิตรของ Silverman
   Click Element   css:input[value="true"]
   Click Button  css:button[class="nextStep1"]
Click Button Login
   Click Button   css:button[type="submit"] 

Input Username
   [Arguments]   ${username}
   Input Text   css:input[id="userName"]   ${username}

Input Password
   [Arguments]  ${password}
   Input Text  css:input[id="password"]  ${password}
