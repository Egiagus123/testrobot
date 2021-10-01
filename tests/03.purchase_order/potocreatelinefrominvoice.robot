*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***    
Create Document Clean PO
    [Tags]    ERP-1458    PO
    [Documentation]    PO to Create Line from Invoice
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
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Set Create Line From   ${documentno}       Purchase Order 
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Click Toolbar Detail
    Input Qty Entered    C_InvoiceLine     3
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab    
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentno}    Purchase Order   
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo  
    Click Toolbar Detail
    Input Qty Entered    M_InOutLine     3
    Click Toolbar Parent                          
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Set Create Line From  ${documentno}    Purchase Order    
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Click Toolbar Detail
    Input Qty Entered    C_InvoiceLine     7
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                    3
    Doc Action    Reverse - Correct
    Check Document Status     Reversed
    Close Current Tab 
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Set Create Line From  ${documentno}    Purchase Order    
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    # Check Document Status     Completed
    SLEEP                    3
    Close Current Tab