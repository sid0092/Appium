*** Settings ***
Resource    PreferencesKeyword.robot


*** Test Cases ***
Preferences Test
    Setup Test Case     ${PLATFORM}
    Verify Preferences
    Teardown Test Case
