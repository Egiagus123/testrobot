*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***    
Create Document Clean PO
    [Tags]    ERP    PO
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
    Close Current Tab
    Refresh Page
    Open Menu     Purchase Order
    Search Document No    DocumentNo    ${documentno}
    Doc Action    Close
    Check Document Status     Closed
    Close Current Tab 
    Refresh Page 

Cancel Receipt
    [Documentation]    Cancel Receipt
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
    Doc Action    Reverse - Accrual
    Check Document Status     Reversed
    Close Current Tab
    Refresh Page
    
Cancel Invoice
    [Documentation]    Cancel Invoice
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
    Doc Action    Reverse - Correct
    Check Document Status     Reversed
    Close Current Tab
    Refresh Page

Cancel Payment
    [Documentation]    Cancel Payment
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
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment Out    payment_out.csv            1000
    Input Field Window Input    C_Payment0C_Invoice_ID    ${documentnoinv}
    Click Toolbar Save 
    Doc Action    Complete
    Check Document Status     Completed
    Doc Action    Reverse - Correct
    Check Document Status     Reversed
    Close Current Tab