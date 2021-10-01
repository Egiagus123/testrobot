*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      1 second
Suite Teardown        Logout

*** Test Cases ***
Create Document PO
    [Tags]    ERP   PO to payment
    [Documentation]    Test
    Set Browser Implicit Wait         1s  
    Create Document PO to Payment   Purchase Order    purchase_order.csv