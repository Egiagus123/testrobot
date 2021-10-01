*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Match PO
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***    
Create Document Match PO
    [Tags]    ERP 1475 & ERP 1487  Match PO
    [Documentation]    Create Document Clean PO
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentno}    Purchase Order
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP            5
    Doc Action    Reverse - Correct
    Check Document Status     Reversed
    Close Current Tab
    Refresh Page
    Open Menu     Material Receipt
    Search Document No    DocumentNo    ${documentnomr}
    SLEEP        2
    Doc Action    Reverse - Correct
    Check Document Status     Reversed
    Close Current Tab 
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentno}    Purchase Order
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab