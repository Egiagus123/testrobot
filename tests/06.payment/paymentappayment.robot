*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Cost change will not change posted doc
    [Tags]    ERP
    Set Browser Implicit Wait      1s   
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1000 
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Invoice (VendorLine)    invoice_vendorline.csv    1000
    Click Toolbar Parent
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab   
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv   1006 
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Invoice (VendorLine)    invoice_vendorline.csv    1000
    Click Toolbar Parent
    ${documentnoinvusd} =     Get Field Value    C_Invoice0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab    
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment Out    payment_out.csv            1005
    Input Field Window Input    C_Payment0C_Invoice_ID             ${documentnoinvusd}
    Click Cancel
    Input Field Window Input    C_Payment0C_BankAccount_ID         0018-01-000143-30-6_BRI_ .  
    Input Field Window Input    C_Payment0C_Invoice_ID             ${documentnoinv}
    Click Cancel
    Input Field Window Input    C_Payment0C_Invoice_ID             ${documentnoinvusd}
    Click Toolbar Save 
    Doc Action    Complete
    Check Document Status     Completed   
    Doc Action    Reverse - Correct
    Check Document Status     Reversed     
    Close Current Tab 
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment Out    payment_out.csv            1006
    Click Toolbar Detail
	Input Field Window Input    C_PaymentAllocate0C_Invoice_ID    ${documentnoinvusd} 
	Click Cancel
    Input Field Window Input    C_PaymentAllocate0C_Invoice_ID    ${documentnoinv}
    Click Cancel
    Click Toolbar Parent
    Input Field Window Input    C_Payment0C_BPartner_ID         AUTOMATION_COBA   
    Click Toolbar Save 
    Click Toolbar Detail
    Input Field Window Input    C_PaymentAllocate0C_Invoice_ID    ${documentnoinv}   
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed   
    Close Current Tab 
   