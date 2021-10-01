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
    # Create Document Header Select IDHeader    Product   product_bestprice.csv  1000
    # Click Toolbar Save
    # Click Sub Tab                    Price
    # Click Toolbar Detail
    # Create Line With IDHeader    Price    productprice_baseprice.csv    1000
    # Click Toolbar Save
    # Close Current Tab

    Create Document Header Select IDHeader New     Install Base   installbase.csv  1000
    Click Product info Panel new    BHP_M_InstallBase
    Input info Panel Product Category           ASSET
    Input info Panel Price List Version    ''
    Click Requery info Panel
    Click List info Panel
    Click Ok info Panel
    
    Click Image    BHP_M_InstallBase0C_Location_ID
    Input Popup Addres Location    jakarta Timur
    Click Toolbar Save
    Click Sub Tab                    Location             
    SLEEP        1
        
    Click Update Status        BHP_M_InstallBase    
    Input Popup Status        Available
    Input Popup Description    Test 1
    Input Popup Responsible    AUTOMATION_CUSTOMER
    Click OK
    Click Sub Tab                    Status   
    SLEEP                    1
    Click IsCompanyOwned        BHP_M_InstallBase      
    Click Creat Asset            BHP_M_InstallBase
    Input Popup Asset Group        IT Accessories
    Click OK
    Close Current Tab
    
