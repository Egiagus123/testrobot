*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Vendor RMA
    [Tags]    ERP     Purchase Order 
    Set Browser Implicit Wait        1s
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
    Set Create Line From        ${documentno}             Purchase Order
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status    Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status    Completed
    Close Current Tab
    Create Document Header Select IDHeader New    Vendor RMA    vendor_rma.csv         1000
    Input Field Window Input    M_RMA0InOut_ID     ${documentnomr} 
    Click Toolbar Save
    ${pricelist} =     Get Field Value    M_RMA0M_PriceList_ID
    Set Create Line From Vendor RMA          2
    Doc Action    Complete
    Check Document Status    Completed
    Create Order From RMA
    Click Zoom Label                                    Purchase Order    
    Close Current Tab First  
    Check Price List          ${pricelist}
    Doc Action    Complete 
    Check Document Status    Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader New    Vendor RMA    vendor_rma.csv         1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Vendor RMALine    vendor_rmaline.csv    1000
    Click Toolbar Parent
    # ${pricelistrma} =     Get Field Value    M_RMA0M_PriceList_ID
    Doc Action    Complete
    Check Document Status     Completed
    
    ##ERROORR
    # Create Order From RMA                         
    # Click Zoom Label                                    Purchase Order     
    # Close Current Tab First    
    # # Check Price List         ${pricelistrma}
    # Doc Action    Complete 
    # Check Document Status    Completed
    # Close Current Tab