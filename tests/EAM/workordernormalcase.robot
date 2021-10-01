*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          EAM
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1514  Corrective Maintenance
    [Documentation]    Work Order EAM
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader New     Work Order (EAM)   woeam.csv   1000
    Click Toolbar Save
    Click Update Status                       BHP_WOService
    Input Popup Status                        Available
    Input Popup Description                   Test 1
    Input Popup Responsible                   AUTOMATION_CUSTOMER
    Click OK
    Click Sub Tab                             Status   
    SLEEP                                     1
    Click Update Status WO
    Input Popup Status WO                     In Planning
    Click OK  
    SLEEP                                     1

    Click Toolbar Detail
    Create Line With IDHeader New            Parts        parts.csv        1000
    Input Qty Entered                        BHP_Parts        2
    Click Toolbar Save
    Validate Error Message                   Quantity Product with attribute Serial No. can't >1
    Input Qty Entered                        BHP_Parts        1
    Click Toolbar Save
    
    Click Toolbar Parent   
    Sleep                    1
    Click Sub Tab      Other
    Create Line With IDHeader New            Other        other.csv        1000
    Click Toolbar Save
    
    Click Toolbar Parent   
    Sleep                    1
    Click Sub Tab      Labor
    Create Line With IDHeader New            Labor        labor.csv        1000
    Click Toolbar Save
    



    
