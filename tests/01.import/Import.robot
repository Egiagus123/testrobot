*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP   Business Partner    
    [Documentation]    Create Import Data
    Set Browser Implicit Wait        1s
    ${Business_Partner} =     Open Menu Create Record Save    Business Partner   i_b_partner.csv  
    Click Toolbar Detail 
    Create Record Save    Contact (User)   i_b_partnerline.csv  
    Click Toolbar Parent
    Click Sub Tab                    Location             
    Click Toolbar Detail
    Create Record      Location       i_b_partner_location.csv
    Click Image    C_BPartner_Location0C_Location_ID
    Input Popup Addres Location    jakarta Timur
    Click Ok PopUp 
    Click Toolbar Save
    
