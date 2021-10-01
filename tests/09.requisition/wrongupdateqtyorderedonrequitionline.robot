*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin      
Suite Teardown        Logout


*** Test Cases ***
Create Requisition Product And Charge
    Set Browser Implicit Wait      1s
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Click Toolbar Save
    ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo                                  
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1004
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    Set Create Line From Partial        ${documentnoreq}             Requisition         5
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  
    Refresh Page
    Open Menu            Requisition
    Open Search Document No       ${documentnoreq}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    ${documentnopo} =     Get Field Value    C_Order0DocumentNo                                  
    Set Create Line From Partial        ${documentnoreq}             Requisition         3
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  
    Refresh Page
    Open Menu            Requisition
    Open Search Document No       ${documentnoreq}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Close Current Tab
    Refresh Page
    Open Menu            Purchase Order
    Open Search Document No       ${documentnopo}
    Doc Action    Close
    Check Document Status     Closed 
    Close Current Tab
    Refresh Page    
    Open Menu            Requisition
    Open Search Document No       ${documentnoreq}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Close Current Tab        
    Create Document Header Select IDHeader      Requisition       requisition.csv   1000
    Click Toolbar Save
    ${documentnoreq2} =     Get Field Value    M_Requisition0DocumentNo                                  
    Click Toolbar Detail 
    Create Line With IDHeader    RequisitionLine    requisitionline.csv    1004
    Click Toolbar Parent
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab  
    Create Document Header Select IDHeader   Purchase Order   purchase_order.csv     1000  
    Click Toolbar Save
    ${documentnopo2} =     Get Field Value    C_Order0DocumentNo                                  
    Set Create Line From Partial        ${documentnoreq2}             Requisition         10
    Doc Action    Complete
    Check Document Status     Completed        
    Close Current Tab  
    Refresh Page
    Open Menu            Requisition
    Open Search Document No       ${documentnoreq2}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    1000
    Click Toolbar Save
    Set Create Line From Partial    ${documentnopo2}    Purchase Order       5
    ${documentnomr2} =     Get Field Value    M_InOut0DocumentNo                            
    Doc Action    Complete
    Check Document Status     Completed
    Close Current Tab
    Refresh Page
    Open Menu            Purchase Order
    Open Search Document No       ${documentnopo2}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Click Toolbar Parent
    Doc Action    Close
    Check Document Status     Closed 
    Close Current Tab
    Refresh Page    
    Open Menu            Requisition
    Open Search Document No       ${documentnoreq2}
    Click Toolbar Detail
    Scroll To Buttom Header Frame
    Close Current Tab    
    