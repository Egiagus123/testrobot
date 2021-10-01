*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Clean RMA
    [Tags]    ERP    RMA
    [Documentation]    Create Document Clean Customer RMA
    Create Document Header Select IDHeader New   Customer RMA   customer_rma.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New   Customer RMALine    customer_rmaline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    M_RMA0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    5  
    Click Zoom Across        Customer Return
    Close Current Tab First
    ${documentnor} =     Get Field Value    M_InOut0DocumentNo 
    Input Date Movement Yesterday
    Doc Action    Complete
    SLEEP                3
    Validate Error Message      Movement Date or Account Date cannot be older than RMA Date.
    SLEEP                    5
    Input Date Movement Today
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    5