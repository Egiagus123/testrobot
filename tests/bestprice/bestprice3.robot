*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Best Price
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1575 - ERP 1596  Best Price 3 
    [Documentation]    Best Price 3
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader New     Product Category   product_category.csv  1001
    Click Toolbar Save
    ${productcategoryname} =     Get Field Value    M_Product_Category0Name
    Close Current Tab
    Create Document Header Select IDHeader    Product   product_bestprice.csv  1001
    Click Toolbar Save
    ${productc} =     Get Field Value    M_Product0Name
    Close Current Tab

    Open Menu               Price List
    Click Toolbar Lookup
    Input Name Search     TF_PLLA
    Click Toolbar Detail
    SLEEP            2
    Click Toolbar Detail
    Create Line With IDHeader New    Base Price    baseprice.csv    1002
    Input Field Window Input    BHP_BasePrice0M_Product_Category_ID             TF_B
    Click Toolbar Save
    Close Current Tab   
    
    Create Document Header Select IDHeader New     Base Price Hierarchy       basepricehierarchy.csv  1002
    Click Toolbar Save
    Close Current Tab
    Open Menu               Product
    Click Toolbar Lookup
    Input Search Key Search     TF_AB
    Click Sub Tab                    Price
    Click Toolbar Detail
    Create Line With IDHeader    Price    productprice_baseprice.csv    1000
    Click Toolbar Save
    Close Current Tab

    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1003
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline_baseprice.csv    1001
    Input Field Window Input    C_OrderLine0M_Product_ID       TF_AB
    Click Ok PopUp first 1
    Input Field Window Input    C_OrderLine0C_Tax_ID       NON VAT
    SLEEP            3 
