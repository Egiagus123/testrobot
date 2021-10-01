*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Blanket Order
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Posting Receipt
    [Tags]    ERP-1127  ERP-1388  BO
    [Documentation]    Create Document Blanket Order
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader   Blanket Order   blanket_order.csv      1000
    Click Toolbar Save
    ${documentno} =     Get Field Value   BHP_Blanket0DocumentNo                                  
    Click Toolbar Detail
    Create Line With IDHeader    Blanket OrderLine    blanket_orderline.csv    1000
    ${uom} =     Get Field Value   BHP_BlanketLine0C_UOM_ID
    Create Line With IDHeader    Blanket OrderLine    blanket_orderline.csv    1001
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Set Create Line From Partial Line 2     ${documentno}             Blanket Order       3
    Click Toolbar Parent   
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Set Create Line From     ${documentno}             Blanket Order
    Click Toolbar Detail
    Check UOM    ${uom}
    Click Toolbar Parent   
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Click Create Lines From Button
    Click Check Select List                 Blanket Order
    Refresh Page 