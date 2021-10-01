*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Validate Invoice Date
    [Tags]    ERP    SO
    [Documentation]    Create Document Validate Invoice Date
    Set Browser Implicit Wait      1s
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
    Create Document Header Select IDHeader    Shipment (Customer)   shipment.csv    1000
    Click Toolbar Save
    Set Create Line From   ${documentno}    Sales Order
    ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Invoice (Customer)      invoice_customer.csv   1000 
    Input Date Invoiced Yesterday 
    Click Toolbar Save
    Set Create Line From   ${documentnomr}       Shipment
    ${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
    Doc Action    Complete
    Validate Error Message                Invoice Date cannot be older than Movement Dat
    Input Date Invoiced Today
    Click Toolbar Save    
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab