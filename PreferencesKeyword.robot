*** Settings ***
Library    AppiumLibrary
Variables  locators.py
Variables    capabilities.py
Library    Process
Library    OperatingSystem

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723
${TIMEOUT}          20

*** Keywords ***
Wait And Click Element
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Page Contains Element    ${locator}    timeout=${timeout}
    Click Element    ${locator}

Verify Preferences
    Wait And Click Element    ${general_settings}
    Wait And Click Element    ${about_phone}

    Wait Until Page Contains Element    ${ios_version}    timeout=${TIMEOUT}
    ${actual_result}=    Get Element Attribute    ${ios_version}    value
    Should Be Equal As Strings    ${actual_result}    ${desired_caps['platformVersion']}     Expected iOS version: ${desired_caps['platformVersion']}, but got: ${actual_result}

    Wait Until Page Contains Element    ${name}    timeout=10s
    ${actual_result}=    Get Element Attribute    ${name}    value
    Should Be Equal As Strings    ${actual_result}    ${desired_caps['deviceName']}   Expected device name: ${desired_caps['deviceName']}, but got: ${actual_result}

    Wait And Click Element    ${about_back_button}
    Wait And Click Element    ${general_to_settings_button}
    Wait Until Page Contains Element    ${settings_home}    timeout=${TIMEOUT}
