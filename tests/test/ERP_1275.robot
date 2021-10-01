*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          MaterialReceipt
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Create Document Posting Receipt
    [Tags]    ERP-1275    Enhancement, Validation Create Lines From on Table M_inout
    [Documentation]    Create Document Posting Receipt
    
    # *****SCENE 1*****
    #Create Data product
    Create Document Product                       Product                   ERP_1275_DataMasterProduct.csv  
    Close Current Tab
    Refresh Page
    
    #CREATE PURCHASE ORDER
    Create Document Header Select IDHeader        Purchase Order            purchase_order.csv                    1003
    Click Toolbar Save
    
    #CREATE PURCHASE ORDERLINE
    Click Toolbar Detail
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1005
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1006
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1007
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1008
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1009
  
    Click Toolbar Parent
    ${documentno} =     Get Field Value           C_Order0DocumentNo
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab 
    Refresh Page
    
    #CREATE MATERIAL RECEIPT 1
    Create Document Header Select IDHeader        Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From Partial Multi Line       ${documentno}             Purchase Order                            
    Input Qty1    3
    Input Qty2    3
    Input Qty3    3
    Input Qty4    3
    Input Qty5    3
    Click Ok PopUp    
    ${documentnomr} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    
    #CREATE MATERIAL RECEIPT 2
    Create Document Header Select IDHeader       Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From Partial Random Lines    ${documentno}             Purchase Order
    Click CheckBoox Line 1     
    Click CheckBoox Line 3
    Click CheckBoox Line 4
    Click Ok PopUp    
    ${documentnomr} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    
    #CREATE MATERIAL RECEIPT 3
    Create Document Header Select IDHeader       Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From                         ${documentno}             Purchase Order       
    ${documentnomr} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    

    # *****SCENE 2*****
    #Create Data Charge
    Create Document Header Select IDHeader        Charge                    charge.csv                            1000
    Click Toolbar Save
    Refresh Page
    
    #CREATE PURCHASE ORDER
    Create Document Header Select IDHeader        Purchase Order            purchase_order.csv                    1003
    Click Toolbar Save
    
    #CREATE PURCHASE ORDERLINE
    Click Toolbar Detail
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1010
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1011
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1012
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1013
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1014
    Create Line With IDHeader                     Purchase OrderLine        purchase_orderline.csv                1015
  
    Click Toolbar Parent
    ${documentno2} =     Get Field Value          C_Order0DocumentNo
    Doc Action                                    Complete
    Check Document Status                         Completed
    Close Current Tab 
    Refresh Page
    
    # CREATE MATERIAL RECEIPT 1
    Create Document Header Select IDHeader        Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From Partial Multi Line       ${documentno2}            Purchase Order                            
    Input Qty1    2
    Input Qty2    2
    Input Qty3    2
    Input Qty4    2
    Input Qty5    2
    Click Ok PopUp    
    ${documentnomr2} =     Get Field Value       M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    
    #CREATE MATERIAL RECEIPT 2
    Create Document Header Select IDHeader       Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From Partial Random Lines    ${documentno2}            Purchase Order
    Click CheckBoox Line 1      
    Click CheckBoox Line 3 
    Click CheckBoox Line 4
    Click Ok PopUp    
    ${documentnomr2} =     Get Field Value       M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    
    #CREATE MATERIAL RECEIPT 3
    Create Document Header Select IDHeader       Material Receipt          material_receipt.csv                  1002
    Click Toolbar Save
    Set Create Line From                         ${documentno2}            Purchase Order     
    ${documentnomr2} =     Get Field Value       M_InOut0DocumentNo                            
    Doc Action                                   Complete
    Check Document Status                        Completed
    Click Posted
    Refresh Page
    
    
    #*****SCENE 3*****
    #CREATE SALES ORDER
    Create Document Header Select IDHeader        Sales Order            sales_order.csv                    1000
    Click Toolbar Save
    
    #CREATE SALES ORDERLINE
    Click Toolbar Detail
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1005
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1006
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1007
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1008
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1009
  
    Click Toolbar Parent
    ${documentno3} =     Get Field Value          C_Order0DocumentNo
    Doc Action                                    Complete
    Check Document Status                         Completed
    Close Current Tab 
    Refresh Page
    
    # CREATE SHIPMENT 1
    Create Document Header Select IDHeader        Shipment (Customer)               shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From Partial Multi Line       ${documentno3}                    Sales Order                            
    Input Qty1    3
    Input Qty2    3
    Input Qty3    3
    Input Qty4    3
    Input Qty5    3
    Click Ok PopUp    
    ${documentnomr3} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    # CREATE SHIPMENT 2
    Create Document Header Select IDHeader        Shipment (Customer)                shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From Partial Random Lines     ${documentno3}                     Sales Order
    Click CheckBoox Line 1      
    Click CheckBoox Line 3 
    Click CheckBoox Line 4
    Click Ok PopUp    
    ${documentnomr3} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    # CREATE SHIPMENT 3
    Create Document Header Select IDHeader        Shipment (Customer)                shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From                          ${documentno3}                     Sales Order     
    ${documentnomr3} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    
    #*****SCENE 4*****
    #CREATE SALES ORDER
    Create Document Header Select IDHeader        Sales Order            sales_order.csv                    1000
    Click Toolbar Save
    
    #CREATE SALES ORDERLINE
    Click Toolbar Detail
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1010
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1011
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1012
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1013
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1014
    Create Line With IDHeader                     Sales OrderLine        sales_orderline.csv                1015
  
    Click Toolbar Parent
    ${documentno4} =     Get Field Value          C_Order0DocumentNo
    Doc Action                                    Complete
    Check Document Status                         Completed
    Close Current Tab 
    Refresh Page
    
    # CREATE SHIPMENT 1
    Create Document Header Select IDHeader        Shipment (Customer)               shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From Partial Multi Line       ${documentno4}                    Sales Order                            
    Input Qty1    2
    Input Qty2    2
    Input Qty3    2
    Input Qty4    2
    Input Qty5    2
    Click Ok PopUp    
    ${documentnomr4} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    # CREATE SHIPMENT 2
    Create Document Header Select IDHeader        Shipment (Customer)                shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From Partial Random Lines     ${documentno4}                     Sales Order
    Click CheckBoox Line 1      
    Click CheckBoox Line 3 
    Click CheckBoox Line 4
    Click Ok PopUp    
    ${documentnomr4} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    # CREATE SHIPMENT 3
    Create Document Header Select IDHeader        Shipment (Customer)                shipment.csv                       1000
    Click Toolbar Save
    Set Create Line From                          ${documentno4}                     Sales Order     
    ${documentnomr4} =     Get Field Value        M_InOut0DocumentNo                            
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page

      
    
    
    
    
    
    
    
