*** Settings ***
Library    RPA.Browser.Playwright

*** Test Cases ***
First Filter Test
    [Setup]    Visit Setup
    Sleep    2
    Click    (//*[@id="equipments"])[2]
    Wait For Elements State    id=id_category    visible
    Fill Text    id=id_name    Umbrella
    Select Options By    id=id_category    label    Golf
    Click    //button[text()="Filter equipments"]
    ${umbrellas}=    Get Element Count    //div[@id="equipments-table"]//tbody/tr
    Should Be Equal    ${umbrellas}    3

*** Keywords ***
Visit Setup
    New Context    ignoreHTTPSErrors=true    tracing=${suite_name.split(".")[-1].replace(" ", "_")}_${test_name.replace(" ", "_")}_robot_trace
    New Page    ${WEBSITE_FRONT}
