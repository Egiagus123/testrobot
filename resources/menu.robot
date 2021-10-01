*** Settings ***
Resource            libraries.robot
Resource            variables.robot
Resource            selenium_adapter.robot

*** Keywords ***
Open Menu
    [Arguments]               ${menu}
    Input Field               css:.global-search-box input                                              ${menu}                                   is_key_enter=${false}
    Wait for Element          sizzle=.global-search-tabpanel .z-listcell-content:contains("${menu}")
    Press Enter               None
    Wait for Element          sizzle=.desktop-tabbox .z-tab-text:contains("${menu}")
    # Handle find window if High Volume
    ${exists} =               Is Element Exists                                                         css:.find-window .z-south-body .btn-ok
    Run Keyword If            ${exists}                                                                 Click                                     css:.find-window .z-south-body .btn-ok

Search Modul Name
    [Arguments]                                 ${search_modul}
    Wait for Element                            sizzle=.global-search-box.z-bandbox .z-bandbox-input                                                  
    Input Text                                  sizzle=.global-search-box.z-bandbox .z-bandbox-input                                                   ${search_modul}
    SLEEP                                       2
    Press Keys                                  sizzle=.global-search-box.z-bandbox .z-bandbox-input                      RETURN  
    Set Global Variable                         ${search_modul}
    
Check Product Info From Quotation
    [Arguments]                                         ${menu}                    ${valueproduct}
    Open Menu                                           ${menu}                        
    Click Toolbar Product Info
    SLEEP                                       5
    Input Text                                  sizzle=tr:contains("Value") input[class="z-textbox"]:nth(0)            ${valueproduct}  
    Click                                       sizzle=button[class="img-btn btn-refresh z-button"]

Search Document
    [Arguments]                                         ${menu}                    ${value}
    Open Menu                                           ${menu}
    Open Search Document No                            ${value}

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
    
  