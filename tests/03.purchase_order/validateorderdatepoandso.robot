*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords     Login As Admin   AND   Today   AND   Yesterday 
Suite Teardown        Logout             


*** Test Cases ***
Create Document PO AND SO
    [Tags]    ERP-1166    Validation Date Ordered
    [Documentation]    Validation Date Ordered
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Input Date Ordered Today     
    Input Date Promised Yesterday 
    Click Toolbar Save
    Validate Error Message      Date Promised must older than Date Ordered
    Input Date Promised Today
    Click Toolbar Save
    ${purchase_order} =     Get Field Value    C_Order0DocumentNo
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Create Document Header Select IDHeader   Sales Order   sales_order.csv     1000  
    Input Date Ordered Today     
    Input Date Promised Yesterday 
    Click Toolbar Save
    Validate Error Message      Date Promised must older than Date Ordered 
    Input Date Promised Today
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab 