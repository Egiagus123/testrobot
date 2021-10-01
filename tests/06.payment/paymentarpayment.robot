*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Cost change will not change posted doc
    [Tags]    ERP
    Set Browser Implicit Wait      1s       
    Create Document Header Select Open Menu IDHeader    Payment In    payment_in.csv            1000
    Click Toolbar Save
    ${payment_inno} =     Get Field Value      C_Payment0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Customer)      invoice_customer.csv   1000 
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Invoice (CustomerLine)    invoice_customerline.csv    1000
    Click Toolbar Parent
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment In    payment_in.csv            1001
    Input Field Window Input    C_Payment0C_Invoice_ID    ${documentnoinv}
    Click Toolbar Save
    ${payment_inno2} =     Get Field Value      C_Payment0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab 
    Refresh Page
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select Open Menu IDHeader    Payment In    payment_in.csv            1001
    Input Field Window Input    C_Payment0C_Order_ID    ${documentno}
    Click Toolbar Save
    ${payment_inno3} =     Get Field Value      C_Payment0DocumentNo 
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    