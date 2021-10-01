*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          ConsigmentOffer
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Consignment Offer Document
     [Tags]    ERP-1287,1288,1289
     [Documentation]   Generate Form : Consignment Offer Process
     
     Create Document Window                    Consignment Offer            consigment_offer.csv
     Refresh Page
     
Generate Consignment Offer Document OUT
     [Tags]    ERP-1287,1288,1289
     [Documentation]   Generate Form : Consignment Offer Process
     
     Search Modul Name                        Generate Inventory Move (From Consignment)
     Form Generate Consigment Offer            Consignment Offer        WH_AUTOMATION        01/02/2020        01/02/2020        Consignment Type        OUT
     Click Button Select All On Form
     Input Qty Global                          Qty Process                0                         -1
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer     Material Movement          Prepare
     Click Button Checklist Ok Form
     Input Qty Global                          Qty Process                0                         0
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer     Material Movement          Prepare
     Click Button Checklist Ok Form
     Input Qty Global                          Qty Process                0                         1
     Input Qty Global                          Qty Process                1                         1
     Input Qty Global                          Qty Process                2                         1
     Input Qty Global                          Qty Process                3                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer     Material Movement          Prepare
     Click Button Checklist Ok Form
     Click Button Open Generate On Form
     Close X Tab                               1
     Doc Action                                Complete
     Check Document Status                     Completed
     Close Current Tab
     Click Button Refresh On Form
     Refresh Page
     
Generate Consignment Offer Document IN
     [Tags]    ERP-1287,1288,1289
     [Documentation]   Generate Form : Consignment Offer Process
     
     Input From List By Index                  IN                         Consignment Type
     Click Button Select All On Form
     Click Button Select All On Form
     Input Qty Global                          Qty Process                0                         -1
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer       Material Movement          Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                         0
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer       Material Movement          Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                        10
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer       Material Movement          Prepare
     Click Button Checklist Ok Form
     
     Input Qty Global                          Qty Process                0                         1
     Input Qty Global                          Qty Process                1                         1
     Click Button Process Generate On Form
     Input Popup Generate Consigment Offer       Material Movement          Prepare
     Click Button Checklist Ok Form
     Click Button Open Generate On Form
     Doc Action                                Complete
     Check Document Status                     Completed
     Close Current Tab
     Click Button Refresh On Form

