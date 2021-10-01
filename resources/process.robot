*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot
Resource                utils.robot
Resource                window.robot
Resource                createlinefrom.robot

*** Variables ***
${LOGWINDOW} =          process.

*** Keywords ***
Create Document PO to Payment
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                          ${start_index}=${1}    ${end_index}=${0}
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
                        # ${numbedsdr}  Set Variable    ${number}
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
	                    Close Current Tab
	                    ${IDHeader} =    Set Variable    ${csv[${j}][${start}]}
	                    Create Document Test    Purchase Order   purchase_order.csv  ${IDHeader}
                        ${documentnopo} =     Get Field Value    C_Order0DocumentNo
                        Check Document Status     Completed
                        Close Current Tab
                        Create Document (Create Line From ASI) Test    Material Receipt    material_receipt.csv    ${documentnopo}       Purchase Order      ${IDHeader}
                        ${documentnomr} =     Get Field Value    M_InOut0DocumentNo                            
                        Check Document Status     Completed
                        Close Current Tab
                        Open Menu Create Record Save Test Create Line From    Invoice (Vendor)      invoice_vendor.csv   ${documentnomr}       Receipt         ${IDHeader}
						${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
						Check Document Status     Completed
						Close Current Tab
						Open Menu Create Record Save Test Payment    Payment Out    payment_out.csv   ${IDHeader}
						Input Field Window Input    C_PaymentAllocate0C_Invoice_ID    ${documentnoinv} 
						Click Toolbar Save
						Click Toolbar Parent
						Doc Action    Complete
						Check Document Status     Completed
                        END
 

Create Document SO to Payment
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                          ${start_index}=${1}    ${end_index}=${0}
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
                        # ${numbedsdr}  Set Variable    ${number}
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
	                    Close Current Tab
	                    ${IDHeader} =    Set Variable    ${csv[${j}][${start}]}
	                    Create Document Test    Sales Order   sales_order.csv     ${IDHeader}
                        ${documentnoso} =     Get Field Value    C_Order0DocumentNo
                        Check Document Status     Completed
                        Close Current Tab
                        Open Menu Create Record Save Test Create Line From    Shipment (Customer)      shipment.csv   ${documentnoso}       Sales Order         ${IDHeader}
						${documentnosh} =     Get Field Value    M_InOut0DocumentNo 
						Check Document Status     Completed
						Close Current Tab
                        Open Menu Create Record Save Test Create Line From    Invoice (Customer)      invoice_customer.csv   ${documentnosh}       Shipment         ${IDHeader}
						${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
						Check Document Status     Completed
						Close Current Tab
						Open Menu Create Record Save Test Payment    Payment In    payment_in.csv   ${IDHeader}
						Input Field Window Input    C_PaymentAllocate0C_Invoice_ID    ${documentnoinv} 
						Click Toolbar Save
						Click Toolbar Parent
						Doc Action    Complete
						Check Document Status     Completed
                        END               

Create Requisition Budget To Invoice   
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                                                                                         ${start_index}=${1}    ${end_index}=${0}
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
                        ${start2}=          Evaluate          ${start_indexheader} + 1 
                        # ${numbedsdr}  Set Variable    ${number}
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
	                    Refresh Page
	                    ${IDHeader} =    Set Variable     ${csv[${j}][${start}]}
	                    ${IDLine} =    Set Variable    ${csvline[${j}][${start_indexheader}]}
	                    ${product} =    Set Variable    ${csvline[${j}][${start_indexheader}]}
	                    ${productnone}=	                Run Keyword And Return Status	  Should Be Equal	${product}	    ${None}                           
	                    ${charge} =    Set Variable    ${csvline[${j}][${start2}]}	                    
	                    Create Document Test    Requisition   requisition.csv  ${IDHeader}
                        ${documentnoreq} =     Get Field Value    M_Requisition0DocumentNo
                        ${documentstatusreq} =     Get Field Value    M_Requisition0DocStatus 
                        ${doccompleted}    Set Variable     Completed                     
                        Run Keyword If    '${doccompleted}'=='${documentstatusreq}'    Check Document Status     Completed
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusreq}'     Close Current Tab
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusreq}'   Exampe Document Budgdet Status    ${documentnoreq}
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusreq}'   Close Current Tab First
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusreq}'   Doc Action         Complete
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusreq}'   Check Document Status         Completed
                        Click Posted
                        Close Current Tab First
                        SLEEP                            8
                        Close Current Tab
						Form Budget Info
						SLEEP                            8
						Close Current Tab  
						Refresh Page                      
						Create Document (Create Line From ASI) Test    Purchase Order    purchase_order.csv    ${documentnoreq}       Requisition      ${IDHeader}
                        ${documentnopo} =     Get Field Value    C_Order0DocumentNo
                        ${documentstatuspo} =     Get Field Value    C_Order0DocStatus
                        ${doccompleted}    Set Variable     Completed                     
                        Run Keyword If    '${doccompleted}'=='${documentstatuspo}'    Check Document Status     Completed
                        Run Keyword Unless    '${doccompleted}'=='${documentstatuspo}'     Close Current Tab
                        Run Keyword Unless    '${doccompleted}'=='${documentstatuspo}'   Exampe Document Budgdet Status    ${documentnopo}
                        Run Keyword Unless    '${doccompleted}'=='${documentstatuspo}'   Close Current Tab First
                        Run Keyword Unless    '${doccompleted}'=='${documentstatuspo}'   Doc Action         Complete
                        Run Keyword Unless    '${doccompleted}'=='${documentstatuspo}'   Check Document Status         Completed
                        Click Posted
                        Close Current Tab First
                        SLEEP                            8                        
                        Close Current Tab
						Form Budget Info
						SLEEP                            8
						Close Current Tab        
						Refresh Page                                           
						Run Keyword Unless       '${product}'==''        Create Document Header Select IDHeader    Material Receipt    material_receipt.csv    ${IDHeader}
					    Run Keyword Unless       '${product}'==''        Click Toolbar Save
					    Run Keyword Unless       '${product}'==''         Set Create Line From Partial    ${documentnopo}    Purchase Order  1
                        ${documentnomr} =    Run Keyword Unless       '${product}'==''         Get Field Value    M_InOut0DocumentNo     
                        Run Keyword Unless       '${product}'==''      Doc Action    Complete                      
                        Run Keyword Unless       '${product}'==''        Check Document Status     Completed
                        Run Keyword Unless       '${product}'==''        Close Current Tab
                        Run Keyword Unless       '${product}'==''        Refresh Page
                        Run Keyword Unless       '${product}'==''        Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    ${IDHeader}
					    Run Keyword Unless       '${product}'==''        Click Toolbar Save
					    Run Keyword Unless       '${product}'==''        Set Create Line From   ${documentnomr}       Receipt
                        Run Keyword Unless       '${product}'==''         Doc Action    Complete
                        Run Keyword If       '${product}'==''        Create Document Header Select IDHeader    Invoice (Vendor)      invoice_vendor.csv    ${IDHeader}
					    Run Keyword If       '${product}'==''        Click Toolbar Save
					    Run Keyword If       '${product}'==''        Set Create Line From   ${documentnopo}       Purchase Order					                       
                        Run Keyword If       '${product}'==''         Doc Action    Complete
                        # Run Keyword If       '${product}'==''        Open Menu Create Record Save Test Create Line From    Invoice (Vendor)      invoice_vendor.csv   ${documentnopo}       Purchase Order         ${IDHeader}
						${documentnoinv} =     Get Field Value    C_Invoice0DocumentNo 
                        ${documentstatusinv} =     Get Field Value    C_Invoice0DocStatus
                        ${doccompleted}    Set Variable     Completed                     
                        Run Keyword If    '${doccompleted}'=='${documentstatusinv}'    Check Document Status     Completed
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusinv}'     Close Current Tab
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusinv}'   Exampe Document Budgdet Status    ${documentnoinv}
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusinv}'   Close Current Tab First
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusinv}'   Doc Action         Complete
                        Run Keyword Unless    '${doccompleted}'=='${documentstatusinv}'   Check Document Status         Completed
						Close Current Tab
						Form Budget Info
						SLEEP                            8
                        END           
 
                                              
