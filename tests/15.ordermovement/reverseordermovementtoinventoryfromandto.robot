*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Cost change will not change posted doc
    [Tags]    ERP-1181    Bug Process Inventory Move From And To from Order Movement
    [Documentation]    Bug Process Inventory Move From And To from Order Movement
    Create Document Header Select IDHeader      Order Movement        order_movement.csv     1000  
    Click Toolbar Save
    Click Toolbar Detail
    SLEEP          2
    Create Line With IDHeader    Order MovementLine            order_movementline.csv    1000
    Click Toolbar Parent
    Doc Action    Complete
    ${documentnorm} =     Get Field Value    BHP_RMovement0DocumentNo
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader      Inventory Move (Warehouse From)        inventory_movefrom.csv     1000  
    Click Toolbar Save
    Set Create Line From Inventory Move From        ${documentnorm}             Order Movement    Intransit Semarang
    Doc Action    Complete
    ${documentnoimf} =     Get Field Value    M_Movement0DocumentNo
    Check Document Status     Completed
    Close Current Tab
    Create Document Header Search Menu IDHeader      Inventory Move (Warehouse To)        inventory_moveto.csv     1000 
    Click Toolbar Save 
    Set Create Line From Inventory Move To   ${documentnorm}       Order Movement         Intransit Semarang
    Doc Action    Complete
    ${documentnoimt} =     Get Field Value    M_Movement0DocumentNo
    Check Document Status     Completed
    Close Current Tab   
    Refresh Page
    Open Menu              Order Movement
    Open Search Document No    ${documentnorm}      
    Doc Action    Void
    SLEEP                        2
    Close Current Tab
    Search Modul Name              Inventory Move (Warehouse From)
    Open Search Document No    ${documentnoimf}   
    Doc Action     Reverse - Correct
    Close Current Tab
    Search Modul Name              Inventory Move (Warehouse To)
    Open Search Document No    ${documentnoimt}   
    Doc Action     Reverse - Correct
    Check Document Status     Reversed 
    Close Current Tab
    Refresh Page
    Open Menu              Order Movement
    Open Search Document No    ${documentnorm}      
    Doc Action    Void
    SLEEP                        2    
    Close Current Tab
    Search Modul Name              Inventory Move (Warehouse From)
    Open Search Document No    ${documentnoimf}   
    Doc Action     Reverse - Correct
    Check Document Status     Reversed 
    Close Current Tab     
    Refresh Page
    Open Menu              Order Movement
    Open Search Document No    ${documentnorm}      
    Doc Action    Void
    SLEEP                        2   
    Check Document Status      Voided 
    Close Current Tab
