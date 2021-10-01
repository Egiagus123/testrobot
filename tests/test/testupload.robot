*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          EAM
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1514 - ERP 1514  Install Base   
    [Documentation]    Install Base 
    Set Browser Implicit Wait        1s

    Open Menu                        Install Base
    Click Image logo
    # Click Button Upload
    Choose File           css=[type='file']    D://orang.png
              
    SLEEP        1
        

