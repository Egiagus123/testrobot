*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Cost change will not change posted doc
    [Tags]    ERP-1406    Validate Qty
    [Documentation]    Validate Qty
    Create Document Header Select IDHeader      Order Movement        order_movementnew.csv     1000  
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Order MovementLine            order_movementline.csv    1002
    Create Line With IDHeader    Order MovementLine            order_movementline.csv    1003
    Click Toolbar Parent
    Doc Action    Complete
    ${documentnorm} =     Get Field Value    BHP_RMovement0DocumentNo
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader New      Inventory Move (Warehouse From)        inventory_movefrom.csv     1000  
    Click Toolbar Save
    Set Create Line From Inventory Move From       ${documentnorm}             Order Movement    Intransit Semarang  
    Click Toolbar Detail
    Input Qty Entered    M_MovementLine       4
    Click Next Record
    Input Qty Entered    M_MovementLine       1.5
    Click Toolbar Parent
    Doc Action    Complete
    SLEEP                        2
    Validate Error Message           Movement Qty
    SLEEP                        2
    Click Toolbar Detail
    Input Qty Entered    M_MovementLine       0.5
    Click Back Record
    Input Qty Entered    M_MovementLine       3
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader New      Inventory Move (Warehouse To)        inventory_moveto.csv     1000 
    Click Toolbar Save 
    Set Create Line From Inventory Move To   ${documentnorm}       Order Movement         Intransit Semarang
    Click Toolbar Detail
    Input Qty Entered    M_MovementLine       3
    Click Next Record
    Input Qty Entered    M_MovementLine       0.6
    Click Toolbar Parent
    Doc Action    Complete
    SLEEP                        2
    Validate Error Message         Movement Qty
    SLEEP                        2
    Close Current Tab   

    