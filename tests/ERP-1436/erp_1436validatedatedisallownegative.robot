*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Validate Invoice Date
    [Tags]    ERP-1406    SO PO
    [Documentation]    validate minus disallowe negative
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Shipment (Customer)   shipment.csv    1000
    Click Toolbar Save
    sleep                3
    Set Create Line From   ${documentno}    Sales Order
    sleep                        2
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo    
    Click Toolbar Detail       
    Input Qty Entered      M_InOutLine          -1    
    Click Toolbar Parent                 
    Doc Action    Complete
    Validate Error Message              disallowed negatif quantity in shipment/Receipt   
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From    ${documentno}    Purchase Order 
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Click Toolbar Detail       
    Input Qty Entered      M_InOutLine          -1    
    Click Toolbar Parent                 
    Doc Action    Complete
    Validate Error Message              disallowed negatif quantity in shipment/Receipt   
    Close Current Tab