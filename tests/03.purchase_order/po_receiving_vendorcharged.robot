*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Suite Setup           Run Keywords        Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Purchase Order To Vendor RMA
    [Tags]    Purchase Order To Vendor RMA
    [Documentation]    Create Purchase Order To Vendor RMA
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
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Select IDHeader    Vendor RMA    vendor_rma.csv      1000
    Input Field Window Input    M_RMA0InOut_ID     ${documentnomr} 
    Click Toolbar Save
    Set Create Line From Vendor RMA          2
    Doc Action    Complete
    Check Document Status    Completed
    Click Zoom Across        Return to Vendor
    Close Current Tab First
    Doc Action    Complete
    Check Document Status    Completed
    Click Zoom Across               Invoice (Vendor)
    Close Current Tab First
    Close Current Tab