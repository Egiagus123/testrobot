*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot
Resource                utils.robot
Resource                createlinefrom.robot

*** Variables ***
${LOGWINDOW} =          window.

*** Keywords ***
Today
                        ${DATETODAY} =  Get Current Date   result_format='%m/%d/%Y'
                        Set Global Variable         ${DATETODAY}
                        
X Day After
    [Arguments]         ${value}       
                        ${XDAYAFTER} =  Get Current Date     result_format='%m/%d/%Y'  increment=+${value} day
                        Log  ${XDAYAFTER}
                        Set Global Variable                                            ${XDAYAFTER}

Yesterday
    ${DATEYESTERDAY} =  Get Current Date     result_format='%m/%d/%Y'  increment=-1 day
    Set Global Variable         ${DATEYESTERDAY}

Tomorrow
    ${DATETOMORROW} =  Get Current Date     result_format='%m/%d/%Y'  increment=+1 day
    Set Global Variable         ${DATETOMORROW}

Validate Error Message
    [Arguments]                                 ${expected_errMessage}
    Wait Until Element Is Visible               xpath=(//div[@class="docstatus-error z-hlayout"]//span[@class="z-label"])[1]    timeout=10
    ${actual_status}=                           Get Element Attribute                                               xpath=(//div[@class="docstatus-error z-hlayout"]//span[@class="z-label"])[1]     innerHTML
    Should Contain                              ${actual_status}                        ${expected_errMessage}
    Sleep                                       5
    
Global Input Field
    [Arguments]                                        ${instancename}            ${value}        
    Input Field                 sizzle=[instancename="${instancename}"] input           ${value} 
    
Input Description In Dispute
    [Arguments]                                         ${value}
    Input Field                 sizzle=[instancename="M_InventoryLine0Description"]         ${value} 

Input Date Required
    [Arguments]                                         ${value}
    Input Field                 sizzle=[instancename="M_Requisition0DateRequired"] input          ${value} 

Input Date Required Today
    Today
    Input Field                 sizzle=[instancename="M_Requisition0DateRequired"] input          ${DATETODAY}  

Input Date Required Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="M_Requisition0DateRequired"] input           ${DATEYESTERDAY}
    SLEEP                       2  

Input Date Doc Today
    Today
    Input Field                 sizzle=[instancename="M_Requisition0DateDoc"] input          ${DATETODAY}  

Input Date Doc Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="M_Requisition0DateDoc"] input           ${DATEYESTERDAY}
    SLEEP                       2  


Input Date Ordered Today
    Today
    Input Field                 sizzle=[instancename="C_Order0DateOrdered"] input          ${DATETODAY}  

Input Date Promised Today
    Today
    Input Field                 sizzle=[instancename="C_Order0DatePromised"] input          ${DATETODAY} 
    SLEEP                       2

Input Date Promised Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="C_Order0DatePromised"] input          ${DATEYESTERDAY}
    SLEEP                       2  

Input Date Invoiced Today
    Today
    Input Field                 sizzle=[instancename="C_Invoice0DateInvoiced"] input          ${DATETODAY}  

Input Date Invoiced Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="C_Invoice0DateInvoiced"] input           ${DATEYESTERDAY}  

Input Date Acct Today
    Today
    Input Field                 sizzle=[instancename="C_Invoice0DateAcct"] input          ${DATETODAY} 
    SLEEP                       2

Input Date Acct Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="C_Invoice0DateAcct"] input          ${DATEYESTERDAY}
    SLEEP                       2  
          

Input Valid From Tax Number Today
    Today
    Input Field                 sizzle=[instancename="BHP_Tax_Number0ValidFrom"] input[class="z-datebox-input"]          ${DATETODAY} 
    SLEEP                       2
    
Input Operation Workflow
                               
    Press Keys                  sizzle=[instancename="AD_WF_NextCondition0Operation"] input[class="z-combobox-input"]                ARROW_DOWN+Return
    SLEEP                       2

Input Valid From Tax Number Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="BHP_Tax_Number0ValidFrom"] input[class="z-datebox-input"]          ${DATEYESTERDAY}
    SLEEP                       2  
     
Input Valid To Tax Number Today
    Today
    Input Field                 sizzle=[instancename="BHP_Tax_Number0ValidTo"] input[class="z-datebox-input"]          ${DATETODAY} 
    SLEEP                       2

Input Valid To Tax Number Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="BHP_Tax_Number0ValidTo"] input[class="z-datebox-input"]          ${DATEYESTERDAY}
    SLEEP                       2  
     

Input Date Movement Today
    Today
    Input Field                 sizzle=[instancename="M_InOut0MovementDate"] input          ${DATETODAY}  

Input Date Movement Yesterday
    Yesterday
    Input Field                 sizzle=[instancename="M_InOut0MovementDate"] input           ${DATEYESTERDAY}  

Close All Tabs
                        ${is_tab_exists} =                                  Is Element Exists                                                               css:.desktop-tabbox .z-tab-button .z-icon-times
                        Run Keyword If                                      ${is_tab_exists}                                                                Close Tab
                        ${is_tab_exists} =                                  Is Element Exists                                                               css:.desktop-tabbox .z-tab-button .z-icon-times
                        Run Keyword If                                      ${is_tab_exists}                                                                Close All Tabs

Close Tab
                        Click                                               css:.desktop-tabbox .z-tab-button .z-icon-times

Close Current Tab
                        Click                                               css:.desktop-tabbox .z-tab-selected .z-tab-button .z-icon-times

Close Current Tab First
                        Click                                               sizzle=.z-tab-button .z-icon-times:nth(0)
                        
Close X Tab
    [Arguments]                                         ${value}
                        Click                                               sizzle=.z-tab-button .z-icon-times:nth(${value})

Click Next Record
                        Click                                               sizzle=.breadcrumb-toolbar-button.z-toolbarbutton[title*="Alt+Right"]

Click Back Record
                        Click                                               sizzle=.breadcrumb-toolbar-button.z-toolbarbutton[title*="Alt+Left"]

    # TOOLBAR
Click Toolbar
                        [Arguments]                                         ${name}
                        Click                                               sizzle=.toolbar-button[title^="${name}"]
                        
Click Toolbar Undo
                        Click Toolbar                                               Und

Click Toolbar Copy Record
                        Click Toolbar                                                Copy Record
                        
Click Toolbar New
                        Click Toolbar                                       New
    
Click Toolbar Save
                        Click Toolbar                                       Save changes

Click Toolbar Parent
                        Click Toolbar                                      Parent Record
                        
Click Toolbar Detail
                        Click Toolbar                                       Detail record
                       
Click Detail On Form Workflow
                        Click                                               sizzle=div.z-south-collapsed

Click Toolbar Lookup
                        Click Toolbar                                       Lookup Record

Click Toolbar Import Data Loader
                        Click Toolbar                                       Import File Loader

Click Toolbar Zoom Across
                        Click Toolbar                                       Zoom Across (where used)

Click Toolbar Process
                        Click Toolbar                                       Process
                    
Click Toolbar Product Info
                        Click Toolbar                                       Product Info
                        
Click Toolbar Delete Record
                        Click Toolbar                                       Delete record
                        
Click Toolbar Grid tOggle
                        Click Toolbar                                       Grid tOggle
                        
Click Select All Base Hirarcky
                       Click               sizzle=div[class="z-column-content"] span[class="z-checkbox"]

Click Process on Generate Term
					    Click              sizzle=.z-menuitem:contains("Generate Terms")                          

Click Process on Generate Term New
					    Click              sizzle=.z-menuitem:contains("Generate Terms"):nth(1)   
                               
Click Process on Generate Term New 1
					    Click              sizzle=.z-menuitem:contains("Generate Terms"):nth(2)                          
                        
Click Process on Generate Term New 2
                        Click              sizzle=.z-menuitem:contains("Generate Terms"):nth(3)             
                        
Click Process on Generate Term New 3
                        Click              sizzle=.z-menuitem:contains("Generate Terms"):nth(4)              

Click Process on DownPayment
                        Click              sizzle=.z-menuitem:contains("DownPayment")  
                        
Click Process on DownPayment New
                        Click              sizzle=.z-menuitem:contains("DownPayment"):nth(1)                          

Click Process on DownPayment New 1
                        Click              sizzle=.z-menuitem:contains("DownPayment"):nth(2)     
                        
Click Process on DownPayment New 2
                        Click              sizzle=.z-menuitem:contains("DownPayment"):nth(3)             
                        
Click Process on DownPayment New 3
                        Click              sizzle=.z-menuitem:contains("DownPayment"):nth(4)    
                           
Click Button Create Inventory Count List
                        Click              sizzle=button[title="Create Inventory Count List"]
                        
Click Button Select All On Form
                        Click              sizzle=button[class="img-btn btn-selectall z-button"]
                        
Click Button Refresh On Form
                        Click              sizzle=button[class="img-btn btn-refresh z-button"] 

Click Button Process Generate On Form
                        Click              sizzle=button[class="img-btn btn-process z-button"]   
                                         
Click Button Checklist Ok Form
                        Click               sizzle=button[class="img-btn btn-ok z-button"]  
                        
Click Button Ok Form
                        Click               sizzle=button[class="txt-btn btn-ok z-button"]
                        
Click Button Open Generate On Form
                        Click              sizzle=button[class="img-btn btn-zoom z-button"]
                        
Input Inventory Quantity
    			       [Arguments]                                          ${value}
                       Input Field                                           sizzle=tr:contains("Inventory Quantity") input       ${value}    
    

