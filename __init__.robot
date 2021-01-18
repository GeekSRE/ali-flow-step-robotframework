*** Settings ***
Resource		${CURDIR}/resources/common.robot
Suite Setup		Start Xvfb and Open Browser
Suite Teardown	Close Browser and Stop Xvfb


*** Keywords ***
Start Xvfb and Open Browser
    Start Virtual Display
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    no-sandbox
    ${options}    Call Method     ${chrome_options}    to_capabilities
    Open Browser    \    browser=chrome    desired_capabilities=${options}


Close Browser and Stop Xvfb
    Close Browser
    Stop Virtual Display
