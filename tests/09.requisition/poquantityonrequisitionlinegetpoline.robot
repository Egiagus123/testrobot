*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin     
Test Teardown         Set Browser Implicit Wait      3 second                         
Suite Teardown        Logout


*** Test Cases ***
Create Requisition 1 to Many
    [Tags]   ERP-1228   Bug PO Quantity on Requisition Line
    [Documentation]    Bug PO Quantity on Requisition Line
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Click Toolbar Save
    ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo                                  
    SLEEP                       3    
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1004
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    Set Create Line From Partial    ${documentnoreq}             Requisition         2       
    SLEEP                      2
    Click Toolbar Detail
    Input UOM                  Lusin
    SLEEP                      7
    Check PO Quantity          24
    SLEEP                      5
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  