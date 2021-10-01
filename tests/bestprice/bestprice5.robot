*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Best Price
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1575 - ERP 1596  Best Price 5   
    [Documentation]    Best Price 5
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader    Product   product_bestprice.csv  1003
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader     Business Partner   business_partner_bestprice.csv  1002
    Click Toolbar Save
    ${bp} =     Get Field Value   C_BPartner0Name
    Click Sub Tab                    Location             
    Click Toolbar Detail
    Create Record      Location       i_b_partner_location.csv
    Click Image    C_BPartner_Location0C_Location_ID
    Input Popup Addres Location    jakarta Timur
    Click Ok PopUp 
    Click Toolbar Save
    Close Current Tab

    Open Menu               Price List
    Click Toolbar Lookup
    Input Name Search     TF_PLLA
    Click Toolbar Detail
    SLEEP            2
    Click Toolbar Detail
    Create Line With IDHeader New    Base Price    baseprice.csv    1004
    Click Product info Panel
    Input info Panel Value           TF_AE
    Input info Panel Price List Version    ''
    Click Requery info Panel
    Click List info Panel
    Click Ok info Panel
    Input Field Window Input    BHP_BasePrice0C_BPartner_ID     TF_BPC
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New     Base Price Hierarchy       basepricehierarchy.csv  1004
    Click Toolbar Save
    Close Current Tab
    Open Menu               Product
    Click Toolbar Lookup
    Input Search Key Search     TF_AE
    Click Sub Tab                    Price
    Click Toolbar Detail
    Create Line With IDHeader    Price    productprice_baseprice.csv    1000
    Click Toolbar Save
    Close Current Tab
    
    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1005
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline_baseprice.csv    1000
    Input Field Window Input    C_OrderLine0M_Product_ID       TF_AE
    Click Ok PopUp first 1
    Input Field Window Input    C_OrderLine0C_Tax_ID       NON VAT
    SLEEP            3 


