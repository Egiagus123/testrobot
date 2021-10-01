*** Settings ***
Resource            ${CURDIR}/../../resources/idempiere.robot
Default Tags          Inventory
# Suite Setup		    Open Browser to    ${LOGIN_URL}
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
Suite Teardown		Close Browser

*** Test Cases ***   
# Login
    # Set Browser Implicit Wait   5s
    # Element Should Exists       css:.login-window
    # Input Field                 css:#rowUser input         ${ADMIN.USERNAME}                       is_key_enter=${false}
    # Input Field                 css:#rowPassword input     ${ADMIN.PASSWORD}                       is_key_enter=${false}
    # # Set Checkbox              css:#rowSelectRole input                                  Y
    # Set Checkbox                sizzle=[class="checkbox-selectrole z-checkbox"] input       Y
    # Click                       sizzle=.login-btn.z-button:contains("OK")
    # Input Field                 css:#rowclient input                                      ${LOGIN_INFO.CLIENT}
    # Input Field                 css:#rowRole input                                        ${LOGIN_INFO.ROLE}
    # Input Field                 css:#rowOrganisation input                                ${LOGIN_INFO.ORGANIZATION}
    # Input Field                 css:#rowWarehouse input                                   ${LOGIN_INFO.WAREHOUSE}
    # Click                       sizzle=.login-btn.z-button:contains("OK") 
    # Wait Until Page Contains     Home
    
Create Document Purchase Order To Vendor RMA
    [Tags]    Purchase Order To Vendor RMA
    [Documentation]    Create Purchase Order To Vendor RMA
    Set Browser Implicit Wait  1s
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
    Set Create Line From Partial    ${documentno}    Purchase Order  3
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Click Toolbar Detail
    ${locator} =     Get Field Value     M_InOutLine0M_Locator_ID
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Vendor RMA    vendor_rma.csv      1000
    Input Field Window Input    M_RMA0InOut_ID     ${documentnomr} 
    Click Toolbar Save
    Set Create Line From Vendor RMA          2
    Doc Action    Complete
    Check Document Status    Completed
    Click Zoom Across                Return to Vendor
    Close Current Tab First
    Doc Action    Complete
    Check Document Status    Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1000
    Click Toolbar Parent
    ${documentnopo} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From Partial    ${documentnopo}    Purchase Order  3
    ${documentnomr2} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Click Toolbar Detail
    ${locator} =     Get Field Value     M_InOutLine0M_Locator_ID
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentnomr2}       Receipt
    ${documentnoinv2} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Payment Out    payment_out.csv    1000
    Input Field Window Input    C_Payment0C_Invoice_ID    ${documentnoinv2} 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    
Logout
    Set Browser Implicit Wait   5s
    Click User
    Click Log Out