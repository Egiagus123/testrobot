*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot

*** Keywords ***
Logger
                        [Arguments]               ${message}                                   ${level}=INFO
                        ${prefix} =               Set Variable If
                        ...                       """${level}"""=="""WARNING"""                WARNING.
                        ...                       """${level}"""=="""INFO"""                   INFO.
                        ...                       """${level}"""=="""DEBUG"""                  DEBUG.
                        ...                       """${level}"""=="""TRACE"""                  TRACE.
                        ${console}                Set Variable If                              """${level}""" in """${LOGCONSOLE}"""    ${True}               ${False}
                        Log                       message=${prefix}${message}                  level=${level}                           console=${console}

Get Prefix Line Name
                        [Arguments]               ${prefix}
                        ${prefixline} =           Get Substring                                ${prefix}                                0                     -1
                        ${prefixline} =           Set Variable                                 ${prefixline}Line0
                        [Return]                  ${prefixline}

Get CSV Line Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     -4
                        ${csvline} =              Set Variable                                 ${csvline}line.csv
                        [Return]                  ${csvline}

Get CSV ASI Line Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     -4
                        ${csvline} =              Set Variable                                 ${csvline}lineLot.csv
                        [Return]                  ${csvline}

Get CSV Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     0
                        ${csvline} =              Set Variable                                 ${csvline}
                        [Return]                  ${csvline}


Get Prefix Price Name
                        [Arguments]               ${prefix}
                        ${prefixline} =           Get Substring                                ${prefix}                                0                     -1
                        ${prefixline} =           Set Variable                                 ${prefixline}Price0
                        [Return]                  ${prefixline}

Get CSV Price Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     -4
                        ${csvline} =              Set Variable                                 ${csvline}price.csv
                        [Return]                  ${csvline}

Get Prefix Budget Name
                        [Arguments]               ${prefix}
                        ${prefixline} =           Get Substring                                ${prefix}                                0                     -7
                        ${prefixline} =           Set Variable                                 ${prefixline}Dimension0
                        [Return]                  ${prefixline}

Get CSV Budget Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     -4
                        ${csvline} =              Set Variable                                 ${csvline}dimension.csv
                        [Return]                  ${csvline}

Get Prefix BOM Name
                        [Arguments]               ${prefix}
                        ${prefixline} =           Get Substring                                ${prefix}                                0                     -1
                        ${prefixline} =           Set Variable                                 ${prefixline}_BOM0
                        [Return]                  ${prefixline}

Get CSV BOM Name
                        [Arguments]               ${csv}
                        ${csvline} =              Get Substring                                ${csv}                                   0                     -4
                        ${csvline} =              Set Variable                                 ${csvline}bom.csv
                        [Return]                  ${csvline}
                        
Get Prefix Transition                  
                        ${prefixline} =           Set Variable                                 AD_WF_Node0
                        [Return]                  ${prefixline}

Get CSV Transition
                        ${csvline} =              Set Variable                                 workflow_node.csv
                        [Return]                  ${csvline}