Click Purchase Order From Line SO
                        Click              sizzle=[title="Purchase Order"]
    
Click Shipment From MR
                        Click              sizzle=[title="Material Shipment Document"]
                        
Process Down Payment
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on Generate Term
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             5000
					    Input Charge DownPayment Field       Down payment
					    SLEEP                            2
					    Click OK
					    SLEEP                            1

Process Down Payment Percent 100
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on Generate Term
					    Input Type Down Payment Field        Percentage
					    Input Down Payment Field             100
					    Input Charge DownPayment Field       Down payment
					    SLEEP                            2
					    Click OK
                        SLEEP                            1
                        
Process Down Payment Sales
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on DownPayment
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             5000
					    Input Charge DownPayment Field       Down payment
					    SLEEP                            2
					    Click OK
					    SLEEP                            1
	
Process Down Payment Sales Percent
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on DownPayment
					    Input Type Down Payment Field        Percentage
					    Input Down Payment Field             100
					    Input Charge DownPayment Field       Down payment
					    SLEEP                            2
					    Click OK
					    SLEEP                            1
					    				    
Process Generate Terms Percentage
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on Generate Term New
					    Input Type Down Payment Field        Percentage
					    Input Down Payment Field             60
					    Input Charge DownPayment Field new       Termin
					    SLEEP                            2
 					    Click OK
 					    SLEEP                            1
				
Process Downpayment Percentage
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on DownPayment New
					    Input Type Down Payment Field        Percentage
					    Input Down Payment Field             60
					    Input Charge DownPayment Field       Termin
					    SLEEP                            2 
					    Click OK
					    SLEEP                            1
	    
Process Generate Terms Amount
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on Generate Term New 1
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             6000
					    Input Charge DownPayment Field new       Termin 
					    SLEEP                            2
					    Click OK
					    SLEEP                            1

Process Downpayment Amount
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on DownPayment New 1
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             6000
					    Input Charge DownPayment Field       Termin
					    Sleep                            2 
					    Click OK
					    SLEEP                            1
					    
Process Generate Terms Amount 1
                        SLEEP                            2
					    Click Toolbar Process
					    SLEEP                            2
					    Click Process on Generate Term New 2
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             6000
					    Input Charge DownPayment Field new       Termin 
					    SLEEP                            2
					    Click OK
					    SLEEP                            1

Process DownPayment Amount 1
                        SLEEP                            2 
					    Click Toolbar Process
					    SLEEP                            2
					    Click Process on DownPayment New 2
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             6000
					    Input Charge DownPayment Field       Termin
					    SLEEP                            2 
					    Click OK
					    SLEEP                            1
					    					    
Process Generate Terms Amount New
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on Generate Term New 3
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             9000
					    Input Charge DownPayment Field new       Termin
					    SLEEP                            2 
					    Click OK
					    SLEEP                            1
					    
Process DownPayment Amount New
                        SLEEP                            2
					    Click Toolbar Process
					    Click Process on DownPayment New 3
					    Input Type Down Payment Field        Amount
					    Input Down Payment Field             9000
					    Input Charge DownPayment Field       Termin 
					    SLEEP                            2
					    Click OK
					    SLEEP                            1
		
Click Select
                Click                   sizzle=[title="Select"] input:nth(0)	
                SLEEP                   2
                
Click Select 1
                Click                   sizzle=[title="Select"] input:nth(2)	
                SLEEP                   2
                		    					    
Click Select 2
                Click                   sizzle=[title="Select"] input:nth(3)	
                SLEEP                   2	
     
Click Delete Term
    Click                               sizzle=.z-toolbarbutton[title*="Delete record"]:nth(4)
 
Click Delete Line
    Click                               sizzle=.z-toolbarbutton[title*="Delete record"]:nth(1)
 
Click Delete Term Sales
    Click                               sizzle=.z-toolbarbutton[title*="Delete record"]:nth(3)
                  	    					    
Search Document No
                            [Arguments]                                         ${instancename}          ${documentno}
                            Click Toolbar Lookup
                            Input Field Window Input                            ${instancename}          ${documentno}          
                            # Click Ok PopUp first

Create Landed Cost
                            [Arguments]                                         ${instancename}          ${documentno}

                                                
    #SUB TAB TEXT
Click Sub Tab
                        [Arguments]                                         ${name}
                        Click                                               sizzle=.z-tab-text[title^="${name}"]
                        
Click Tab
                        [Arguments]                                    ${title}
                        Click                                          sizzle=.z-tab-text[title^="${title}"]

    #CLICK IMAGE
Click Image
                        [Arguments]                                         ${name}
                        Click                                               sizzle=[instancename="${name}"] button
                        SLEEP                                               3

    #Click Zoom Across
Click Zoom Across
                        [Arguments]                                         ${name}
                        Click Toolbar Zoom Across
                        Click                                               sizzle=.z-menuitem-text:contains("${name}")

Click Zoom
                        [Arguments]                                         ${name}
                        Click                                               sizzle=.z-menuitem-text:contains("${name}")
                                         
    # TOOLBAR
Click Checkbox Set
                        [Arguments]                                         ${name}                        ${position}
                        Click                                               sizzle=tr:contains("${name}") span[class="z-checkbox"]:nth(${position})
Click CheckBoox
                        [Arguments]                                         ${name}
                        Click                                               sizzle=[instancename^="${name}"]

Click CheckBoox Create Line From
                        Click CheckBoox                                    Select
         
Click CheckBoox Line 1
                        Click                                               sizzle=[instancename^="Select"]:nth(0)

Click CheckBoox Line 2
                        Click                                               sizzle=[instancename^="Select"]:nth(1)
                        
Click CheckBoox Line 3
                        Click                                               sizzle=[instancename^="Select"]:nth(2)
                        
Click CheckBoox Line 4
                        Click                                               sizzle=[instancename^="Select"]:nth(3)
                        
Click CheckBoox Line 5
                        Click                                               sizzle=[instancename^="Select"]:nth(4)
                        
Click Select CheckBox Line List Form
                        [Arguments]                                         ${position}
                        Click                                               sizzle=[instancename^="Select"]:nth(${position})
               
Click IsCustomer
                        Click CheckBoox                                     C_BPartner0IsCustomer                                      

Click IsVendor
                        Click CheckBoox                                     C_BPartner0IsVendor                                      

    # GET VALUE
Get Field Value
                        [Arguments]                                         ${instancename}
                        Logger                                              ${LOGWINDOW}Get Field Value ${instancename}                                     DEBUG
                        ${class} =                                          Get Class Value                                                                 css:[instancename="${instancename}"]
                        ${is_textbox} =                                     Evaluate                                                                        "z-textbox" in """${class}"""
                        Run Keyword And Return If                           ${is_textbox}                                                                   Get Element Value                                                                                                         css:[instancename="${instancename}"]
                        ${is_checkbox} =                                    Evaluate                                                                        "z-checkbox" in """${class}"""
                        Run Keyword And Return If                           ${is_checkbox}                                                                  Get Checkbox Value                                                                                                        css:[instancename="${instancename}"] input
                        ${value}=                                           Get Element Value                                                               css:[instancename="${instancename}"] input
                        [Return]                                            ${value}

Get Records Count
                        ${value} =                                          Get Text                                                                        css:.breadcrumb-record-info span
                        ${value} =                                          Fetch From Right                                                                ${value}                                                                                                                  /
                        ${count} =                                          Convert To Integer                                                              ${value}
                        [Return]                                            ${count}

    # INPUT
Input Field Window Input
                        [Arguments]                                         ${instancename}                                                                 ${value}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        ${class}                                            Get Class Value                                                                 css:[instancename="${instancename}"]
                        Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:[instancename="${instancename}"]          ${value}
                        Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:[instancename="${instancename}"] input    ${value}
                        # Run Keyword And Return If                           '${class}'=='editor-box z-div'                                                  Click                                                                                                                     css:[instancename="${instancename}"] button
                        Input Field                                         css:[instancename="${instancename}"] input                                      ${value}

Input Field Window
                        [Arguments]                                         ${instancename}                                                                 ${value}         ${prefix}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        ${class}                                            Get Class Value                                                                 css:[instancename="${instancename}"]
                        # ${Attributasi} =        Is Element Exists          sizzle=[instancename="${prefix}M_AttributeSetInstance_ID"] button
                        @{asi} =  Split String    ${value}    separator=#
                        ${asiinsertread}   Get From List   ${asi}    0
                        ${insert}    Set Variable     I
                        ${read}    Set Variable     R 
                        ${charge} =                                  Is Element Exists                                                               sizzle=[instancename="${prefix}C_Charge_ID"] input
                        @{ascharge} =  Run Keyword If    '${instancename}'=='${prefix}C_Charge_ID'   Split String    ${value}    separator=#
                        ${chargetrue}=  Run Keyword If    '${instancename}'=='${prefix}C_Charge_ID'   Get From List   ${ascharge}    0
                        Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:[instancename="${instancename}"]          ${value}
                        Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:[instancename="${instancename}"] input    ${value}
                        ${error_ok} =            Is Element Exists                      sizzle=button[title="OK"]
                        ${charge}       Set Variable    ${prefix}C_Charge_ID         
                        Run Keyword If  '${instancename}'!='${prefix}M_AttributeSetInstance_ID'           Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Click New Record ASI              ${instancename} 
                        Run Keyword If            '${read}' == '${asiinsertread}'            Click Select ASI                    ${instancename}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Input ASI LOT SN     ${asi}
                        Run Keyword If            '${read}' == '${asiinsertread}'             Click Select List ASI     ${asi}     ${asiinsertread}
                        Run Keyword If            ${error_ok}              Click Ok PopUp 

