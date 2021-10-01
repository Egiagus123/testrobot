*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          EAM
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1514 - ERP 1514  Failure  
    [Documentation]    Master Meter Display
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1000
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1001
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1002
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1003
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1004
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New   Master Meter Display   mastermeterdisplay.csv   1005
    Click Toolbar Save
    Close Current Tab
    Open Menu                        PM TYPE
    Create Line With IDHeader New    PM TYPE    pmtype.csv    1000
    Click Toolbar Save
    Close Current Tab



    



    
