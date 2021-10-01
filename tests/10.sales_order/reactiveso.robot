*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    [Tags]    ERP    SO
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    ${documentnoso} =     Get Field Value    C_Order0DocumentNo
    Click Toolbar Detail
    Create Line With IDHeader Avaible    Sales OrderLine    sales_orderline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Create Document Header Select IDHeader    Shipment (Customer)    shipment.csv    1000
    Click Toolbar Save
    Set Create Line From    ${documentnoso}    Sales Order 
    ${documentnosh} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page    
    Open Menu                Sales Order
    Open Search Document No        ${documentnoso}
    Doc Action    Re-activate
    Check Document Status         In Progress
    Close Current Tab