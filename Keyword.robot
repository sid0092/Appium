*** Settings ***
Library    AppiumLibrary
Variables    locators.py


*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723
${TIMEOUT}         20

*** Keywords ***
Enter Integer A
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${INTEGER_A_FIELD}    ${TIMEOUT}
    Input Text    ${INTEGER_A_FIELD}    ${value}

Enter Integer B
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${INTEGER_B_FIELD}    ${TIMEOUT}
    Input Text    ${INTEGER_B_FIELD}    ${value}

Click Compute Sum Button
    Wait Until Page Contains Element    ${COMPUTE_SUM_BUTTON}    ${TIMEOUT}
    Click Element    ${COMPUTE_SUM_BUTTON}

Get Answer Value
    Wait Until Page Contains Element    ${ANSWER_FIELD}    ${TIMEOUT}
    ${answer}=    Get Element Attribute    ${ANSWER_FIELD}    value
    RETURN    ${answer}

Validate Sum
    [Arguments]    ${a}    ${b}    ${expected_result}
    Enter Integer A    ${a}
    Enter Integer B    ${b}
    Click Compute Sum Button
    ${actual_result}=    Get Answer Value
    Should Be Equal As Strings    ${actual_result}    ${expected_result}    Wrong Sum

Click Show Alert Button
    Wait Until Page Contains Element    ${SHOW_ALERT_BUTTON}    ${TIMEOUT}
    Click Element    ${SHOW_ALERT_BUTTON}

Validate Cool Alert Appears
    Wait Until Page Contains Element    ${COOL_ALERT_TITLE}    ${TIMEOUT}
    Element Should Be Visible           ${COOL_ALERT_TITLE}