Input Field Window Line
                        [Arguments]                                         ${instancename}                                                                 ${value}         ${prefix}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        @{asi} =  Split String    ${value}    separator=#
                        ${asiinsertread}   Get From List   ${asi}    0
                        ${insert}    Set Variable     I
                        ${read}    Set Variable     R 
                        @{ascharge} =  Run Keyword If    '${instancename}'=='${prefix}C_Charge_ID'   Split String    ${value}    separator=#
                        ${charge2}       Set Variable    ${prefix}C_Charge_ID       
                        @{asdropbp} =  Run Keyword If    '${instancename}'=='${prefix}DropShip_BPartner_ID'   Split String    ${value}    separator=#  
                        @{asdroplocation} =  Run Keyword If    '${instancename}'=='${prefix}DropShip_Location_ID'   Split String    ${value}    separator=#  
                        ${dropbp2}       Set Variable    ${prefix}DropShip_BPartner_ID    
                        ${droplocation2}       Set Variable    ${prefix}DropShip_Location_ID    
                        ${instancename2}  Set Variable   ${instancename}
                        ${chargetrue}=  Run Keyword If    '${instancename}'=='${charge2}'   Get From List   ${ascharge}    0
                        @{asproduct} =  Run Keyword If    '${instancename}'=='${prefix}M_Product_ID'   Split String    ${value}    separator=#
                        ${producttrue}=  Run Keyword If    '${instancename}'=='${prefix}M_Product_ID'   Get From List   ${asproduct}    0                        
                        ${chargenone}=	                Run Keyword And Return Status	  Should Be Equal	${chargetrue}	    ${None}                            # Run Keyword If  '${instancename}'=='${prefix}C_Charge_ID'             Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        ${productnone}=	                Run Keyword And Return Status	  Should Be Equal	${producttrue}	    ${None}                            # Run Keyword If  '${instancename}'=='${prefix}C_Charge_ID'             Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        ${dropbptrue}=  Run Keyword If    '${instancename}'=='${dropbp2}'   Get From List   ${asdropbp}    0
                        ${droplocationtrue}=  Run Keyword If    '${instancename}'=='${droplocation2}'   Get From List   ${asdroplocation}    0
                        ${dropbp} =            Is Element Exists                      sizzle=[${prefix}DropShip_BPartner_ID]       
                        ${droplocation} =            Is Element Exists                      sizzle=[${prefix}DropShip_Location_ID]   
                        ${class}=    Run Keyword Unless  '${instancename}'=='${prefix}M_Product_ID' or '${instancename}'=='${prefix}C_Charge_ID' or '${instancename}'=='${prefix}M_AttributeSetInstance_ID' or '${instancename}'=='${prefix}DropShip_Location_ID' or '${instancename}'=='${prefix}DropShip_BPartner_ID'                            Get Class Value                                                                 css:[instancename="${instancename}"]
                        ${error_ok} =            Is Element Exists                      sizzle=button[title="OK"]
                        ${error_ok2} =            Is Element Exists                      sizzle=button[title="OK"]:nth(0) 
                        ${error_ok3} =            Is Element Exists                      sizzle=button[title="OK"]:nth(1) 
                        Run Keyword If            ${dropbp}            Input Field            css:[instancename="${prefix}DropShip_BPartner_ID"] input
                        Run Keyword If            ${droplocation}            Input Field            css:[instancename="${prefix}DropShip_Location_ID"] input            
                        Run Keyword Unless  '${instancename}'=='${prefix}M_Product_ID' or '${instancename}'=='${prefix}C_Charge_ID' or '${instancename}'=='${prefix}M_AttributeSetInstance_ID' or '${instancename}'=='${prefix}DropShip_Location_ID' or '${instancename}'=='${prefix}DropShip_BPartner_ID'                                 Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:[instancename="${instancename}"]          ${value}
                        Run Keyword Unless  '${instancename}'=='${prefix}M_Product_ID' or '${instancename}'=='${prefix}C_Charge_ID' or '${instancename}'=='${prefix}M_AttributeSetInstance_ID' or '${instancename}'=='${prefix}DropShip_Location_ID' or '${instancename}'=='${prefix}DropShip_BPartner_ID'                       Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:[instancename="${instancename}"] input    ${value}
                        Run Keyword Unless  '${instancename}'=='${prefix}M_Product_ID' or '${instancename}'=='${prefix}C_Charge_ID' or '${instancename}'=='${prefix}M_AttributeSetInstance_ID' or '${instancename}'=='${prefix}DropShip_Location_ID' or '${instancename}'=='${prefix}DropShip_BPartner_ID'                Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        Run Keyword Unless            '${chargetrue}'=='' or '${instancename}'!='${prefix}C_Charge_ID'           Input Field                                         css:[instancename="${prefix}C_Charge_ID"] input                                      ${value}
                        Run Keyword Unless            '${producttrue}'=='' or '${instancename}'!='${prefix}M_Product_ID'        Input Field                                         css:[instancename="${prefix}M_Product_ID"] input                                      ${value}  
                        Run Keyword Unless            '${dropbptrue}'=='' or '${instancename}'!='${prefix}DropShip_BPartner_ID'           Input Field                                         css:[instancename="${prefix}DropShip_BPartner_ID"] input                                      ${value}
                        Run Keyword Unless            '${droplocationtrue}'=='' or '${instancename}'!='${prefix}DropShip_Location_ID'        Input Field                                         css:[instancename="${prefix}DropShip_Location_ID"] input                                      ${value}                      
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Click New Record ASI              ${instancename} 
                        Run Keyword If            '${read}' == '${asiinsertread}'            Click Select ASI                    ${instancename}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Input ASI LOT SN     ${asi}
                        Run Keyword If            '${read}' == '${asiinsertread}'             Click Select List ASI     ${asi}     ${asiinsertread}
                        SLEEP                     2
                        Run Keyword If            ${error_ok}              Click Ok PopUp first 1
                        Run Keyword If            ${error_ok2}              Click Ok PopUp first Double  
                        Run Keyword If            ${error_ok3}              Click Ok PopUp first 3 

                        # Run Keyword If            ${error_ok}              Click Ok PopUp Double  


Input Field Window ASI 2
                        [Arguments]                                         ${instancename}                                                                 ${value}         ${prefix}                    ${IDLine}      ${ID}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        ${class}                                            Get Class Value                                                                 css:[instancename="${instancename}"]
                        # ${Attributasi} =        Is Element Exists          sizzle=[instancename="${prefix}M_AttributeSetInstance_ID"] button
                        @{productname} =      Run Keyword If        '${instancename}'=='${prefix}M_Product_ID'        Split String     ${value}
                        @{asi} =  Split String    ${value}    separator=#
                        ${asiinsertread}   Get From List   ${asi}    0
                        ${insert}    Set Variable     I
                        ${read}    Set Variable     R 
                        ${charge} =                                  Is Element Exists                                                               sizzle=[title="Additional document charges"] input
                        Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:[instancename="${instancename}"]          ${value}
                        Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:[instancename="${instancename}"] input    ${value}
                        # Run Keyword If        '${instancename}'!='${prefix}M_AttributeSetInstance_ID' or ${charge}                 Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Click New Record ASI              ${instancename} 
                        Run Keyword If            '${read}' == '${asiinsertread}'            Click Select ASI                    ${instancename}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Input ASI LOT SN     ${asi}
                        Run Keyword If            '${read}' == '${asiinsertread}'             Click Select List ASI     ${asi}     ${asiinsertread}
                        Run Keyword If        '${instancename}'=='${prefix}M_AttributeSetInstance_ID'                  SLEEP                    2 
                        Run Keyword If        '${instancename}'=='${prefix}M_AttributeSetInstance_ID'                  Click Toolbar Save 
                        Run Keyword If        '${instancename}'=='${prefix}M_AttributeSetInstance_ID'                 Click Next Record

Input Field Window ASI
                        [Arguments]                                         ${instancename}                                                                 ${value}         ${prefix}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        ${class}                                            Get Class Value                                                                 css:[instancename="${instancename}"]
                        # ${Attributasi} =        Is Element Exists          sizzle=[instancename="${prefix}M_AttributeSetInstance_ID"] button
                        @{productname} =      Run Keyword If        '${instancename}'=='${prefix}M_Product_ID'        Split String     ${value}
                        @{asi} =  Split String    ${value}    separator=#
                        ${asiinsertread}   Get From List   ${asi}    0
                        ${insert}    Set Variable     I
                        ${read}    Set Variable     R 
                        ${charge} =                                  Is Element Exists                                                               sizzle=[title="Additional document charges"] input
                        Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:[instancename="${instancename}"]          ${value}
                        Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:[instancename="${instancename}"] input    ${value}
                        # Run Keyword If        '${instancename}'!='${prefix}M_AttributeSetInstance_ID' or ${charge}                 Input Field                                         css:[instancename="${instancename}"] input                                      ${value}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Click New Record ASI              ${instancename} 
                        Run Keyword If            '${read}' == '${asiinsertread}'            Click Select ASI                    ${instancename}
                        Run Keyword If            '${insert}' == '${asiinsertread}'           Input ASI LOT SN     ${asi}
                        Run Keyword If            '${read}' == '${asiinsertread}'             Click Select List ASI     ${asi}     ${asiinsertread}
                        
                        
