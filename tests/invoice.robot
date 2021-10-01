*** Settings ***
Resource              ../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait  3s
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Receipt
    SLEEP                    3
    Set Create Line From   ${documentnomr2}       Receipt
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    SLEEP                     5
    Close Current Tab
    Refresh Page