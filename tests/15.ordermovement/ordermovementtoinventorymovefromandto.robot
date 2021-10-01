*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Cost change will not change posted doc
    [Tags]    ERP-1181    Bug Process Inventory Move From And To from Order Movement
    [Documentation]    Bug Process Inventory Move From And To from Order Movement
    Create Document Header Select IDHeader      Order Movement        order_movement.csv     1000  
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Order MovementLine            order_movementline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    ${documentnorm} =     Get Field Value    BHP_RMovement0DocumentNo
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader New      Inventory Move (Warehouse From)        inventory_movefrom.csv     1000  
    Click Toolbar Save
    Set Create Line From Inventory Move From        ${documentnorm}             Order Movement    Intransit Semarang
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader New      Inventory Move (Warehouse To)        inventory_moveto.csv     1000 
    Click Toolbar Save 
    Set Create Line From Inventory Move To   ${documentnorm}       Order Movement         Intransit Semarang
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab   

    