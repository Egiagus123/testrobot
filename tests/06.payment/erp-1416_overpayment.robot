*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Over Payment
    [Tags]    ERP-1416
    Set Browser Implicit Wait      1s   
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Invoice (VendorLine)    invoice_vendorline.csv    1005
    Click Toolbar Parent
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab   
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment Out    payment_out.csv            1005
    Click Toolbar Save
    Click Toolbar Detail
    Input Field Window Input    C_PaymentAllocate0C_Invoice_ID             ${documentnoinv}
    Input Field Window Input    C_PaymentAllocate0Amount            1100
    Click Toolbar Save 
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed     
    Click Toolbar Detail
    Click Invoice No
    Close Current Tab First
    Click Ispaid
    SLEEP            2
    Close Current Tab
    
    # Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    # Click Toolbar Save
    # Click Toolbar Detail
    # Create Line With IDHeader    Invoice (VendorLine)    invoice_vendorline.csv    1005
    # Click Toolbar Parent
    # ${documentnoinv2} =     Get Field Value    C_Invoice0DocumentNo
    # Doc Action    Complete
    # Check Document Status     Completed
    # Close Current Tab   
    # Refresh Page
    # Create Document Header Select Open Menu IDHeader    Payment Out    payment_out.csv            1005
    # Input Field Window Input    C_Payment0PayAmt            1100
    # Click Toolbar Save
    # ${documentnopay} =     Get Field Value    C_Payment0DocumentNo
    # Doc Action    Complete
    # Check Document Status     Completed    
    
    # Search Modul Name            Payment Allocation
    # Input Bussiness Partner Form Payment Allocation        AUTOMATION_ROBOTFRAMEWORK
    # Click Multy-Currency Form PA
        
     