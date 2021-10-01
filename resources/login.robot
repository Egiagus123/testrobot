*** Settings ***
Resource              libraries.robot
Resource              variables.robot
Resource              selenium_adapter.robot

*** Keywords ***
Login
                      [Arguments]                          ${username}=${SUPERUSER.USERNAME}
                      ...                                  ${password}=${SUPERUSER.PASSWORD}
                      ...                                  ${client}=${LOGIN_INFO.CLIENT}
                      ...                                  ${role}=${LOGIN_INFO.ROLE}
                      ...                                  ${organization}=${LOGIN_INFO.ORGANIZATION}
                      ...                                  ${warehouse}=${LOGIN_INFO.WAREHOUSE}

                      Element Should Exists                css:.login-window
                      Input Field                          css:#rowUser input                                        ${username}                       is_key_enter=${false}
                      Input Field                          css:#rowPassword input                                    ${password}                       is_key_enter=${false}
                      # Set Checkbox                         css:#rowSelectRole input                                  Y
                      Set Checkbox                         sizzle=[class="checkbox-selectrole z-checkbox"] input       Y  
                      Click                                sizzle=.login-btn.z-button:contains("OK")
                      Input Field                          css:#rowclient input                                      ${client}
                      Input Field                          css:#rowRole input                                        ${role}
                      Input Field                          css:#rowOrganisation input                                ${organization}
                      Input Field                          css:#rowWarehouse input                                   ${warehouse}
                      Click                                sizzle=.login-btn.z-button:contains("OK")

# Logout
                      # Element Should Exists                css:.desktop-user-panel
                      # Click                                css:.desktop-user-panel
                      # Wait for Element                     css:.menuPopup
                      # Click                                sizzle=.menuPopup .z-menuitem-text:contains("Log Out")
                      # # Handle pop-up records not saved
                      # ${exists}                            Is Element Exists                                         css=.popup-dialog .btn-ok
                      # Run Keyword If                       ${exists}                                                 Click                             css=.popup-dialog .btn-ok


Login As SuperUser
                      Login                                username=${SUPERUSER.USERNAME}                            password=${SUPERUSER.PASSWORD}

Login As Admin
                      Login                                username=${ADMIN.USERNAME}                                password=${ADMIN.PASSWORD}