Get Prefix By Menu
                        [Arguments]               ${menu}
                        ${prefix} =               Set Variable If
                        ...                       """${menu}"""=="""Business Partner"""        C_BPartner0
                        ...                       """${menu}"""=="""Contact (User)"""          AD_User0                                      
                        ...                       """${menu}"""=="""Location"""                C_BPartner_Location0 
                        ...                       """${menu}"""=="""Price"""                   M_ProductPrice0
                        ...                       """${menu}"""=="""Bill of Materials"""       M_Product_BOM0 
                        ...                       """${menu}"""=="""Product"""                 M_Product0         
                        ...                       """${menu}"""=="""Physical Inventory"""      M_Inventory0
                        ...                       """${menu}"""=="""Physical InventoryLine"""      M_InventoryLine0                                                           
                        ...                       """${menu}"""=="""Enter Giro (In)"""              C_Payment0
                        ...                       """${menu}"""=="""Enter Giro (Out)"""              C_Payment0
                        ...                       """${menu}"""=="""Post Giro (In)"""              BHP_BankStatement0
                        ...                       """${menu}"""=="""Consignment Offer"""          BHP_ConOffer0
                        ...                       """${menu}"""=="""Giro Number Entry"""              BHP_Check_Number0
                        ...                       """${menu}"""=="""Consignment OfferLine"""          BHP_ConOfferLine0
                        ...                       """${menu}"""=="""Inventory Move"""          M_Movement0
                        ...                       """${menu}"""=="""Order MovementLine"""                  BHP_RMovementLine0     
                        ...                       """${menu}"""=="""Order Movement"""                  BHP_RMovement0               
                        ...                       """${menu}"""=="""Quotation"""    C_Order0
                        ...                       """${menu}"""=="""Quotation Line"""    C_OrderLine0
                        ...                       """${menu}"""=="""Purchase Order"""          C_Order0
                        ...                       """${menu}"""=="""Material Receipt"""        M_InOut0 
                        ...                       """${menu}"""=="""Invoice (Vendor)"""        C_Invoice0       
                        ...                       """${menu}"""=="""Vendor RMA"""       M_RMA0     
                        ...                       """${menu}"""=="""Payment Out"""             C_Payment0
                        ...                       """${menu}"""=="""Purchase OrderLine"""          C_OrderLine0
                        ...                       """${menu}"""=="""Invoice (VendorLine)"""      C_InvoiceLine0
                        ...                       """${menu}"""=="""Payment In"""              C_Payment0
                        ...                       """${menu}"""=="""Bank / Cash"""        C_Bank0
                        ...                       """${menu}"""=="""Charge"""                    C_Charge0
                        ...                       """${menu}"""=="""Sales Order"""             C_Order0
                        ...                       """${menu}"""=="""Sales OrderLine"""          C_OrderLine0
                        ...                       """${menu}"""=="""Shipment (Customer)"""     M_InOut0
                        ...                       """${menu}"""=="""Tax Number (Generate And Detail)"""          BHP_Tax_Number0 
                        ...                       """${menu}"""=="""Requisition"""    M_Requisition0
                        ...                       """${menu}"""=="""Inventory Move (Locator)"""                  M_Movement0    
                        ...                       """${menu}"""=="""Inventory Move (LocatorLine)"""                  M_MovementLine0                                              
                        ...                       """${menu}"""=="""RequisitionLine"""    M_RequisitionLine0
                        ...                       """${menu}"""=="""Blanket Order"""          BHP_Blanket0
                        ...                       """${menu}"""=="""Blanket OrderLine"""          BHP_BlanketLine0
                        ...                       """${menu}"""=="""Payment Selection"""                              C_PaySelection0                                             
                        ...                       """${menu}"""=="""Customer Return"""         M_InOut0
                        ...                       """${menu}"""=="""Return To Vendor"""        M_InOut0
                        ...                       """${menu}"""=="""Invoice (Customer)"""      C_Invoice0
                        ...                       """${menu}"""=="""Invoice (CustomerLine)"""      C_InvoiceLine0
                        ...                       """${menu}"""=="""Invoice (Customer) - Fix Asset"""      C_Invoice0
                        ...                       """${menu}"""=="""Node"""    AD_WF_Node0
                        ...                       """${menu}"""=="""Condition"""   AD_WF_NextCondition0
                        ...                       """${menu}"""=="""Transition"""    AD_WF_NodeNext0
                        ...                       """${menu}"""=="""Invoice (Customer) - Fix AssetLine"""      C_InvoiceLine0      
                        ...                       """${menu}"""=="""Asset Group"""                              A_Asset_Group0                          
                        ...                       """${menu}"""=="""Payment"""              C_Payment0
                        ...                       """${menu}"""=="""Budget Control Configuration"""                  BHP_BudgetConfig0                         
                        ...                       """${menu}"""=="""Asset Disposal"""                              A_Asset_Disposed0              
                        ...                       """${menu}"""=="""Asset"""                              A_Asset0        
                        ...                       """${menu}"""=="""Vendor RMALine"""       M_RMALine0          
                        ...                       """${menu}"""=="""Inventory Move (Warehouse From)"""                  M_Movement0               
                        ...                       """${menu}"""=="""Customer RMA"""       M_RMA0     
                        ...                       """${menu}"""=="""Customer RMALine"""       M_RMALine0        
                        ...                       """${menu}"""=="""Inventory Move (Warehouse To)"""                  M_Movement0      
                        ...                       """${menu}"""=="""Internal Use"""            M_Inventory0
                        ...                       """${menu}"""=="""Cost Adjustment"""         M_Inventory0
                        ...                       """${menu}"""=="""Production (Single Product)"""    M_Production0
                        ...                       """${menu}"""=="""Landed Cost"""       C_LandedCost0           
                        ...                       """${menu}"""=="""Budget Dimension"""                  BHP_BudgetDimension0  
                        ...                       """${menu}"""=="""Material ReceiptLine"""        M_InOutLine0                      
                       [Return]                  ${prefix}

