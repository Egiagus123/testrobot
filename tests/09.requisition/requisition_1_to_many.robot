*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin    
Test Teardown         Set Browser Implicit Wait      3 second                          
Suite Teardown        Logout


*** Test Cases ***
Create Requisition 1 to Many
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Click Toolbar Save
    ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo                                  
    SLEEP                       3    
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1003
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    Set Create Line From Partial        ${documentnoreq}             Requisition      3
    SLEEP        2
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    Set Create Line From Partial        ${documentnoreq}             Requisition      4
    SLEEP            2
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  