Input Field Form
                        [Arguments]                                         ${instancename}                                                                 ${value}         ${prefix}
                        Logger                                              ${LOGWINDOW}Input Field Window ${instancename}, value = ${value}                DEBUG
                        ${organization} =               Set Variable                "Organization        
                        ${doctype} =               Set Variable                "Document Type
                        ${bp} =               Set Variable                "Business Partner                                
                        ${list} =                Set Variable                 sizzle=select[class="z-select"]        
                        ${inputsearch} =         Set Variable                 sizzle=input[class="editor-input z-textbox"]
                        ${date} =                Set Variable                 sizzle=input[class="z-datebox-input"]:nth(0)                       
                        ${checbox} =             Set Variable                 sizzle=span[class="z-checkbox"] input                        
                        ${name}         Set Variable               ${instancename}
                        # Run Keyword And Return If                           '${class}'=='z-textbox'                                                         Input Field                                                                                                               css:tr:contains("${instancename}") input[class="z-combobox-input"]          ${value}
                        # Run Keyword And Return If                           '${class}'=='z-checkbox'                                                        Set Checkbox                                                                                                              css:tr:contains("${instancename}") span[class="z-checkbox"] input    ${value}
                        # Run Keyword If        '${class}'=='z-combobox-input'              Input Field                     css:tr:contains(${instancename}") input[class="z-combobox-input"]                                      ${value}
                        # Run Keyword If        '${class}'=='z-select'             Input Field                     css:tr:contains(${instancename}") select[class="z-select"]                                      ${value}
                        # Run Keyword If        '${class}'=='editor-input z-textbox'              Input Field                     css:tr:contains(${instancename}") input[class="editor-input z-textbox"]                                      ${value}
                        # Run Keyword If        '${class}'=='z-checkbox'              Input Field                     css:tr:contains(${instancename}") span[class="z-checkbox"] input                                      ${value}
                        Run Keyword If        '${organization}'=='${name}'              Input Field                     sizzle=tr:contains(${instancename}") input[class="z-combobox-input"]                                      ${value}
                        Run Keyword If        '${doctype}'=='${name}'              Input Field                     sizzle=tr:contains(${instancename}") input[class="z-combobox-input"]                                      ${value}
                        Run Keyword If        ${list}              Input Field                     css:tr:contains(${instancename}") select[class="z-select"]                                      ${value}
                        # Run Keyword If        ${inputsearch}              Input Field                     css:tr:contains(${instancename}") input[class="editor-input z-textbox"]                                      ${value}
                        # Run Keyword If        ${checbox}              Input Field                     css:tr:contains(${instancename}") span[class="z-checkbox"] input                                      ${value}

                                                                                
Click Image New
    [Arguments]                                         ${instancename}
    Click               css:[instancename="${instancename}"] button


Input From CSV
                        [Arguments]                                         ${csv_name}                                                                     ${prefix}                                                                                                                 ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        # Set end index equals to last index if set to 0
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        FOR                                                ${i}                                                                           IN RANGE                                                                                                                  ${start_index}                              ${end_indexheader}
                        # Continue For Loop If                                ${i}>1
                        Click Toolbar New
                        Input Data                                          ${csv[${i}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END
                        
Input From CSV Save
                        [Arguments]                                         ${csv_name}                                                                     ${prefix}                                                                                                                 ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        # Set end index equals to last index if set to 0
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        FOR                                                ${i}                                                                           IN RANGE                                                                                                                  ${start_index}                              ${end_indexheader}
                        # Continue For Loop If                                ${i}>1
                        Click Toolbar New
                        Input Data                                          ${csv[${i}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        END
 

Input From CSV Save Test
                        [Arguments]                                         ${csv_name}                                                                     ${prefix}                      ${IDHeader}                                                                                             ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        # Set end index equals to last index if set to 0
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1
                        FOR                                                ${i}                                                                           IN RANGE                                                                                                                  ${start_index}                              ${end_indexheader}
                        ${ID}                 Set Variable            ${csv[${i}][${start}]}                                  
                        Run Keyword If        ${ID}==${IDHeader}        Click Toolbar New
                        Run Keyword If        ${ID}==${IDHeader}     Input Data                                          ${csv[${i}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If        ${ID}==${IDHeader}     Click Toolbar Save                    
                        END
 
Input From CSV Save Line
                        [Arguments]                                         ${csv_name}                                                                   ${prefix}                      ${ID}                                                                                             ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csvline} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_countline} =                                      Get Length                                                                      ${csvline}
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_countline}                                  ${end_index}
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}
                        ${countlinelot}=           Evaluate      ${column_countline} - 2
                        ${countlinesn}=           Evaluate      ${column_countline} - 1
                        ${countlineasi}=           Evaluate      ${column_countline} - 3
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexline} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        ${end_indexlineend} =    Evaluate          ${end_indexline} + 1 
                        ${start}=          Evaluate          ${start_indexheader} - 1
                        ${startline}=          Evaluate          ${start_indexheader} + 1 
                        ${Attribute}              Set Variable            ${csvline[0][${start_indexheader}]}            
                        FOR                                                 ${i}                                                                           IN RANGE                                                                                                                    ${start_index}                              ${end_indexline}
                        ${IDLine}                 Set Variable            ${csvline[${i}][${start}]}                                  
                        Run Keyword If            ${IDLine} == ${ID}       SLEEP                    2
                        Run Keyword If            ${IDLine} == ${ID}       Click Toolbar New
                        Run Keyword If            ${IDLine} == ${ID}         Input Data Line                               ${csvline[${i}]}                      ${prefix}                                                                   ${columnsline}         ${start_indexheader}                           ${column_countline}
                        Run Keyword If            ${IDLine} == ${ID}         Click Toolbar Save
                        END

Input From CSV Save Line ASI
                        [Arguments]                                         ${csv_name}                                                                   ${prefix}                      ${ID}                                                                                             ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csvline} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_countline} =                                      Get Length                                                                      ${csvline}
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_countline}                                  ${end_index}
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}
                        ${countlinelot}=           Evaluate      ${column_countline} - 2
                        ${countlinesn}=           Evaluate      ${column_countline} - 1
                        ${countlineasi}=           Evaluate      ${column_countline} - 3
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexline} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        ${end_indexlineend} =    Evaluate          ${end_indexline} + 1 
                        ${start}=          Evaluate          ${start_indexheader} - 1
                        ${startline}=          Evaluate          ${start_indexheader} + 1 
                        ${Attribute}              Set Variable            ${csvline[0][${start_indexheader}]}            
                        FOR                                                 ${i}                                                                           IN RANGE                                                                                       ${start_index}                              ${end_indexline}
                        # Click Toolbar Detail
                        # ${productname}=      Set Variable    
                        # Open Search Product No    
                        ${IDLine}                 Set Variable            ${csvline[${i}][${start}]}                                  
                        Run Keyword If            ${IDLine} == ${ID}         Input Data Line ASI 2                               ${csvline[${i}]}                      ${prefix}                                                                   ${columnsline}         ${start_indexheader}                           ${column_countline}                ${IDLine}      ${ID}
                        # SLEEP                      2
                        # Run Keyword If            ${IDLine} == ${ID}         Click Toolbar Save
                        # Run Keyword If            ${IDLine} == ${ID}         Click Next Record    
                        END
                        

Input Data
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                     ${start_index}                 ${column_count}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                      ${start_index}                             ${column_count}
                        Input Field Window                                  ${prefix}${columns}[${k}]                                                       ${data}[${k}]                   ${prefix}                          
                        END

Input Data Line
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                     ${start_indexheader}                 ${countlinelot}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                      ${start_indexheader}                             ${countlinelot}
                        Input Field Window Line                                  ${prefix}${columns}[${k}]                                                       ${data}[${k}]                   ${prefix}                          
                        END

Input Data Line ASI 2
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                     ${start_indexheader}                 ${countlinelot}    ${IDLine}    ${ID}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                      ${start_indexheader}                             ${countlinelot}
                        Input Field Window ASI 2                               ${prefix}${columns}[${k}]                                                       ${data}[${k}]                   ${prefix}                          ${IDLine}      ${ID}
                        # Click Toolbar Save
                        # Click Next Record
                        END

Input Data Line ASI
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                     ${start_indexheader}                 ${countlinelot}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                      ${start_indexheader}                             ${countlinelot}
                        Input Field Window ASI                                ${prefix}${columns}[${k}]                                                       ${data}[${k}]                   ${prefix}                          
                        END

Input Data Form
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                     ${start_index}                 ${column_count}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                      ${start_index}                             ${column_count}
                        Input Field Form                                 ${prefix}${columns}[${k}]                                                       ${data}[${k}]                   ${prefix}                          
                        END

Input Data PopUp
                        [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                                    ${column_count}
                        FOR                                                 ${k}                                                                            IN RANGE                                                                                                                  ${column_count}
                        Input Field Window PopUp                            ${prefix}${columns}[${k}]                                                       ${data}[${k}]
                        END

Input From CSV PopUp
                        [Arguments]                                         ${csv_name}                                                                     ${prefix}                                                                                                                 ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        # Set end index equals to last index if set to 0
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}
                        FOR                                                 ${i}                                                                           IN RANGE                                                                                                                    ${start_index}                              ${end_index}
                        Click Toolbar New
                        Input Data PopUp                                         ${csv[${i}]}                                                                    ${prefix}                                                                                                                 ${columns}                                    ${column_count}
                        END