Create Document Select ID Save
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        Search Modul Name                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}             Click Toolbar Save                    
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}             Click Toolbar Detail
	                    ${ID} =    Set Variable    ${csv[${j}][${start}]}
	                    Run Keyword If     ${csv[${j}][${start}]}==${IDHead}            Input From CSV Save Line            ${csvline_name}                                      ${prefixline}                                       ${ID}                                                                      ${start_index}                                ${end_index}   
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}            Click Toolbar Parent
                        Run Keyword If     ${csv[${j}][${start}]}==${IDHead}            Doc Action    Complete
                        END

              
# Create Document Header Select IDHeader Open Search
                        # [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        # ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        # ${prefix} =                                         Get Prefix By Menu                                                              ${menu}
                        # @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        # ${csv_count} =                                      Get Length                                                                      ${csv}
                        # ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        # @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        # ${column_count} =                                   Get Length                                                                      ${columns}                   
                        # ${count}=           Evaluate      ${column_count} - 1
                        # ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        # ${start}=          Evaluate          ${start_indexheader} - 1 
                        # Search Modul Name                                           ${menu}                        
                        # FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        # ${IDHead} =   Set Variable   ${IDHeader}
                        # ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        # Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        # Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        # Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        # END   

Create Document Header Select IDHeader
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        Open Menu                                           ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END   
                        
