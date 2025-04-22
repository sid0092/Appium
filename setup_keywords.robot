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
Start Appium Server
    Start Process    appium
    Sleep   10s



Stop Appium Server
    Terminate All Processes

Setup Test Case
    [Arguments]     ${PLATFORM}
    ${desired_caps}=    Evaluate    __import__('capabilities').get_desired_caps('${PLATFORM}')
    Log    Starting application with capabilities: ${desired_caps}
    Start Appium Server
    Set Test Variable    ${desired_caps}    ${desired_caps}
    Open Application    ${APPIUM_SERVER}    &{desired_caps}

Teardown Test Case
    Close Application
    Stop Appium Server