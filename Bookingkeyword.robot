*** Settings ***
Library           AppiumLibrary
Library           custom_keyword.py
Variables         bookinglocators.py

*** Variables ***
${APPIUM_SERVER}      http://127.0.0.1:4723
${TIMEOUT}            30

*** Keywords ***
Setup Test Case
    ${desired_caps}=    Create Dictionary
    ...    deviceName=iPhone
    ...    platformName=iOS
    ...    platformVersion=18.2
    ...    automationName=XCUITest
    ...    app=Safari
    ...    browserName=Safari
    ...    udid=73221B2F-1DB3-4985-A09C-BFBEF03DC4CE
    AppiumLibrary.Open Application    ${APPIUM_SERVER}    &{desired_caps}

Teardown Test Case
    Close Application

Search Hotel In Safari
    AppiumLibrary.Go To Url    https://www.booking.com
    sleep   5

    Wait Until Page Contains Element    ${ENTER_DEST_FIELD}    timeout=15s
    Click Element    ${ENTER_DEST_FIELD}

    Input Text    ${ENTER_DEST_FIELD}    Kolkata

    Wait Until Page Contains Element    ${KOLKATA_OPTION}    timeout=10s
    Click Element    ${KOLKATA_OPTION}

    Wait Until Page Contains Element    ${STAY_DURATION}    timeout=10s
    Click Element    ${STAY_DURATION}

    Wait Until Page Contains Element    ${DONE_BUTTON}    timeout=10s
    Click Element    ${DONE_BUTTON}

    Wait Until Page Contains Element    ${SEARCH_BUTTON}    timeout=10s
    Click Element    ${SEARCH_BUTTON}

    Wait Until Page Contains Element    ${SORT_BUTTON}    timeout=20s
    Element Should Be Visible    ${SORT_BUTTON}
