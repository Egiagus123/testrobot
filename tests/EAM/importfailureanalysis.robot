*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          EAM
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1514 - ERP 1514  Failure  
    [Documentation]    Install Base 
    Set Browser Implicit Wait        1s

    Create Document Header Select IDHeader New     Failure   failure.csv  1000
    Input Start Date Doc Today                  BHP_M_Failure
    Click Toolbar Save
    Close Current Tab
        
    Create Document Header Select IDHeader New     Analysis   analysis.csv  1000
    Input Start Date Doc Today                  BHP_M_Analysis
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Analysis Detail    analysisdetail.csv    1000
    Click Toolbar Save
    Close Current Tab
    
    Create Document Header Select IDHeader New     Resolution   resolution.csv  1000
    Input Start Date Doc Today                  BHP_M_Resolution
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Resolution Detail   resolutiondetail.csv    1000
    Click Toolbar Save
    Close Current Tab
    



    
