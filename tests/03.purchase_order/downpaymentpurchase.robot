*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Downpayment Purchase From PO
    [Tags]    ERP    PO
    [Documentation]    Create Partial Receipt From PO
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv      1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1004
    Click Toolbar Parent
    Process Down Payment
    Click Sub Tab                   Terms
    Process Generate Terms Percentage    
    Validate Error Message           Term is over Amount. Total amt of term
    Process Generate Terms Amount
    Validate Error Message           Term is over Amount. Total amt of term
    Click Sub Tab                   PO Line
    Click Toolbar Detail
    Create Line With IDHeader    Purchase OrderLine    purchase_orderline.csv    1004    
    Click Toolbar Parent
    Click Sub Tab                   Terms
    Process Generate Terms Amount 1
    Process Generate Terms Amount New
    Click Select 2
    Click Delete Term
    Click Ok PopUp
    Click Select 1
    Click Delete Term
    Click Ok PopUp
    ${documentno} =     Get Field Value    C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
  