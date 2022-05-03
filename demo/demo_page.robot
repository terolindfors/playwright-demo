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
    Click    id=login
    Wait For Elements State    id=id_username    visible
    Fill Text    id=id_username    timmy
    Fill Text    id=id_password    timmy
    Click    //button[text()="Log in"]
    Wait For Elements State    //h1[text()="The Rental Store"]
    Click    (//*[@id="equipments"])[2]

*** Keywords ***
Test Setup
    New Context    ignoreHTTPSErrors=true    tracing=${suite_name.split(".")[-1].replace(" ", "_")}_${test_name.replace(" ", "_")}_robot_trace
    New Page    ${WEBSITE_FRONT}
