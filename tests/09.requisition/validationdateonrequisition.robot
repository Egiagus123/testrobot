*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
# Test Teardown         Set Browser Implicit Wait      3 second                     
Suite Teardown        Logout


*** Test Cases ***
Create Requisition Product And Charge
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Input Date Required Yesterday        
    Input Date Doc Today           
    Click Toolbar Save
    Validate Error Message      Document Date must older than Date required
    Input Date Required Today                   
    Click Toolbar Save
    ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo                                  
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1003
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  