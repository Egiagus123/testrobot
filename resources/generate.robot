*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot
Resource                utils.robot
Resource                window.robot
Resource                createlinefrom.robot

*** Variables ***
${LOGWINDOW} =          generate.

*** Keywords ***
Click Generate Process
    Click                sizzle=button[title="Process"] 
    
Click Generate Process new
    Click                sizzle=button[title="Process"]:nth(0) 
    
Click UnGenerate Process
    Click                sizzle=button[title="Process"]:nth(1) 
    
Click Generate Open
    Click                sizzle=button[class="z-button"]:contains("Open")

Input BHP WithHolding No
    [Arguments]                                          ${value}           
    Input Field                sizzle=td[instancename="BHP WithHolding DocNo"] input             ${value} 

Input Tax No
    [Arguments]                                          ${value}           
    Input Field                sizzle=td[instancename="Tax No"] input             ${value} 
    
Input Converted TaxAmt
    [Arguments]                                          ${value}           
    Input Field                sizzle=td[instancename="Converted TaxAmt"] input[class="editor-input z-decimalbox"]            ${value} 

#Generate Material Receipt   
Generate Material Receipt Search Document
    Today
    Search Modul Name                 Generate Material Receipt
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        Purchase Order
    Input Field          sizzle=tr:contains("Date Promise") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]    
    
Input Popup Generate Material receipt
    Today
    Input Field           sizzle=tr:contains("Warehouse") input       WH_AUTOMATION
    Input Field           sizzle=tr:contains("Locator") input        Loc_Automation
    Input Field           sizzle=tr:contains("Movement Date") input                 ${DATETODAY}     
    Input Field           sizzle=tr:contains("Document Action") input               Completed
    Click OK
    SLEEP                  3

#Generate Shipment
Generate Shipment Search Document
    Today
    Search Modul Name                 Generate Shipment
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        Standard Order
    Input Field          sizzle=tr:contains("Date Promise") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]    

Generate Shipment Search Document 2
    Today
    Search Modul Name                 Generate Shipment
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework2
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        Standard Order
    Input Field          sizzle=tr:contains("Date Promise") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]    
    
Input Popup Generate Shipment
    Today
    Input Field           sizzle=tr:contains("Warehouse") input:nth(1)          WH_AUTOMATION
    Input Field           sizzle=tr:contains("Locator") input        Loc_Automation
    Input Field           sizzle=tr:contains("Movement Date") input                 ${DATETODAY}     
    Input Field           sizzle=tr:contains("Document Action") input               Completed
    Click OK
    SLEEP                  3
    
Input Popup Generate Shipment 2
    Today
    Input Field           sizzle=tr:contains("Warehouse") input:nth(1)          SEMARANG
    Input Field           sizzle=tr:contains("Locator") input        Semarang
    Input Field           sizzle=tr:contains("Movement Date") input                 ${DATETODAY}     
    Input Field           sizzle=tr:contains("Document Action") input               Completed
    Click OK
    SLEEP                  3
    
#Generate Witholding Vendor
Click Refresh Button
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    
Generate Assign Withholding Vendor
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign WithHolding Tax (Vendor)
    Input Field          sizzle=tr:contains("Invoice") input[class="z-combobox-input"]         Test Framework2
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          xpath=(//input[@class="editor-input z-textbox"])[1]                       ${value}  
    Input Field          sizzle=tr:contains("Date Invoice") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
  
Generate Assign Withholding Vendor Ebupot
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign WithHolding Tax (Vendor)
    Input Field          sizzle=tr:contains("Invoice") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          xpath=(//input[@class="editor-input z-textbox"])[1]                       ${value}   
    Input Field          sizzle=tr:contains("Date Invoice") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    

Assign Tax Number VAT In
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign Tax Number (VAT In)
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          sizzle=tr:contains("Invoice Vendor") input                      ${value}   
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
 
Assign VAT In (from)
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 VAT In (form)
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          sizzle=tr:contains("Tax Number") input                      ${value}   
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    
Assign VAT Out (from)
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 VAT Out (form)
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          sizzle=tr:contains("Tax Number") input[class="z-textbox"]                      ${value}   
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    
 
Assign Tax Number VAT Out
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign Tax Number (VAT Out)
    Input Field          sizzle=tr:contains("Organization") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          sizzle=tr:contains("Invoice") input[class="editor-input z-textbox"]:nth(0)                      ${value}   
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
     
Input Popup Generate Assign Withholding Vendor
    Today
    Yesterday
    Input Field           sizzle=tr:contains("Replacement") input       Faktur Pajak
    Input Field           sizzle=tr:contains("Tax Date") input          ${DATETODAY}     
    Input Field           sizzle=tr:contains("Facilities Tax") input     DTP
    Click                 sizzle=tr:contains("Ttd Pengurus") input
    SLEEP                 3
    Input Field           sizzle=[instancename="BHP_DTP"]              BHPNEWDTP/01/X1/2020
    SLEEP                 2
    Input Field           sizzle=[instancename="BHP_NTPNDTP"]          BHPNEWNTPN/01/X1/2020
    Click OK
    SLEEP                  3
 
Input Popup Assign Tax Number Yesterday
    Today
    Yesterday
    Input Field           sizzle=tr:contains("Transaction Code") input       Kepada Pihak yang Bukan Pemungut PPN
    Input Field           sizzle=tr:contains("FG Replacement") input         Faktur Pajak  
    Input Field           sizzle=tr:contains("Tax Date") input          ${DATEYESTERDAY}   
    Click OK
    SLEEP                  3
 
Input Popup Assign Tax Number
    Today
    Yesterday
    Input Field           sizzle=tr:contains("Transaction Code") input       Kepada Pihak yang Bukan Pemungut PPN
    Input Field           sizzle=tr:contains("FG Replacement") input         Faktur Pajak  
    Input Field           sizzle=tr:contains("Tax Date") input          ${DATETODAY}   
    Click OK
    SLEEP                  3
    
Get Document No Witholding
    Wait Until Element Is Visible               sizzle=[instancename="BHP WithHolding DocNo"]
    ${WitholdingNo}=                             Execute Javascript                                                  return $('[instancename="BHP WithHolding DocNo"]').text();
    Set Global Variable                         ${WitholdingNo}
  
Get Document Tax No
    Wait Until Element Is Visible               sizzle=[instancename="Tax No"]
    ${TaxNo}=                             Execute Javascript                                                  return $('[instancename="Tax No"]').text();
    Set Global Variable                         ${TaxNo}
 
Get Document Tax Number
    Wait Until Element Is Visible               sizzle=[instancename="Tax Number"]
    ${TaxNumber}=                             Execute Javascript                                                  return $('[instancename="Tax Number"]').text();
    Set Global Variable                         ${TaxNumber}
           
Click Radio Invoice No
    SLEEP                                       2
    Wait Until Element Is Visible               sizzle=td[instancename="Select"] input                                                         timeout=10
    Click Element                               sizzle=td[instancename="Select"] input

Withholding Detail Vendor
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Withholding Detail (Form) - Vendor
    Input Field          sizzle=[class="z-combobox"] input:nth(0)       Test Framework2
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          sizzle=tr:contains("WithHolding Tax") input[class="z-textbox"]                       ${value}    
    Input Field          sizzle=tr:contains("Tax Category") input[class="z-combobox-input"]         PPH 23     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    Click Radio Invoice No
    Click Generate Process
    SLEEP                8
    Click Ok PopUp
   
Withholding Detail Vendor New
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Withholding Detail (Form) - Vendor
    Input Field          sizzle=[class="z-combobox"] input:nth(0)       Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AP Voucher
    Input Field          sizzle=tr:contains("WithHolding Tax") input[class="z-textbox"]                       ${value}     
    Input Field          sizzle=tr:contains("Tax Category") input[class="z-combobox-input"]         PPH 23     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    Click Radio Invoice No
    Click Generate Process
    SLEEP                8
    Click Cancel
    SLEEP                3 
       
#Generate Witholding Customer    
Generate Assign Withholding Customer
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign WithHolding Tax (Customer)
    Input Field          sizzle=tr:contains("Invoice") input[class="z-combobox-input"]        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          xpath=(//input[@class="editor-input z-textbox"])[1]                       ${value}   
    Click           sizzle=[instancename="IsSOTrx"] 
    Click Refesh New
    Click                        sizzle=[class="z-listcell-content"]:nth(3)
    Click Ok PopUp New
    SLEEP                3
    Input Field          sizzle=tr:contains("Date Invoice") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
  
Generate Assign Withholding Customer New
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Assign WithHolding Tax (Customer)
    Input Field          sizzle=tr:contains("Invoice") input[class="z-combobox-input"]        Test Framework2
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          xpath=(//input[@class="editor-input z-textbox"])[1]                       ${value}   
    Click           sizzle=[instancename="IsSOTrx"] 
    Click Refesh New
    Click                        sizzle=[class="z-listcell-content"]:nth(3)
    Click Ok PopUp New
    SLEEP                3
    Input Field          sizzle=tr:contains("Date Invoice") input[class="z-datebox-input"]:nth(0)          ${DATETODAY}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]
     
Input Popup Generate Assign Withholding Customer
    Today
    Input Field           sizzle=tr:contains("Tax Date") input          ${DATETODAY}     
    Input Field           sizzle=[instancename="BHP_PurchaseType"] input     Dipungut Pihak Lain
    Input Field           sizzle=[instancename="Map"] input     411124 - Jenis Pajak PPh Pasal 23        
    Input Field           sizzle=[instancename="NTPP"]            BHPNTPP/01/XI/2020
    Click OK
    SLEEP                  3
 
Withholding Detail Customer
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Withholding Detail (Form) - Customer
    SLEEP                             2
    Input Field          sizzle=[class="z-combobox"] input:nth(0)        Test Framework
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          sizzle=tr:contains("WithHolding Tax") input[class="z-textbox"]                       ${value}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    Click Radio Invoice No
    Click Generate Process
    SLEEP                8
    Click Ok PopUp
    
Withholding Detail Customer New
    [Arguments]                                          ${value}           
    Today
    Search Modul Name                 Withholding Detail (Form) - Customer
    SLEEP                             2
    Input Field          sizzle=[class="z-combobox"] input:nth(0)        Test Framework2
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        AR Invoice
    Input Field          sizzle=tr:contains("WithHolding Tax") input[class="z-textbox"]                       ${value}     
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    Click Radio Invoice No
    Click Generate Process
    SLEEP                8
    Click Ok PopUp
    
Form Quote Convert Binding
    [Arguments]                                 ${documentno}
    Search Modul Name                                   Quote Convert
    Input Field          sizzle=tr:contains("Source Document") input[class="z-combobox-input"]:nth(0)                                                 ${documentno}
    Input Field          sizzle=[title="Document type or rules"] input                                           Standard Order   
    Click                sizzle=button[class="txt-btn btn-ok z-button"] 
    Click                sizzle=#logrecords .z-a   
    Scroll To Buttom Header Frame 
    Check Document Status    In Progress
    
Form Quote Convert Non Binding
    [Arguments]                                 ${documentno}               ${value}
    Search Modul Name                                  Quote Convert
    Input Field          sizzle=tr:contains("Source Document") input[class="z-combobox-input"]:nth(0)             ${documentno}
    Input Field          sizzle=[title="Document type or rules"] input                                           Standard Order   
    Input Date Quote Convert                          ${value}
    Click                sizzle=button[class="txt-btn btn-ok z-button"] 
    Click                sizzle=#logrecords .z-a   
    Scroll To Buttom Header Frame 
    Check Document Status    In Progress
    

Form Generate PO
    [Arguments]                                 ${documentno}
    Search Modul Name                                   Generate Purchase Order
    Input Field          sizzle=tr:contains("Requisition") input[class="editor-input z-textbox"]:nth(0)                                                 ${documentno}
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]:nth(0)                                                   Purchase Requisition
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(0)                                                   02/11/2020
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(1)                                                  02/11/2020
    Click                sizzle=button[class="img-btn btn-refresh z-button"]  
    Click                sizzle=button[class="img-btn btn-selectall z-button"]  
    Click                sizzle=button[class="img-btn btn-process z-button"]

Input Popup Generate PO
    Today
    Input Field           sizzle=[instancename="C_DocTypeTarget_ID"] input[class="z-combobox-input"]               Purchase Order
    Input Field           sizzle=[instancename="C_BPartner_ID"] input[class="editor-input z-textbox"]           AUTOMATION_COBA
    Input Field           sizzle=tr:contains("Warehouse") input                     WH DEMO / BACKUP
    Input Field           sizzle=tr:contains("Date Ordered") input                 ${DATETODAY}  
    Input Field           sizzle=tr:contains("Payment Term") input                 Immediate   
    Input Field           sizzle=tr:contains("Document Action") input               Complete
    Click OK
    Click                 sizzle=button[class="img-btn btn-ok z-button"]
    
Form Generate Inventory Move
    [Arguments]                                    ${documenttype}    ${wh}   ${date1}    ${date2}    ${type}    ${value}
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]:nth(0)                          ${documenttype}                         
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(0)                                                   ${date1}
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(1)                                                  ${date2}
    Input Field With Error          sizzle=tr:contains("Warehouse") input[class="z-combobox-input"]:nth(1)                          ${wh}                         
	Wait Loading End
	${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${value}")').index();
	${index}                                            Convert To String                       ${index}
	Select From List By Index                           sizzle=tr:contains("${type}") select[class="z-select"]                  ${index}
	
Form Validate Giro
    [Arguments]                            ${datefrom}    ${dateto}        ${bpartner}
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(0)                                                   ${datefrom}
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(1)                                                   ${dateto}
    Input Field          sizzle=tr:contains("Business Partner") input[class="editor-input z-textbox"]:nth(0)        ${bpartner}
    Click Refresh Button  
    Click                sizzle=button[class="img-btn btn-selectall z-button"]
    Click Generate Process new
    Click Button Checklist Ok Form
    Click Button Checklist Ok Form

Input From List By Index
    [Arguments]                                         ${value}        ${type}
    ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${value}")').index();
	${index}                                            Convert To String                       ${index}
	Select From List By Index                           sizzle=tr:contains("${type}") select[class="z-select"]                  ${index}
    
Input Popup Generate Inventory Move
    [Arguments]           ${doctype}    ${locator}    ${docAction}
    Today
    Input Field           sizzle=[instancename="C_DocType_ID"] input[class="z-combobox-input"]               ${doctype}
    Input Field           sizzle=tr:contains("Locator") input                      ${locator}
    Input Field           sizzle=tr:contains("Document Action") input              ${docAction}
    Click Button Ok Form
    
Form Generate Consigment Offer
    [Arguments]                                    ${documenttype}    ${wh}   ${date1}    ${date2}    ${type}    ${value}
    Input Field          sizzle=tr:contains("Document Type") input[class="z-combobox-input"]:nth(0)                          ${documenttype}                         
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(0)                                                   ${date1}
    Input Field          sizzle=.z-datebox .z-datebox-input:nth(1)                                                  ${date2}
    Input Field           sizzle=tr:contains("Warehouse") input[class="z-combobox-input"]:nth(1)                          ${wh}                         
	Wait Loading End
	${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${value}")').index();
	${index}                                            Convert To String                       ${index}
	Select From List By Index                           sizzle=tr:contains("${type}") select[class="z-select"]                  ${index}
	
Input Popup Generate Consigment Offer
    [Arguments]           ${doctype}        ${docAction}
    Today
    Input Field           sizzle=[instancename="C_DocType_ID"] input[class="z-combobox-input"]               ${doctype}
    Input Field           sizzle=tr:contains("Document Action") input              ${docAction}
    Click Button Ok Form
    