Input From CSV Form
                        [Arguments]                                         ${csv_name}                                                                   ${prefix}                      ${ID}                                                                                             ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csvline} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_countline} =                                      Get Length                                                                      ${csvline}
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_countline}                                  ${end_index}
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}
                        ${countlinelot}=           Evaluate      ${column_countline} - 2
                        ${countlinesn}=           Evaluate      ${column_countline} - 1
                        ${countlineasi}=           Evaluate      ${column_countline} - 3
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${end_indexline} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        ${end_indexlineend} =    Evaluate          ${end_indexline} + 1 
                        ${start}=          Evaluate          ${start_indexheader} - 1
                        ${startline}=          Evaluate          ${start_indexheader} + 1 
                        ${Attribute}              Set Variable            ${csvline[0][${start_indexheader}]}            
                        FOR                                                 ${i}                                                                           IN RANGE                                                                                                                    ${start_index}                              ${end_indexline}
                        ${IDLine}                 Set Variable            ${csvline[${i}][${start}]}                                  
                        Input Data Form                               ${csvline[${i}]}                      ${prefix}                                                                   ${columnsline}         ${start_indexheader}                           ${column_countline}
                        # Run Keyword If            ${IDLine} == ${ID}         Click Toolbar Save
                        END

Open Menu Create Record
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        Open Menu                                           ${menu}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV                                      ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      

Open Menu Create Form
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        Open Menu                                           ${menu}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Form                                ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      

Open Menu Create Record Save
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        Open Menu                                           ${menu}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Save                                 ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      

Open Menu Create Record Save 2
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        Open Menu                                           ${menu}
                        ${prefix} =                                         Get Prefix By Menu 2                                                             ${menu}
                        Input From CSV Save                                 ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      

Search Menu Create Record Save
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        Search Modul Name                                           ${menu}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Save                                 ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      

Open Menu Create Record Save Test Create Line From
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                           ${number}            ${name}               ${IDHeader}                                                                    ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHeader}     Click Toolbar New
                        Run Keyword If     ${ID}==${IDHeader}     Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Save                    
	                    Run Keyword If     ${ID}==${IDHeader}              Set Create Line From      ${number}            ${name}
	                    Run Keyword If     ${ID}==${IDHeader}             SLEEP                            2	      
                        Run Keyword If     ${ID}==${IDHeader}        Doc Action    Complete
                        END

Open Menu Create Record Save Test
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                        ${IDHeader}                                                                    ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHeader}     Click Toolbar New
                        Run Keyword If     ${ID}==${IDHeader}     Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Save                    
                        END
                                            

Open Menu Create Record Save Test Payment
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                        ${IDHeader}                                                                    ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHeader}     Click Toolbar New
                        Run Keyword If     ${ID}==${IDHeader}     Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Save                    
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Detail                     
                        END
                                             
Create Record
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV                                      ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      ${index+1}

Create Record Save
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Save                                     ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      ${index+1}

Create Record ASI
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV ASI                                     ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      ${index+1}

Create Record Save Header
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Open Menu                                           ${menu}
                        Input From CSV Save                                     ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      ${index+1}

Create Record Save Line
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                                                                                                   ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Save Line                            ${csv_name}                                                                     ${prefix}                                                                                                              ${start_index}                                ${end_index}
                        Click Toolbar Parent

Create Record PopUp
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV PopUp                                     ${csv_name}                                                                     ${prefix}                                                                                                                 ${index}                                      ${index+1}

Create Document
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        Doc Action    Complete
                        END
                        
Create Document Window
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                          ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        Doc Action    Complete
                        END
                        
    
Create Document No Lines
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                          ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        # Doc Action    Complete
                        END
 
Create Document Test
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                          ${IDHeader}                                                                    ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHeader}     Click Toolbar New
                        Run Keyword If     ${ID}==${IDHeader}     Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Save                    
                        Run Keyword If     ${ID}==${IDHeader}        Click Toolbar Detail
	                    Run Keyword If     ${ID}==${IDHeader}    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Run Keyword If     ${ID}==${IDHeader}       Click Toolbar Parent
                        Run Keyword If     ${ID}==${IDHeader}        Doc Action    Complete
                        END
 
Create Document (Create Line From ASI)
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                              ${number}            ${name}                                                                ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        # ${start}=          Evaluate          ${start_indexheader} - 1
                        ${numbedsdr}  Set Variable    ${number}
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        # ${is_tab_exists} =                                  Is Element Exists                                                               css:.desktop-tabbox .z-tab-button .z-icon-times
	                    # ${productname} =    Set Variable     
	                    Set Create Line From      ${number}            ${name}
	                    SLEEP                            2	      
	                    Click Toolbar Detail              
	                    Input From CSV Save Line ASI            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        Doc Action    Complete
                        END
      
Create Document (Create Line From ASI) Test
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                              ${number}            ${name}                              ${IDHeader}                                  ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        # ${start}=          Evaluate          ${start_indexheader} - 1
                        ${numbedsdr}  Set Variable    ${number}
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
   	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHeader}  Click Toolbar New
                        Run Keyword If     ${ID}==${IDHeader}   Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${ID}==${IDHeader}   Click Toolbar Save                    
                        # ${is_tab_exists} =                                  Is Element Exists                                                               css:.desktop-tabbox .z-tab-button .z-icon-times
	                    # ${productname} =    Set Variable     
	                    Run Keyword If     ${ID}==${IDHeader}              Set Create Line From      ${number}            ${name}
	                    Run Keyword If     ${ID}==${IDHeader}             SLEEP                            2	      
	                    Run Keyword If     ${ID}==${IDHeader}             Click Toolbar Detail              
	                    Run Keyword If     ${ID}==${IDHeader}         Input From CSV Save Line ASI          ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Run Keyword If     ${ID}==${IDHeader}         Click Toolbar Parent
                        Run Keyword If     ${ID}==${IDHeader}       Doc Action    Complete
                        END


         
Create Document Product
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Price Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Price Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save
                        Click Sub Tab    Price                    
                        Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        END
                                        

Create Document Budget
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Budget Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Budget Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Search Modul Name                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        SLEEP                                             3
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        END

Create Document Form
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                              ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${csvline_generated} =                              Get CSV Line Name                                                               ${csv_name}
                        ${csvline_name} =                                   Set Variable If                                                                 ${csvline_name}==${None}                                                                                                  ${csvline_generated}                          ${csvline_name}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        ${prefixline_generated} =                           Get Prefix Line Name                                                            ${prefix}
                        ${prefixline} =                                     Set Variable If                                                                 ${prefixline}==${None}                                                                                                    ${prefixline_generated}                       ${prefixline}                      
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        @{csvline} =                                        Read Csv File To List                                                           ${DATA_DIR}${/}${csvline_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        @{columnsline} =                                        Set Variable                                                                    ${csvline[0]}
                        ${column_countline} =                                   Get Length                                                                      ${columnsline}                   
                        ${countline}=           Evaluate      ${column_countline} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        Click Toolbar New
                        Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Click Toolbar Save                    
                        Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Click Toolbar Parent
                        Doc Action    Complete
                        END
                                 
Input
                        [Arguments]                                         ${csv_name}                                                                     ${prefix}                                                                                                                 ${start_index}=${1}                           ${end_index}=${2}
                        Logger                                              ${LOGWINDOW}Input From CSV ${csv_name} ${prefix} ${start_index}-${end_index}    DEBUG
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        # Set end index equals to last index if set to 0
                        ${end_index} =                                      Set Variable If                                                                 ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}
                        FOR                                                ${i}                                                                           IN RANGE                                                                                                                  ${start_index}                              ${end_index}
                        # Continue For Loop If                                ${i}>1
                        Click Toolbar New
                        Input Data                                          ${csv[${i}]}                                                                    ${prefix}                                                                                                                 ${columns}                                    ${column_count}
                        Click Toolbar Save                    
                        END

Create Record Product BOM
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                               ${index}=${1}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                                                                                                   ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        Input From CSV Save                                 ${csv_name}                                                                     ${prefix}                                                                                                                 ${start_index}                                ${end_index}
                    
Doc Action
                        [Arguments]                                         ${docaction}
                        Click                                               sizzle=button[instancename*="0DocAction"]
                        Wait for Element                                    css:.doc-action-dialog select
                        Select From List By Label                           css:.doc-action-dialog select                                                   ${docaction}                      
                        Click Ok PopUp
                        Wait Until Page Does Not Contain Element            css:.popup-dialog
                        SLEEP                                               2               
                        
Seacrh Advance Product
                        [Arguments]                                         ${product}         ${productname}
                        Wait for Element                                    sizzle=.z-select:nth(2)
                        Select From List By Label                           sizzle=.z-select:nth(2)                                                   ${product}
                        Click Ok PopUp New
                        Wait Until Page Does Not Contain Element            sizzle=.popup-dialog
                        Input Field                                         sizzle=[instancename="M_Product_ID"] input[class="editor-input grid-editor-input z-textbox"]:nth(1)     ${productname}
Click Posted
                        Click                                               sizzle=button[instancename*="0Posted"]

Open Posting 
                        Click Posted
                        Click                                               css:.z-tab span[title="Posting"]

Click Repost
                        Click                                               sizzle=.z-button:contains("Re-Post")

Repost Document
                        Open Posting
                        Click Repost
                        Click                                               css:.popup-dialog .btn-ok
                        Close Current Tab

