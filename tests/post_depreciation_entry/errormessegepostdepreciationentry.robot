*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Test Teardown         Set Browser Implicit Wait      10s
Suite Teardown        Logout

*** Test Cases ***
Create Document Invoice (Customer) - Fix Asset
    [Tags]    ERP-1398 Enhancement Error Message on Process Post Depreciation Entry 
    [Documentation]    Enhancement Error Message on Process Post Depreciation Entry 
    Create Document Header Select Open Menu IDHeader New    Asset    asset.csv    1005
    Click Toolbar Save
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader New    Asset Addition    asset_addition.csv    1000
    Click Toolbar Save
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader New    Post Depreciation Entry    post_depreciation_entry.csv    1000
    Click Toolbar Save
    Doc Action    Complete
    SLEEP                5
    Validate Error Message      The following errors were encountered:
    Close Current Tab

 