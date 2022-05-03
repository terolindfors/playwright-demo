*** Settings ***
Library    RPA.Browser.Playwright
Test Setup    Test Setup

*** Test Cases ***
First Filter Test
    Click    (//*[@id="equipments"])[2]
    Wait For Elements State    id=id_category    visible
    Fill Text    id=id_name    Umbrella
    Select Options By    id=id_category    label    Golf
    Click    //button[text()="Filter equipments"]
    ${umbrellas}=    Get Element Count    //div[@id="equipments-table"]//tbody/tr
    Should Be Equal As Integers    ${umbrellas}    3

Second Filter Test
    Click    (//*[@id="equipments"])[2]
    Wait For Elements State    id=id_category    visible
    Fill Text    id=id_name    Umbrella
    Select Options By    id=id_category    label    Golf
    Click    //button[text()="Filter equipments"]
    Wait For Elements State    //span[@class="htmx-indicator htmx-request"]   detached
    ${umbrellas}=    Get Element Count    //div[@id="equipments-table"]//tbody/tr
    Should Be Equal As Integers    ${umbrellas}    3

Login Test
    Click    id=signup
    Wait For Elements State    //button[text()="Sign up"]    visible
    Fill Text    id=id_first_name    Matti
    Fill Text    id=id_last_name    Meikäläinen
    Fill Text    id=id_username    matt!m
    Fill Text    id=id_password1    m31KÄL4#
    Fill Text    id=id_password2    m31KÄL4#
    Click    //button[text()="Sign up"]

*** Keywords ***
Test Setup
    New Context    ignoreHTTPSErrors=true    tracing=${suite_name.split(".")[-1].replace(" ", "_")}_${test_name.replace(" ", "_")}_robot_trace
    New Page    ${WEBSITE_FRONT}
