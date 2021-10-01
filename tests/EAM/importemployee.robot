*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          EAM
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1514 - ERP 1514  Failure  
    [Documentation]    Employee Group
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader New     Employee Group   employeegroup.csv   1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Employee    employee.csv    1000
    Click Toolbar Save
    Close Current Tab
    Open Menu               Employee Group
    Click Toolbar Lookup
    Input Name Search    TF_AC_A
    Click Toolbar Detail
    SLEEP                1
    Click Toolbar Detail
    Input Date From Doc Yesterday    BHP_Unavailability
    Input Date ToDoc Today    BHP_Unavailability 
    Click Toolbar Save
    Close Current Tab
    
    Create Document Header Select IDHeader New     Employee Group   employeegroup.csv   1001
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Employee    employee.csv    1001
    Click Toolbar Save
    Close Current Tab  
    Open Menu               Employee Group
    Click Toolbar Lookup
    Input Name Search    TF_AC_B
    Click Toolbar Detail
    SLEEP                1
    Click Toolbar Detail
    Input Date From Doc Yesterday    BHP_Unavailability
    Input Date ToDoc Today    BHP_Unavailability
    Click Toolbar Save
    Close Current Tab
    
    Create Document Header Select IDHeader New     Employee Group   employeegroup.csv   1002
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Employee    employee.csv    1002
    Click Toolbar Save
    Close Current Tab 
    Open Menu               Employee Group
    Click Toolbar Lookup
    Input Name Search    TF_AC_C
    Click Toolbar Detail
    SLEEP                1
    Click Toolbar Detail
    Input Date From Doc Yesterday    BHP_Unavailability
    Input Date ToDoc Today    BHP_Unavailability
    Click Toolbar Save
    Close Current Tab

    



    
