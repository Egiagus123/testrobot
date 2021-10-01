*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Suite Setup           Run Keywords        Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document PO AND SO
    [Tags]   ERP-1174     Revert ASI Mandatory Type : When Shipping
    [Documentation]    Revert ASI Mandatory Type : When Shipping
    Set Browser Implicit Wait         1s
    ${purchase_order} =         Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1005  
    Click Toolbar Save
    ${documentnopo} =     Get Field Value   C_Order0DocumentNo                            
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1003
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1003
    Click Toolbar Save
    Set Create Line From    ${documentnopo}    Purchase Order
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page    
    Create Document Header Select IDHeader   Sales Order   sales_order.csv     1002  
    Click Toolbar Save
    ${documentnoso} =     Get Field Value   C_Order0DocumentNo                            
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1001
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Shipment (Customer)    shipment.csv    1000
    Click Toolbar Save
    Set Create Line From    ${documentnoso}    Sales Order
    Doc Action    Complete
    Check Document Status     Invalid
    Click Toolbar Detail
    Select ASI LOT Click           EGl8I1234
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
      