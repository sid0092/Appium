*** Settings ***
Resource    Keyword.robot
Resource    PreferencesKeyword.robot
Resource    setup_keywords.robot

*** Test Cases ***
Test Addition Functionality
    Setup Test Case     ${PLATFORM}
    Validate Sum    20    10    30
    Teardown Test Case

Test Addition With Different Values
    Setup Test Case     ${PLATFORM}
    Validate Sum    5    7    12
    Teardown Test Case

Test Alert And Slider
    Setup Test Case     ${PLATFORM}
    Click Show Alert Button
    Validate Cool Alert Appears
    Teardown Test Case

Preferences Test
    Setup Test Case     ${PLATFORM}
    Verify Preferences
    Teardown Test Case