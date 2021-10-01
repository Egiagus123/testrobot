*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    [Tags]    ERP 1490   Bug prepare delete line so
    [Documentation]    Bug prepare delete line so
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000
    Click Toolbar Parent
    ${salesorder1no} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Prepare
    Check Document Status     In Progress
    SLEEP           2
    Click Toolbar Detail
    SLEEP            2
    Click Toolbar Delete Record
    Click Ok PopUp
    Close Current Tab
   