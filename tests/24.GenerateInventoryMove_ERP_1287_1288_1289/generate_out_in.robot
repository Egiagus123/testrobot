*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          InventoryMove
Suite Setup           Login As Admin
#Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Generate Inventory Move
     [Tags]    ERP-1291,1292,1293
     [Documentation]   Create order movement, generate inventory move
     
     #CREATE ORDER MOVE DOCUMENT
     Create Document Window                    Order Movement            order_movement.csv
     Refresh Page

Generate Inventory Move Out
     [Tags]    ERP-1291,1292,1293
     [Documentation]   Create order movement, generate inventory move out
     #GENERATE INVENTORY MOVE OUT
     Search Modul Name                        Generate Inventory Move (From Order Movement)
     Form Generate Inventory Move              Order Movement        WH_AUTOMATION           01/04/2020            01/04/2020        Type        OUT
     Click Button Select All On Form
     Input Qty Global                          Qty Process                0                         -1
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     Input Qty Global                          Qty Process                0                         0
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     Input Qty Global                          Qty Process                0                         1
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     Click Button Open Generate On Form
     Close X Tab                               1
     Doc Action                                Complete
     Check Document Status                     Completed
     Close Current Tab
     Click Button Refresh On Form
     
Generate Inventory Move In
     [Tags]    ERP-1291,1292,1293
     [Documentation]   Create order movement, generate inventory move In
     # #GENERATE INVENTORY MOVE IN
     Input From List By Index                  IN                         Type
     Click Button Select All On Form
     Click Button Select All On Form
     Input Qty Global                          Qty Process                0                         -1
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                         0
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                        10
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                         1
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Inventory Move       Material Movement          Loc_Automation            Prepare
     Click Button Checklist Ok Form
     Click Button Open Generate On Form
     Doc Action                                Complete
     Check Document Status                     Completed
     Close Current Tab
     Click Button Refresh On Form
     SLEEP                                     2