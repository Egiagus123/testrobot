*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      5 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Currency
    Open Menu    Currency
    SLEEP    20
    Input ISO Currency Code    ${currencycode}
    SLEEP    20
    Close Current Tab