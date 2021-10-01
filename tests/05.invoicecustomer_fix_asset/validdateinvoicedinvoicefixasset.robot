*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Test Teardown         Set Browser Implicit Wait      10s
Suite Teardown        Logout

*** Test Cases ***
Create Document Invoice (Customer) - Fix Asset
    [Tags]    ERP-1166    Validation Date Ordered
    [Documentation]    Validation Date Ordered
    Create Document Header Select Open Menu IDHeader New    Asset    asset.csv    1000
    Click Toolbar Save
    ${inventoryno} =     Get Field Value    A_Asset0InventoryNo
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1001
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1001
    Set Create Line From        ${documentno}             Purchase Order
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page    
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1001
    Click Toolbar Save
    Set Create Line From    ${documentnomr}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Click Toolbar Detail
    Create Asset          Asset_Robot_AC
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Open Menu    Asset Addition
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader New      Asset Disposal      asset_disposal.csv    1000  
    Doc Action    Complete
    Close Current Tab
    Refresh Page
    Create Document Header Search Menu IDHeader New  Invoice (Customer) - Fix Asset   invoice_customerfixasset.csv      1000
    Click Toolbar Save    
    Input Date Invoiced Yesterday      
    Click Toolbar Save
    Click Toolbar Detail    
    Create Line With IDHeader New    Invoice (Customer) - Fix AssetLine    invoice_customerfixassetline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    Validate Error Message      Date Invoice must older than Date Disposal   
    Input Date Invoiced Today     
    Click Toolbar Save
    Doc Action    Complete 
    Check Document Status     Completed
    Close Current Tab 