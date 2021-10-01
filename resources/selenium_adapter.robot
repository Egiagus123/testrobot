*** Settings ***
Resource                 libraries.robot
Resource                 variables.robot
Resource                 utils.robot

*** Variables ***
${LOGNAME} =             selenium_adapter.
${LOADING_SELECTOR} =    css:.z-loading-indicator

*** Keywords ***
Wait Loading End
                         Wait Until Page Does Not Contain Element    ${LOADING_SELECTOR}

Is Element Exists
                         [Arguments]                                 ${selector}
                         Wait Loading End
                         ${count} =                                  Get Element Count                                       ${selector}
                         ${exists} =                                 Set Variable If                                         ${count}>0            ${true}                    ${false}
                         [Return]                                    ${exists}

Element Should Exists
                         [Arguments]                                 ${selector}
                         Wait Loading End
                         Page Should Contain Element                 ${selector}

Wait for Element
                         [Arguments]                                 ${selector}
                         Wait Loading End
                         Wait Until Page Contains Element            ${selector}
                         Wait Until Element Is Visible               ${selector}

Press Enter
                         [Arguments]                                 ${selector}
                         Press Keys                                  ${selector}                                             RETURN

Input Field
                         [Arguments]                                 ${selector}                                             ${value}              ${is_key_enter}=${true}
                         Logger                                      ${LOGNAME}Input Field ${selector}, value = ${value}     DEBUG
                         Wait for Element                            ${selector}
                         #Scroll Element Into View                   ${selector}
                         Clear Element Text                          ${selector}
                         Wait for Element                            ${selector}
                         Input Text                                  ${selector}                                             ${value}
                         Run Keyword If                              ${is_key_enter}                                         Press Enter           ${selector}

Input Field With Error
                         [Arguments]                                 ${selector}                                             ${value}              ${is_key_enter}=${true}
                         Logger                                      ${LOGNAME}Input Field ${selector}, value = ${value}     DEBUG
                         Wait for Element                            ${selector}
                         #Scroll Element Into View                   ${selector}
                         Clear Element Text                          ${selector}
                         Click Button Checklist Ok Form
                         Wait for Element                            ${selector}
                         Input Text                                  ${selector}                                             ${value}
                         Run Keyword If                              ${is_key_enter}                                         Press Enter           ${selector}

Input Field New
    [Arguments]                                  ${selector}                                             ${value}
    Wait Until Page Does Not Contain Element    Xpath=//div[@class="z-loading-indicator"]             timeout=30
    Wait Until Element Is Visible               ${selector}        timeout=5
    Input Text                                  ${selector}                                             ${value}
    Press Key                                  ${selector}         \\13

Input Field PopUp
                         [Arguments]                                 ${selector}                                             ${value}              ${is_key_enter}=${true}
                         Logger                                      ${LOGNAME}Input Field ${selector}, value = ${value}     DEBUG
                         Wait for Element                            ${selector}
                         #Scroll Element Into View                   ${selector}
                         Clear Element Text                          ${selector}
                         Wait for Element                            ${selector}
                         Input Text                                  ${selector}                                             ${value}
                         Run Keyword If                              ${is_key_enter}                                         Press Enter           ${selector}

Set Checkbox
                         [Arguments]                                 ${selector}                                             ${value}
                         Logger                                      ${LOGNAME}Set Checkbox ${selector}, value = ${value}    DEBUG
                         Wait for Element                            ${selector}
                         Run Keyword If                              "${value}"=="Y"                                         Select Checkbox       ${selector}
                         Run Keyword If                              not "${value}"=="Y"                                     Unselect Checkbox     ${selector}

Click
                         [Arguments]                                 ${selector}
                         Logger                                      ${LOGNAME}Click ${selector}                             DEBUG
                         Wait for Element                            ${selector}
                         Click Element                               ${selector}

Get Element Value
                         [Arguments]                                 ${selector}
                         Logger                                      ${LOGNAME}Get Element Value ${selector}                 DEBUG
                         Wait for Element                            ${selector}
                         ${value} =                                  Get Element Attribute                                   ${selector}           value
                         Logger                                      ${LOGNAME}Value = ${value}                              DEBUG
                         [Return]                                    ${value}

Get Class Value
                         [Arguments]                                 ${selector}
                         Logger                                      ${LOGNAME}Get Class Value ${selector}                   DEBUG
                         Wait for Element                            ${selector}
                         ${value} =                                  Get Element Attribute                                   ${selector}           class
                         Logger                                      ${LOGNAME}Value = ${value}                              DEBUG
                         [Return]                                    ${value}

Get Checkbox Value
                         [Arguments]                                 ${selector}
                         Logger                                      ${LOGNAME}Get Checkbox Value ${selector}                DEBUG
                         Wait for Element                            ${selector}
                         ${value} =                                  Get Element Attribute                                   ${selector}           checked
                         Logger                                      ${LOGNAME}Value = ${value}                              DEBUG
                         ${checked} =                                Set Variable If                                         '${value}'=='true'    ${True}                    ${False}
                         Logger                                      ${LOGNAME}Checked = ${checked}                          DEBUG
                         [Return]                                    ${checked}

Click User
                         Wait Until Element Is Visible               Xpath=(//span[@class="z-menu-text"])[1]                                      timeout=15
                         Click Element                               Xpath=(//span[@class="z-menu-text"])[1]

Click Log Out
                         Wait Until Element Is Visible               sizzle=.z-menuitem-text:contains("Log Out")                                     timeout=15
                         Click Element                               sizzle=.z-menuitem-text:contains("Log Out")

