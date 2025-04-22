def get_desired_caps(platform):
    switcher = {
        "ios_preference": {
            "platformName": "iOS",
            "platformVersion": "18.2",
            "deviceName": "iPhone",
            "automationName": "XCUITest",
            "bundleId": "com.apple.Preferences",
            "udid": "73221B2F-1DB3-4985-A09C-BFBEF03DC4CE"
        },
        "ios_app": {
            "platformName": "iOS",
            "platformVersion": "18.2",
            "deviceName": "iPhone",
            "automationName": "XCUITest",
            "app": "/Users/apple/Library/Developer/Xcode/DerivedData/TestApp-bppcxyoljgorcffcplokvwufholv/Build/Products/Debug-iphonesimulator/TestApp.app",
            "udid": "73221B2F-1DB3-4985-A09C-BFBEF03DC4CE"
        },
        "android": {
            "platformName": "Android",
            "platformVersion": "14",
            "deviceName": "Pixel 5",
            "automationName": "UiAutomator2",
            "appPackage": "com.android.settings",
            "appActivity": ".Settings"
        },
        "web": {
            "platformName": "iOS",
            "deviceName": "iPhone 14",
            "browserName": "Safari",
            "platformVersion": "18.2",
            "automationName": "XCUITest"
        }
    }

    # Get the desired capabilities or fallback to empty dict
    return switcher.get(platform.lower(), {})