Get Prefix By Menu 2
                        [Arguments]               ${menu}
                        ${prefix} =               Set Variable If
                        ...                       """${menu}"""=="""Invoice (Customer)"""      C_Invoice0
                        ...                       """${menu}"""=="""Invoice (CustomerLine)"""      C_InvoiceLine0
                        ...                       """${menu}"""=="""Invoice (Customer) - Fix Asset"""      C_Invoice0
                        ...                       """${menu}"""=="""Invoice (Customer) - Fix AssetLine"""      C_InvoiceLine0                        
                        ...                       """${menu}"""=="""Asset Disposal"""                              A_Asset_Disposed0              
                        ...                       """${menu}"""=="""Asset"""                              A_Asset0
                        ...                       """${menu}"""=="""Customer RMA"""       M_RMA0     
                        ...                       """${menu}"""=="""Customer RMALine"""       M_RMALine0
                        ...                       """${menu}"""=="""Vendor RMA"""       M_RMA0
                        ...                       """${menu}"""=="""Vendor RMALine"""       M_RMALine0   
                        ...                       """${menu}"""=="""Asset Addition"""        A_Asset_Addition0
                        ...                       """${menu}"""=="""Post Depreciation Entry"""        A_Depreciation_Entry0
                        ...                       """${menu}"""=="""Inventory Move (Warehouse From)"""                  M_Movement0                             
                        ...                       """${menu}"""=="""Inventory Move (Warehouse To)"""                  M_Movement0                             
                        ...                       """${menu}"""=="""Material ReceiptLine"""        M_InOutLine0                      
                        ...                       """${menu}"""=="""Product Category"""        M_Product_Category0                      
                        ...                       """${menu}"""=="""Business Partner Group"""        C_BP_Group0                      
                        ...                       """${menu}"""=="""Price List"""        M_PriceList0      
                        ...                       """${menu}"""=="""Version"""           M_PriceList_Version0      
                        ...                       """${menu}"""=="""Base Price"""           BHP_BasePrice0      
                        ...                       """${menu}"""=="""Base Price Hierarchy"""           BHP_Hierarchy0                            
                        ...                       """${menu}"""=="""Install Base"""           BHP_M_InstallBase0                            
                        ...                       """${menu}"""=="""Failure"""           BHP_M_Failure0                            
                        ...                       """${menu}"""=="""Analysis"""           BHP_M_Analysis0                            
                        ...                       """${menu}"""=="""Analysis Detail"""           BHP_M_AnalysisDetail0                            
                        ...                       """${menu}"""=="""Resolution"""           BHP_M_Resolution0                            
                        ...                       """${menu}"""=="""Resolution Detail"""           BHP_M_ResolutionDetail0                            
                        ...                       """${menu}"""=="""Employee Group"""           BHP_EmployeeGroup0                            
                        ...                       """${menu}"""=="""Employee"""           BHP_Employee0                            
                        ...                       """${menu}"""=="""Master Meter Display"""           BHP_M_MeterDisplay0                            
                        ...                       """${menu}"""=="""Work Order (EAM)"""           BHP_WOService0                            
                        ...                       """${menu}"""=="""Parts"""           BHP_Parts0                            
                        ...                       """${menu}"""=="""Labor"""           BHP_Labor0                            
                        ...                       """${menu}"""=="""Resource Assignment"""           BHP_ResouceAssignment0                            
                       [Return]                  ${prefix}
                        
Get Reversal Doc
    [Arguments]    ${description}
    ${description} =     Fetch From Left    ${description}    <-)
    ${reversal} =     Fetch From Right    ${description}    (
    [Return]    ${reversal}