*** Settings ***
Resource		${CURDIR}/resources/common.robot
Force Tags		author-zichou    size-sm


*** Test cases ***
Visit baidu.com and capture screenshot
    Go To    https://www.baidu.com
    Capture Page Screenshot
