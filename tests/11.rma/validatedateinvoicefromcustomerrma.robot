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
    Create Document Header Select IDHeader   Customer RMA   customer_rma.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader   Customer RMALine    customer_rmaline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    M_RMA0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    5  
    Click Zoom Across        Customer Return
    Close Current Tab First
    ${documentnor} =     Get Field Value    M_InOut0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    5
    
##Zoom Cross Error
    # Click Zoom Across       Invoice (Customer)
    # Close Current Tab First
    # Doc Action    Reverse - Correct
    # Check Document Status     Reversed
    # SLEEP                3
    
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Customer)      invoice_customer.csv   1004 
    Input Date Invoiced Yesterday 
    Click Toolbar Save
    SLEEP                                 3
    Set Create Line From           ${documentnor}           Return
    Doc Action    Complete
    Validate Error Message                Invoice Date cannot be older than Movement
    SLEEP                                4
    Input Date Invoiced Today
    Click Toolbar Save  
    SLEEP                    4  
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    5