Get Posting Amount
                        [Arguments]                                         ${row}                                                                          ${column}
                        ${amtstr} =                                         Get Text                                                                        css:.desktop-tabbox .z-listbox-body .z-listitem:nth-child(${row}) .z-listcell:nth-child(${column}) .z-listcell-content
                        #${amtstr} =                                        Fetch From Left                                                                 ${amtstr}                                                                                                                 ${DECIMAL_SEPARATOR}
                        ${amtstr} =                                         Remove String                                                                   ${amtstr}                                                                                                                 ${THOUSANDS_SEPARATOR}
                        ${amt} =                                            Convert To Number                                                               ${amtstr}
                        [Return]                                            ${amt}

Get Total Debit
                        Open Posting
                        ${count}=                                           Get Element Count                                                               css:.desktop-tabbox .z-listbox-body .z-listitem
                        ${amt} =                                            Get Posting Amount                                                              ${count}                                                                                                                  3
                        Close Current Tab
                        [Return]                                            ${amt}

Get Total Credit
                        Open Posting
                        ${count}=                                           Get Element Count                                                               css:.desktop-tabbox .z-listbox-body .z-listitem
                        ${amt} =                                            Get Posting Amount                                                              ${count}                                                                                                                  4
                        Close Current Tab
                        [Return]                                            ${amt}


    # SEARCH
Lookup Record
                        [Arguments]                                         ${instancename}                                                                 ${value}
                        Click Toolbar Lookup
                        Click                                               css:.find-window-simple .z-group .z-group-icon
                        Input Field Window                                  ${instancename}                                                                 ${value}

                        
    # Input Data Proses
                        # [Arguments]                                         ${data}                                                                         ${prefix}                                                                                                                 ${columns}                                    ${column_count}
                        # FOR                                                 ${k}                                                                            IN RANGE                                                                                                                  ${column_count}
                        # Input Field Window                                  ${columns}[${k}]                                                       ${data}[${k}]
                        # END

    #popup
Click Ok PopUp
                        Click                                               sizzle=button[title="OK"]
                        SLEEP                                               2

Click Ok PopUp Double
                        Click Button                                        sizzle=button[title="OK"]
                        
Click Ok PopUp first 1
                        Click                                               sizzle=button[title="OK"]
                        SLEEP                                               2
                        Click                                               sizzle=button[title="OK"]
                        
Click Ok PopUp first Double
                        Click                                               sizzle=button[title="OK"]:nth(0)
                        SLEEP                                               2
                        Click                                               sizzle=button[title="OK"]:nth(0)
                        
Click Ok PopUp first 3
                        Click                                               sizzle=button[title="OK"]:nth(1)
                        SLEEP                                               2
                        Click                                               sizzle=button[title="OK"]:nth(1)
                        
Click Ok PopUp first
                        Click                                               sizzle=button[title="OK"]:nth(0)
                        
                        
Click Ok PopUp New
                        Click                                               sizzle=button[title="OK"]:nth(1)

Click Cancel
                        Click                                               sizzle=button[title="Cancel"]

Click Cancel New
                        Click                                               sizzle=button[title="Cancel"]:nth(1)

Click Cancel Popop
                        Click                                                sizzle=button:contains("Cancel")
                        
Click Cancel Popop New
                        Click                                                sizzle=button:contains("Cancel"):nth(1)
                        
Click OK
                        Click                                                sizzle=button:contains("OK")

Click OK New
                        Click                                                sizzle=button:contains("OK"):nth(1)

Click Edit
                        Click                                                sizzle=button:contains("Edit")

Click Save changes
                        Click                                                sizzle=button:contains("Save changes")

Input Popup Addres Location
					   [Arguments]                                          ${addres}
					    Wait Until Page Does Not Contain Element            Xpath=//div[@class="z-loading-indicator"]                                              timeout=30
					    Wait Until Element Is Visible                       sizzle=[class="z-textbox"]:nth(5)         timeout=5
					    Input Text                                          sizzle=[class="z-textbox"]:nth(5)         ${addres}
					    Press Key                                           sizzle=[class="z-textbox"]:nth(5)         \\13
					    
Click Select All
                        Wait Until Element Is Visible                       sizzle=button[title="Select All"]                    timeout=5
                        Click                                               sizzle=button[title="Select All"]

Input Import Mode
					   [Arguments]                                          ${impmode}
					    Wait Until Page Does Not Contain Element            Xpath=//div[@class="z-loading-indicator"]                                              timeout=30
					    Wait Until Element Is Visible                       sizzle=input[class="z-combobox-input"]:nth(20)         timeout=5
					    Input Text                                          sizzle=input[class="z-combobox-input"]:nth(20)         ${impmode}
					    Press Key                                           sizzle=input[class="z-combobox-input"]:nth(20)         \\13
		                        
Import Product
                        [Arguments]                                         ${menu}                                                                         
                        Open Menu                                           ${menu}
                        Click Toolbar Import Data Loader
                        ${index}                                            Execute Javascript                      return $('.z-combobox-input').index();
						${index}                                            Convert To String                       ${index}
                        Input Import Mode                                   insert                                                            


Click File import
                        Click                                sizzle=button[title="Select the file to load matching the Import Format"]     


    #ASI
Input SN
					   [Arguments]                                          ${sn}
					   Input Field                                          sizzle=tr:contains("Serial No") input    ${sn}    

Input LOT
					   [Arguments]                                          ${lot}
                       Input Field                                          sizzle=tr:contains("Lot No") input    ${lot}    

Input Guarantee Date
					   [Arguments]                                          ${date}
					    Input Field                                          sizzle=tr:contains("Guarantee Date") input[class="z-datebox-input"]      ${date}
        		                             
Click New Record ASI
                        [Arguments]                       ${instancename}
                        Click                            sizzle=[instancename="${instancename}"] button 
                        Click                            sizzle=span:contains("New Record") input
  
Click New Record ASI Line
                             Click                            sizzle=span:contains("New Record") input

Click Select ASI
                       [Arguments]                       ${instancename}
                       Click                            sizzle=[instancename="${instancename}"] button 
                       Click                            sizzle=button:contains("Select existing record") 

Click Select ASI Line
                       Click                            sizzle=button:contains("Select existing record") 

Get Class
                        [Arguments]                                          ${class}                               
                                 
Input ASI LOT
                        [Arguments]                                          ${lot}
                        Today
                        Input LOT                     ${lot}    
                        Click Ok PopUp



Click Attribut
                        Click                             sizzle=[title="Product Attribute Set Instance"] button
                        
Select ASI LOT Click
                        [Arguments]                                          ${lot}
                        Today
                        Click Attribut
                        Click Select ASI Line
                        Click Select Radio ASI     ${lot}                       
                        SLEEP                     2      
                        Click Ok PopUp New
                        Click Toolbar Save
                                               
Input ASI LOT SN
                        [Arguments]                                          ${asi}
                        ${asilot}  Get From List     ${asi}    1
                        ${asisn}   Get From List   ${asi}    2
                        ${asidate}   Get From List   ${asi}    3 
                        ${is_lot} =                                  Is Element Exists                                                               sizzle=tr:contains("Lot No") input
                        Run Keyword If            ${is_lot}         Input LOT        ${asilot}
                        ${is_sn} =                                  Is Element Exists                                                               sizzle=tr:contains("Serial No") input
                        Run Keyword If            ${is_sn}         Input SN        ${asisn}
                        ${is_gd} =                                  Is Element Exists                                                               sizzle=tr:contains("Guarantee Date") input[class="z-datebox-input"]
                        Run Keyword If            ${is_gd}           Input Guarantee Date      ${asidate}
                        Click Ok PopUp
                        Click Toolbar Save
                        
Input ASI SN
                        [Arguments]                                          ${sn}
                        Today
                        Input SN                      ${sn}    
                        Input Guarantee Date          ${DATETODAY} 
                        Click Ok PopUp

Click Select List ASI
                        [Arguments]                 ${asi}       ${asiinsertread}
                        ${insert}    Set Variable     I
                        ${read}    Set Variable     R
                        ${asilot}  Get From List     ${asi}    1
                        ${asisn}   Get From List   ${asi}    2
						Run Keyword If            '${asilot}'!=''       Click Select Radio ASI        ${asilot}                                        
                        Run Keyword If            '${asisn}'!=''     Click Select Radio ASI        ${asisn}  
                        SLEEP                     2      
                        Click Ok PopUp New
                        Click Toolbar Save

Click Select Radio ASI
                        [Arguments]                                         ${asilot}
                        # ${asilot2}   Set Variable
                        Click                                               sizzle=td[instancename="Lot No"]:contains("${asilot}")      

    #SCROOL
Scroll To Buttom Header Frame
    Wait Until Element Is Visible               sizzle=div.adtab-form.z-vlayout:nth(0)                                      timeout=10
    Execute Javascript                          $('div.adtab-form.z-vlayout:nth(0)').scrollTop(9900)
    SLEEP                                       3

Scroll To Buttom Header Frame 2
    Wait Until Element Is Visible               sizzle=div.adtab-form.z-vlayout:nth(3)                                      timeout=10
    Execute Javascript                          $('div.adtab-form.z-vlayout:nth(3)').scrollTop(9000)
    SLEEP                                       3
    
Scroll To Buttom Header Frame 3
    Wait Until Element Is Visible               sizzle=div.adtab-form.z-vlayout:nth(9)                                      timeout=10
    Execute Javascript                          $('div.adtab-form.z-vlayout:nth(9)').scrollTop(9900)
    SLEEP                                       3

Scroll To Buttom Header Frame 4
    Wait Until Element Is Visible               sizzle=div.adtab-form.z-vlayout:nth(7)                                      timeout=10
    Execute Javascript                          $('div.adtab-form.z-vlayout:nth(7)').scrollTop(9900)
    SLEEP                                       3
    #CHECK ERROR
