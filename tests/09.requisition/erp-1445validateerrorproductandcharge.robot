*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
# Test Teardown         Set Browser Implicit Wait      3 second                     
Suite Teardown        Logout


*** Test Cases ***
Create Requisition Product And Charge
    # Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Input Date Required Today    
    Input Date Doc Today                              
    Click Toolbar Save
    ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo                                  
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1005
    Click Toolbar Parent
    Validate Error Message      On this document is mandatory
    Click Toolbar Undo
    Close Current Tab  