Create Document Header Select IDHeader New
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu 2                                                             ${menu}
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
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END  
                        
Create Document Header No Search Menu
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END 
                                            
Create Document Header Select Open Menu IDHeader
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END   

Create Document Header Select Open Menu IDHeader New
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu 2                                                             ${menu}
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
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If     ${ID}==${IDHead}             SLEEP                    3
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END
                        
Create Document Header Search Menu IDHeader
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        Search Modul Name                                          ${menu}                        
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        # Run Keyword If     ${ID}==${IDHead}             SLEEP                    1
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END   
    
Create Document Header Search Menu IDHeader New
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu 2                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        Search Modul Name                                          ${menu}          
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        # Run Keyword If     ${ID}==${IDHead}             SLEEP                    1
                        Run Keyword If     ${ID}==${IDHead}             Click Toolbar New 
                        Run Keyword If     ${ID}==${IDHead}             Input Data                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        END   
                                                 
Create Line With IDHeader
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar New
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar Save      
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END  
                        
Create Line With IDHeader 2
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu 2                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar New
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar Save      
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END  
                        
Create Line With IDHeader New
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
                        ...                                                 ${tabname}=${None}                                                              ${csvline_name}=${None}                     ${value}=${None}                                                                              ${prefixline}=${None}                         ${start_index}=${1}    ${end_index}=${0}
                        ${prefix} =                                         Get Prefix By Menu 2                                                              ${menu}
                        @{csv} =                                            Read Csv File To List                                                           ${DATA_DIR}${/}${csv_name}
                        ${csv_count} =                                      Get Length                                                                      ${csv}
                        ${end_indexheader} =                                Set Variable If                                                           ${end_index}==${0}                                                                                                        ${csv_count}                                  ${end_index}
                        @{columns} =                                        Set Variable                                                                    ${csv[0]}
                        ${column_count} =                                   Get Length                                                                      ${columns}                   
                        ${count}=           Evaluate      ${column_count} - 1
                        ${start_indexheader} =                                Set Variable If                                                           ${start_index}==${0}                                                                                                        ${csv_count}                                  ${start_index}
                        ${start}=          Evaluate          ${start_indexheader} - 1 
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar New
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar Save      
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END  
                                               
Create Line With IDHeader For Condition Workflow
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar New
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If      ${ID}==${IDHead}             Input Operation Workflow
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar Save      
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END  

Create Line With IDHeader Avaible
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar New
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END  

Create Line Old With IDHeader
                        [Arguments]                                         ${menu}                                                                         ${csv_name}                                  ${IDHeader}                                                                            ${start_index}=${1}    ${end_index}=${0}
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
                        FOR    ${j}    IN RANGE                             ${start_index}                             ${end_indexheader}
                        ${IDHead} =   Set Variable   ${IDHeader}
                        ${ID} =   Set Variable   ${csv[${j}][${start}]}
                        Run Keyword If      ${ID}==${IDHead}             Input Data Line                                         ${csv[${j}]}                                                                    ${prefix}                          ${columns}                ${start_indexheader}            ${column_count}
                        Run Keyword If      ${ID}==${IDHead}             Click Toolbar Save      
                        # Run Keyword If      ${ID}==${IDHead}             Click Toolbar Parent                    
                        END                                   