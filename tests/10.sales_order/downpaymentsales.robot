*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Downpayment Sales From SO
    [Tags]    ERP    S0
    [Documentation]    Create Partial Receipt From SO
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv     1000
    Click Toolbar Parent
    Process Down Payment Sales
    Click Sub Tab                   Terms
    Process Downpayment Percentage    
    Validate Error Message           Term is over Amount. Total amt of term
    Process Downpayment Amount
    Validate Error Message           Term is over Amount. Total amt of term
    Click Sub Tab                   Order Line
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000   
    Click Toolbar Parent
    Click Sub Tab                   Terms
    Process DownPayment Amount 1
    Process DownPayment Amount New
    Click Select 2
    Click Delete Term Sales
    Click Ok PopUp
    Click Select 1
    Click Delete Term Sales
    Click Ok PopUp
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  