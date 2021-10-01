*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      1 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    [Tags]    ERP-1229  AND ERP-1388     Create Sales Order Create line from Quotation 
    [Documentation]    Create Sales Order Create line from Quotation
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader   Quotation   quotation.csv      1000
    Click Toolbar Save
    ${documentno} =     Get Field Value   C_Order0DocumentNo                                  
    Click Toolbar Detail
    Create Line With IDHeader    Quotation Line    quotationline.csv    1000
    ${uom} =     Get Field Value   C_OrderLine0C_UOM_ID
    Create Line With IDHeader    Quotation Line    quotationline.csv    1001
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Set Create Line From Partial Line 2     ${documentno}             Quotation       3
    Click Toolbar Parent   
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Set Create Line From     ${documentno}             Quotation
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
    Click Check Select List                 Quotation
    Refresh Page 