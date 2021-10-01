*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Best Price
Suite Setup           Login As Admin      
Test Teardown         Set Browser Implicit Wait      3 second                        
Suite Teardown        Logout


*** Test Cases ***
Create Import Data
    [Tags]    ERP 1575 - ERP 1596  Best Price 1    
    [Documentation]    Best Price 1
    Set Browser Implicit Wait        1s
    Create Document Header Select IDHeader New     Product Category   product_category.csv  1000
    Click Toolbar Save
    ${productcategoryname} =     Get Field Value    M_Product_Category0Name
    Close Current Tab
    Create Document Header Select IDHeader    Product   product_bestprice.csv  1000
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New     Business Partner Group   business_partner_group.csv  1000
    Click Toolbar Save
    ${bpgroup} =     Get Field Value   C_BP_Group0Name
    Close Current Tab
    Create Document Header Select IDHeader     Business Partner   business_partner_bestprice.csv  1000
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
    Create Document Header Select IDHeader New     Price List   pricelist_bestprice.csv  1000
    Click Toolbar Save
    ${pricelist} =     Get Field Value   M_PriceList0Name
    Click Toolbar Detail
    Create Line With IDHeader New    Version    pricelist_version.csv    1000
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader New    Base Price    baseprice.csv    1000
    # Click Product info Panel
    # Input info Panel Value           TF_AP
    # Input info Panel Price List Version    ''
    # Click Requery info Panel
    # Click List info Panel
    # Click Ok info Panel
    Input Field Window Input    BHP_BasePrice0M_Product_Category_ID     TF_A
    Input Field Window Input    BHP_BasePrice0C_BP_Group_ID     TF_BPGA 
    Click Toolbar Save
    Close Current Tab
    Create Document Header Select IDHeader New     Base Price Hierarchy       basepricehierarchy.csv  1000
    Click Toolbar Save
    Close Current Tab
    Open Menu               Product
    Click Toolbar Lookup
    Input Search Key Search     TF_AP
    Click Sub Tab                    Price
    Click Toolbar Detail
    Create Line With IDHeader    Price    productprice_baseprice.csv    1000
    Click Toolbar Save
    Close Current Tab
    
    Open Menu               Business Partner Group
    Click Toolbar Lookup
    Input Search Key Search     TF_BPGA
    Input Field Window Input    C_BP_Group0M_PriceList_ID      TF_PLLA 
    Click Toolbar Save
    Close Current Tab

    Create Document Header Select IDHeader   Sales Order   sales_order.csv      1003
    Click Toolbar Save
    Click Toolbar Detail
    Create Line With IDHeader    Sales OrderLine    sales_orderline_baseprice.csv    1000
    Input Field Window Input    C_OrderLine0M_Product_ID       TF_AP
    Click Ok PopUp first 1
    Input Field Window Input    C_OrderLine0C_Tax_ID       NON VAT
    SLEEP            3 


