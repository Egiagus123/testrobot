*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Test Teardown         Set Browser Implicit Wait      10s
Suite Teardown        Logout

*** Test Cases ***
Create Document Invoice (Customer) - Fix Asset
    Set Browser Implicit Wait      5s
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1001
    Set Create Line From   1001053       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Click Toolbar Detail
    Create Asset          Asset_Parabotan
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Open Menu    Asset Addition
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page