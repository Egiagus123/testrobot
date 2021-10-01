*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    [Tags]    ERP    PO
    [Documentation]    Create Partial Receipt From PO
    Set Browser Implicit Wait         1s
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
    Set Create Line From Partial    ${documentno}    Purchase Order  3
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From Partial    ${documentno}    Purchase Order  4
    ${documentnomr2} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab   
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    Set Create Line From   ${documentnomr2}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Select IDHeader    Payment Out    payment_out.csv    1000
    Input Field Window Input    C_Payment0C_Invoice_ID    ${documentnoinv} 
    Click Toolbar Save
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Sleep                    5