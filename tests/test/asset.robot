*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
#Test Teardown         Set Browser Implicit Wait      10s
Suite Teardown        Logout

*** Test Cases ***
Create Document Downpayment Sales From SO
    [Tags]    ERP    S0
    [Documentation]    Create Partial Receipt From SO
    Set Browser Implicit Wait      1s
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