Error Message
    [Arguments]                                 ${expected_errMessage}
    ${actual_status}=                           Get Element Attribute                                               xpath=(//div[@class="docstatus-error z-hlayout"]//span[@class="z-label"])[1]     innerHTML
    Should Contain                              ${actual_status}                        ${expected_errMessage}

Check Price List
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=[title="Unique identifier of a Price List"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=[title="Unique identifier of a Price List"] input     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}
    
Check Locator
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=[title="Warehouse Locator"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=[title="Warehouse Locator"] input     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}

Check Locator Value
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=input[title="Search key for the record in the format required - must be unique"] 
    ${actual_status}=                           Get Element Attribute                  sizzle=input[title="Search key for the record in the format required - must be unique"]     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}

Check Currency
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=[title="The Currency for this record"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=[title="The Currency for this record"] input     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}
    
Click Zoom Label
    [Arguments]                                 ${name}
    Click                                       sizzle=span[title="${name}"]    
 
Check Document Status
    [Arguments]                                 ${expected_status}
    Wait Until Element Is Visible               xpath=//span[@title="The current status of the document"]/input     timeout=10
    ${actual_status}=                           Get Element Attribute                                               xpath=//span[@title="The current status of the document"]/input     value
    Should Be True                              "${expected_status}"=="${actual_status}"
    SLEEP                                        2

Refresh Page
    Reload Page
    Handle Alert                            ACCEPT            timeout=30

