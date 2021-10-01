*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Posting Receipt
    [Tags]    ERP    PO
    [Documentation]    Create Document Posting Receipt
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1005
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1027
    Click Toolbar Parent
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1003
    Click Toolbar Save
    Set Create Line From   ${documentno}    Purchase Order
    Click Toolbar Detail
    Click New Record ASI             M_InOutLine0M_AttributeSetInstance_ID
    Input ASI LOT     Testrobot
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab