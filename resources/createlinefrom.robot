*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot
Resource                utils.robot
Resource                window.robot

*** Variables ***
${LOGWINDOW} =          createlinefrom.

*** Keywords ***
Click Create Lines From Button
                        Click                                               sizzle=button[title="Process which will generate a new document lines based on an existing document"]

Click Distribute Cost
                       [Arguments]                                         ${name}
                        Click                                                sizzle=button[instancename="${name}"]
                        
Click Create Order From RMA Button
                        Click                                               sizzle=button[instancename="M_RMA0GenerateTo"]

Click List Number
                        Wait Until Element Is Visible                       sizzle=.z-listcell-content .z-checkbox input                timeout=10
                        Click                                               sizzle=.z-listcell-content .z-checkbox input         

Click Check Select List
                        [Arguments]                                         ${name}
						Click                          sizzle=tr:contains("${name}") select[class="z-select"]        
						SLEEP                           3                     

Set Create Line From
                       [Arguments]                                         ${number}            ${name}
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=30
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               2
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All
                        Click Ok PopUp

Set Create Line From Line 1
                       [Arguments]                                         ${number}            ${name}
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click CheckBoox Line 1
                        Click Ok PopUp
                        
Set Create Line From SO Where Quotation
                       [Arguments]                                          ${number}            ${name}          
                        Click Create Lines From Button                               
                        Wait Until Element Is Visible                       sizzle=.z-row-content .z-select:nth(1)             timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-row-content .z-select:nth(1):contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All
                        Click Ok PopUp

Set Create Line From Inventory Move From
                       [Arguments]                                          ${number}            ${name}           ${value}
                        Click Create Lines From Button    
                        Input Field                                         sizzle=tr:contains("Locator To") input[class="z-combobox-input"]:nth(1)        ${value}         
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All
                        Click Ok PopUp

Set Create Line From Inventory Move From Partial 2 line
                       [Arguments]                                          ${number}            ${name}           ${value}         ${qty1}        ${qty2}
                        Click Create Lines From Button    
                        Input Field                                         sizzle=tr:contains("Locator To") input[class="z-combobox-input"]:nth(1)        ${value}         
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Input Qty                                           ${qty1} 
                        SLEEP                                                2
                        Input Qty1                                           ${qty2}     
                        Click Ok PopUp
                        
Set Create Line From Inventory Move To
                       [Arguments]                                          ${number}            ${name}           ${value}
                        Click Create Lines From Button    
                        Input Field                                         sizzle=tr:contains("Locator From") input[class="z-combobox-input"]:nth(0)        ${value}         
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All
                        Click Ok PopUp

Set Create Line From Partial
                        [Arguments]                                         ${number}            ${name}          ${qty}
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=30
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               2
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click CheckBoox Create Line From       
                        Input Qty                                           ${qty}
                        Sleep                                                1
                        Click Ok PopUp
                        Sleep                                                1
                        
Set Create Line From Partial Line 2
                        [Arguments]                                         ${number}            ${name}          ${qty}
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=15
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All       
                        Input Qty Global                                    Quantity    1    ${qty}                                    
                        Click Ok PopUp

Set Create Line From Partial Multi Line
                        [Arguments]                                         ${number}            ${name}          
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        Click Select All
                        
Set Create Line From Partial Random Lines
                        [Arguments]                                         ${number}            ${name}          
                        Click Create Lines From Button    
                        Wait Until Element Is Visible                       sizzle=.z-select .z-option              timeout=10
                        ${index}                                            Execute Javascript                      return $('.z-select .z-option:contains("${number}")').index();
						${index}                                            Convert To String                       ${index}
						SLEEP                                               1
						Select From List By Index                           sizzle=tr:contains("${name}") select[class="z-select"]                               ${index}
                        
# Create Line From Vendor RMA                          
Set Create Line From Vendor RMA
                       [Arguments]                                         ${number}
                        Click Create Lines From Button    
                        Click Select All
                        Input Qty RMA                               ${number}
                        Click Ok PopUp
                        SLEEP                                               2

Create Order From RMA
                        Click Create Order From RMA Button   
                        Click OK Create Order
                        SLEEP                                               2
                        
Click OK Create Order
                        Click                                                sizzle=button:contains("OK")
                  
Click Zoom PO
                        Click                                                sizzle=span[title="Purchase Order"]
 
Click Refesh
                        Click                                                sizzle=button[class="img-btn btn-refresh z-button"]

Click Refesh New
                        Click                                                sizzle=button[class="img-btn btn-refresh z-button"]:nth(1)

Click Sales Transaction
                        Click                                                sizzle=span[instancename="IsSOTrx"] input
   
   
Click Record Sales
                        Click                                                sizzle=span[class="z-listitem-checkable z-listitem-radio"]

                                              
Input Qty 
                        [Arguments]             ${number}        
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]        ${number}
                        
Input Qty Global 
                        [Arguments]             ${instancename}    ${index}    ${number}  
                        Input Field            sizzle=[instancename="${instancename}"] input[class="editor-input z-decimalbox"]:nth(${index})        ${number} 

Input Qty1 
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]:nth(0)        ${number} 
                        
Input Qty2 
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]:nth(1)        ${number} 
                        
Input Qty3 
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]:nth(2)        ${number} 
                        
Input Qty4 
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]:nth(3)        ${number} 
                        
Input Qty5 
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Quantity"] input[class="editor-input z-decimalbox"]:nth(4)        ${number}           

Input Qty RMA
                        [Arguments]             ${number}
                        Input Field            sizzle=[instancename="Delivered Quantity"] input[class="editor-input z-decimalbox"]        ${number}           

Input Document Type
                        [Arguments]             ${value}
                        Input Field            sizzle=tr:contains("Document Type") input[class="z-combobox-input"]        ${value}           

Input Invoice
                        [Arguments]             ${number}
                        Input Field            sizzle=tr:contains("Invoice") input[class="editor-input z-textbox"]         ${number}           

Input Invoice New
                        [Arguments]             ${number}
                        Input Field            sizzle=tr:contains("Invoice") input[class="editor-input z-textbox"]:nth(1)         ${number}           
 
   
                      
#Create Line From Payment Selection
Create Line From Payment Selection
                        [Arguments]                                     ${value}             ${number}
                        Click Create Lines From Button
                        Click Select All
                        Input Document Type                                ${value}
                        Input Invoice                                       ${number}
                        Click Refesh
                        Click CheckBoox Create Line From       
                        Click Ok PopUp
                        

Create Line From Payment Selection New
                        [Arguments]                                     ${value}             ${number}
                        Click Create Lines From Button
                        Click Select All
                        Input Document Type                                ${value}
                        Input Invoice New                                      ${number}
                        Click Refesh
                        Click CheckBoox Create Line From       
                        Click Ok PopUp
 

Create Line From Payment Selection New Customer
                        [Arguments]                                     ${value}             ${number}
                        Click Create Lines From Button
                        Click Select All
                        Input Document Type                                ${value}
                        Input Invoice New                                      ${number}
                        SLEEP                                                3
                        Click Sales Transaction
                        Click Refesh New
                        Click Record Sales
                        Click Ok PopUp New     
                        SLEEP                            2
                        Click Refesh  
                        Click CheckBoox Create Line From       
                        Click Ok PopUp               
                                
Click Prepare Payment
                       Click                                     sizzle=button[instancename="C_PaySelection0Processing"]
                 
Input PaymentRule Prepare Payment       
                       [Arguments]            ${value} 
                       Input Field             sizzle=span[instancename="PaymentRule"] input      ${value}       

Prepare Payment Button          
                    [Arguments]                            ${value} 
                    Click Prepare Payment
                    Input PaymentRule Prepare Payment        ${value} 
                    Click OK
                    
Click Payment Zoom
                Click                       sizzle=span[title="Payment identifier"]:contains("Payment")