Input Organization Field
    [Arguments]                                 ${organization}
    Wait Until Page Does Not Contain Element    Xpath=//div[@class="z-loading-indicator"]             timeout=30
    Wait Until Element Is Visible               xpath=(//input[@class="z-combobox-input"])[1]         timeout=5
    Input Text                                  xpath=(//input[@class="z-combobox-input"])[1]         ${organization}
    Press Key                                   xpath=(//input[@class="z-combobox-input"])[1]         \\13

    ##Generate
    ##Generate Form
Generate Budget Register From
    Open Menu            Budget Register Form
    Input Field          sizzle=input[class="z-combobox-input"]:nth(0)    Test Framework2    
    Input Field          sizzle=input[class="z-combobox-input"]:nth(1)     2020 
    Input Field          sizzle=input[class="z-textbox"]     test 3 Budget   
    Input Field          sizzle=input[class="z-combobox-input"]:nth(2)     test 4  
    Click                sizzle=button[class="txt-btn btn-generate z-button"]    
    Input Field          sizzle=div[instancename="C_ElementValue_ID"] input:nth(0)    710200  
    Input Field          sizzle=div[instancename="C_ElementValue_ID"] input:nth(1)     710300  
    Click OK
    SLEEP                5
    Click Edit

Import Budget Register From
    Open Menu            Budget Register Form
    Input Field          sizzle=input[class="z-combobox-input"]:nth(0)    Test Framework    
    Input Field          sizzle=input[class="z-combobox-input"]:nth(1)     2020 
    Input Field          sizzle=input[class="z-textbox"]     test 2 Budget   
    Input Field          sizzle=input[class="z-combobox-input"]:nth(2)     test 4  
    Click                sizzle=button[class="txt-btn btn-import z-button"]    
    Input Field          sizzle=[instancename="FileName"] input[class="editor-input z-textbox"]    /tmp/adempiere_3767144817608502312_Budget Register Form.csv  
    Click OK
    SLEEP                5
    Click Edit

Form Budget Info
    Search Modul Name                 Budget Info
    Input Field          sizzle=tr:contains("Year") input[class="z-combobox-input"]:nth(0)        Test Framework
    Input Field          sizzle=tr:contains("Year") input[class="z-combobox-input"]:nth(1)      2020    
    Input Field          sizzle=tr:contains("Period") input[class="z-combobox-input"]:nth(2)     Feb-20 
    Input Field          sizzle=tr:contains("Trx Organization") input[class="z-combobox-input"]     test 4   
    Click                sizzle=button[class="img-btn btn-refresh z-button"]    
    

    ###/generate

    ##Budget Form
Input Document No Search
     [Arguments]                                 ${documentno}
     Input Field          sizzle=tr:contains("Document No") input[instancename="DocumentNo"]      ${documentno}
     
Input Search Key Search
     [Arguments]                                 ${value}
     Input Field          sizzle=input[instancename="Value"]      ${value}

Input Name Search
     [Arguments]                                 ${value}
     Input Field          sizzle=input[instancename="Name"]      ${value}

Input Inventory No Search
     [Arguments]                                 ${documentno}
     Input Field          sizzle=tr:contains("Inventory No") input[instancename="InventoryNo"]      ${documentno}
            
Input Total Amount
    Input Field                sizzle=tr:contains("710300") td[instancename="Total Amount"] input[class="editor-input z-decimalbox"]            12000000
    Click Save changes
    SLEEP                5
    Click Edit
    Input Field                 sizzle=tr:contains("710300") td[instancename="Period 2"] input[class="editor-input z-decimalbox"]                       300000
    Click Save changes

Input Total Amount New
    Input Field                sizzle=tr:contains("710200") td[instancename="Total Amount"] input[class="editor-input z-decimalbox"]            12000000
    Click Save changes
    SLEEP                5
    Click Edit
    Input Field                 sizzle=tr:contains("710200") td[instancename="Period 2"] input[class="editor-input z-decimalbox"]                       300000
    Click Save changes

Input Total Amount Import
    Input Field                sizzle=tr:contains("710400") td[instancename="Total Amount"] input[class="editor-input z-decimalbox"]            12000000
    Click Save changes
    SLEEP                5
    Click Edit
    Input Field                 sizzle=tr:contains("710400") td[instancename="Period 2"] input[class="editor-input z-decimalbox"]                       100000
    Click Save changes
        
Open Search Document No
    [Arguments]                           ${documentno}
    Click Toolbar Lookup
    Input Document No Search              ${documentno}
    
Open Search By Search Key
    [Arguments]                           ${value}
    Click Toolbar Lookup
    Input Search Key Search               ${value}

Open Search Inventory No
    [Arguments]                           ${documentno}
    Click Toolbar Lookup
    Input Inventory No Search              ${documentno}
  
Input Search and Name
    [Arguments]                           ${value}     ${name}
    Input Field    sizzle=input[title="Search key for the record in the format required - must be unique"]              ${value}
    SLEEP          3
    Input Field    sizzle=input[title="Alphanumeric identifier of the entity"]   ${name}    
      
Get DocumentNo Budget
    # [Arguments]                           ${documentno}
    # ${documentno}=                             Get Element Value                                                               sizzle=tr:contains("Document No") input[class="z-textbox z-textbox-readonly"]
    ${documentno}=                             Execute Javascript                                                  return $('tr:contains("Document No") input[class="z-textbox z-textbox-readonly"]').val();
    Set Global Variable                         ${documentno}

Open Search Product No
    [Arguments]                           ${productname}
    Click Toolbar Lookup
    Click Sub Tab                        Advanced
    Seacrh Advance Product               Product          ${productname}
    
Complete Form
    Click                                sizzle=button[class="txt-btn btn-complete z-button"]
    Click Ok PopUp New


Check Org Value
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=span[instancename="C_Payment0AD_Org_ID"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=span[instancename="C_Payment0AD_Org_ID"] input   	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}

Check Documentno Payment
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=span[instancename="C_Payment0ADocumentNo"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=span[instancename="C_Payment0ADocumentNo"] input   	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}
    
Click Create Asset
    Click                                        sizzle=[instancename="C_InvoiceLine0A_CreateAsset"] input
    
Do Approval
    Open Menu                                       Workflow Activities
    Click                                           sizzle=td[instancename="Node"]:contains("Role")
    Click                                           sizzle=button[class="img-btn btn-ok z-button"]
    Refresh Page

Input Capital
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="C_InvoiceLine0A_CapvsExp"] input         ${value}
    
Input Asset
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="C_InvoiceLine0A_Asset_ID"] input         ${value}
    
Create Asset
    [Arguments]                                 ${value}
    Click Create Asset
    Input Capital                               Capital
    Input Asset                                 ${value}
    
Click Account Jurnal 1
    Wait Until Page Contains Element            xpath=(//tr[contains(@class,"z-listitem")]//div[text()="Test Framework"])[1]             timeout=10
    Double Click Element                        xpath=(//tr[contains(@class,"z-listitem")]//div[text()="Test Framework"])[1]
    SLEEP                                       5

Click Account Jurnal 2
    Wait Until Page Contains Element            xpath=(//tr[contains(@class,"z-listitem")]//div[text()="Test Framework"])[2]               timeout=10
    Double Click Element                        xpath=(//tr[contains(@class,"z-listitem")]//div[text()="Test Framework"])[2]

Input Type Down Payment Field
    [Arguments]                                 ${value}
    Input Field                                  xpath=//span[@title="List Type of DownPayment"]/input[@class="z-combobox-input"]         ${value}
    SLEEP                                        2
    
Input Down Payment Field
    [Arguments]                                 ${value}
    Input Field                                 xpath=//div[@title="Downpayment "]/input[@class="editor-input z-decimalbox"]           ${value}
    SLEEP                                       2
    
Input Charge DownPayment Field
    [Arguments]                                 ${value}
    Input Field                                 xpath=(//span[@title="Additional document charges"]/input[@class="z-combobox-input"])[2]         ${value}
    SLEEP                                       2

Input Charge DownPayment Field new
    [Arguments]                                 ${value}
    Input Field                                 xpath=(//span[@title="Additional document charges"]/input[@class="z-combobox-input"])[3]         ${value}
    SLEEP                                       2
 
Input Charge DownPayment Field new 1
    [Arguments]                                 ${value}
    Input Field                                 xpath=(//span[@title="Additional document charges"]/input[@class="z-combobox-input"])[4]         ${value}
    SLEEP                                       2
         
Input Charge DownPayment Field new 2
    [Arguments]                                 ${value}
    Input Field                                 xpath=(//span[@title="Additional document charges"]/input[@class="z-combobox-input"])[5]         ${value}
    SLEEP                                       2
                 
Input Manturity Date
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="C_Payment0DateLiquid"] input         ${value}
    SLEEP                                       2

Input Transaction Date
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="C_Payment0DateTrx"] input         ${value}
    SLEEP                                       2
  
Input Manturity Date Today
    Today
    Input Manturity Date                       ${DATETODAY}

Input Date Quote Convert
    [Arguments]                                 ${value}                      
    X Day After                                 ${value}
    Input Field                                 sizzle=[instancename="DateDoc"] input             ${XDAYAFTER}
    
Input Transaction Date Yesterday
    Yesterday
    Input Transaction Date                       ${DATEYESTERDAY}
 
    
Input Valid From
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="BHP_Check_Number0ValidFrom"] input         ${value}
    SLEEP                                       2
  
Input Valid From Today
    Today
    Input Valid From                            ${DATETODAY}
    
Input Valid To
    [Arguments]                                 ${value}
    Input Field                                 sizzle=[instancename="BHP_Check_Number0ValidTo"] input         ${value}
    SLEEP                                       2
  
Input Valid To Today
    Today
    Input Valid To                       ${DATETODAY}
 
Click Bank Account Payment
    Click                                         sizzle=[title="Account at the Bank"]:contains("Bank Account")
    
Click Generate Giro Number
    Click                                         sizzle=button[instancename="BHP_Check_Number0GenerateGiroNumber"] 

Click Generate Tax Number
    Click                                         sizzle=button[instancename="BHP_Tax_Number0GenerateTaxNumber"] 

Click Verivy Giro Number
    Click                                         sizzle=button[instancename="BHP_Check_Number0VerifiedGiroNumber"] 

Click Verivy Tax Number
    Click                                         sizzle=button[instancename="BHP_Tax_Number0VerifiedTaxNumber"] 

Click Record ID
    Click                                        sizzle=button[instancename="BHP_RV_OverBudget0Record_ID"]  

Input Generate Prefix Field
    [Arguments]                                 ${value}
    Input Text                                  sizzle=input[instancename="Prefix"]         ${value}

Input Generate Suffix Field
    [Arguments]                                 ${value}
    Input Text                                  sizzle=input[instancename="Suffix"]         ${value}

Input Generate Start From Date Field
    [Arguments]                                 ${value}
    Input Field                                  sizzle=[instancename="StartFrom"] input[class="editor-input z-decimalbox"]                           ${value}

Input Generate Finish To Date Field
    [Arguments]                                 ${value}
    Input Field                                  sizzle=[instancename="FinishTo"] input[class="editor-input z-decimalbox"]                           ${value}

Exampe Document Budgdet Status
    [Arguments]                                 ${value}
    Open Menu                                     Document Budget Status
    Open Search Document No                         ${value}
    SLEEP                                        2
    Click Toolbar Process
    Click Zoom                            Set Budget Status
    Click OK
    Click Record ID
    SLEEP                                         7

Input UOM
    [Arguments]                                 ${value}
    Input Field                                  sizzle=[title="Unit of Measure"] input                           ${value}
    
Check PO Quantity
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=[title="Ordered Quantity"] input:nth(0)
    ${actual_status}=                           Get Element Attribute                  sizzle=[title="Ordered Quantity"] input:nth(0)     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}

Check UOM
    [Arguments]                                 ${expected_errMessage}
    Click                                       sizzle=[title="Unit of Measure"] input
    ${actual_status}=                           Get Element Attribute                  sizzle=[title="Unit of Measure"] input     	    value
    Should Contain                              ${actual_status}                        ${expected_errMessage}
      
Click Generate Ivnvoice withholding
     Click                                               sizzle=button[instancename="C_Invoice0GenerateWithholding"]

Click Invoice No
     Click                                               sizzle=[class="form-label z-div"] [title="Invoice Identifier"]:contains("Invoice"):nth(0)

Click Ispaid
    Click                                       sizzle=[instancename="C_Invoice0IsPaid"]

Input Bussiness Partner Form Payment Allocation
   [Arguments]                                          ${bp}
   Input Field                                          sizzle=tr:contains("Business Partner") input[class="editor-input z-textbox"]    ${bp}  
   
Click Multy-Currency Form PA
	Click                                             sizzle=tr:contains("Currency") input[type="checkbox"]:nth(0)
	
Input Qty Entered
    [Arguments]                          ${table}               ${qty}
    Input Field                 sizzle=[instancename="${table}0QtyEntered"] input          ${qty}
    SLEEP                       2  

Input info Panel Value
    [Arguments]                 ${value}
    Input Field                 sizzle=[instancename="infopanel"] input[title="Search key for the record in the format required - must be unique"]          ${value}
    SLEEP                       2  
   
Input info Panel Product Category
    [Arguments]                 ${value}
    Input Field                 sizzle=[instancename="infopanel"] span[title="Category of a Product"] input          ${value}
    SLEEP                       2  

Input info Panel Price List Version
    [Arguments]                 ${value}
    Input Field                 sizzle=[instancename="infopanel"] span[instancename="M_PriceList_Version_ID"] input          ${value}
    SLEEP                       2   


Click Image logo
    Click                       sizzle=[instancename="BHP_M_InstallBase0Logo_ID"]    
    SLEEP                       2   
  
Click Button Upload
    Click                       sizzle=button[class="txt-btn z-button"]:contains("Upload")      
    SLEEP                       2  
      
Click Requery info Panel
    Click                       sizzle=[instancename="infopanel"] button[title="ReQuery"]     
    SLEEP                       2   

Click List info Panel
    Click                       sizzle=[instancename="infopanel"] td[instancename="Search Key"]       
    SLEEP                       2   

Click Ok info Panel
    Click                       sizzle=[instancename="infopanel"] button[title="OK"]     
    SLEEP                       2  
    
Click Product info Panel
    Click                       sizzle=[instancename="BHP_BasePrice0M_Product_ID"] button     
    SLEEP                       2  
    
Click Product info Panel new
    [Arguments]                 ${value}
    Click                       sizzle=[instancename="${value}0M_Product_ID"] button     
    SLEEP                       2  
    
Click Update Status
    [Arguments]                 ${value}
    Click                       sizzle=button[instancename="${value}0UpdateStatus"]      
    SLEEP                       2  

Click Update Status WO
    [Arguments]                 ${value}
    Click                       sizzle=button[instancename="${value}0UpdateStatusWO"]      
    SLEEP                       2  
        
Input Popup Status
    [Arguments]                 ${value}
    Input Field                 sizzle=span[instancename="Status"] input          ${value}
    SLEEP                       2  
  
Input Popup Status WO
    [Arguments]                 ${value}
    Input Field                 sizzle=span[instancename="WOStatus"] input          ${value}
    SLEEP                       2  
      

Input Popup Description
    [Arguments]                 ${value}
    Input Field                 sizzle=textarea[instancename="Description"]          ${value}
    SLEEP                       2  
    
Input Popup Responsible
    [Arguments]                 ${value}
    Input Field                 sizzle=div[instancename="C_BPartnerSR_ID"] input         ${value}
    SLEEP                       2  
    
Click IsCompanyOwned
    [Arguments]                 ${value}
    Click                       sizzle=span[instancename="${value}0IsCompanyOwned"] input     
    SLEEP                       2  
    
Click Creat Asset
    [Arguments]                 ${value}
    Click                       sizzle=button[instancename="${value}0A_CreateAsset"]      
    SLEEP                       2  
   
Input Popup Asset Group
    [Arguments]                 ${value}
    Input Field                 sizzle=span[instancename="A_Asset_Group_ID"] input         ${value}
    SLEEP                       2   
    
Input Start Date Doc Today
    [Arguments]                 ${value}
    Today
    Input Field                 sizzle=[instancename="${value}0StartDate"] input          ${DATETODAY}  

Input End Date Doc Today
    [Arguments]                 ${value}
    Today
    Input Field                 sizzle=[instancename="${value}0EndDate"] input           ${DATETODAY}
    SLEEP                       2  
    
Input Date From Doc Today
    [Arguments]                 ${value}
    Today
    Input Field                 sizzle=[instancename="${value}0DateFrom"] input          ${DATETODAY}  

Input Date From Doc Yesterday
    [Arguments]                 ${value}
    Yesterday
    Input Field                 sizzle=[instancename="${value}0DateFrom"] input          ${DATEYESTERDAY}  

Input Date ToDoc Today
    [Arguments]                 ${value}
    Today
    Input Field                 sizzle=[instancename="${value}0DateTo"] input           ${DATETODAY}
    SLEEP                       2  
    
Input Date To Doc Yesterday
    [Arguments]                 ${value}
    Yesterday
    Input Field                 sizzle=[instancename="${value}0DateTo"] input          ${DATEYESTERDAY}  