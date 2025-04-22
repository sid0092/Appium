from appium.webdriver.common.touch_action import TouchAction
from robot.libraries.BuiltIn import BuiltIn

class custom_keyword:
    def tap_at_coordinates(self, x, y):
        # Get the Appium driver from AppiumLibrary
        appium_lib = BuiltIn().get_library_instance('AppiumLibrary')
        driver = appium_lib._current_application()

        # Perform the tap
        action = TouchAction(driver)
        action.tap(x=int(x), y=int(y)).perform()
