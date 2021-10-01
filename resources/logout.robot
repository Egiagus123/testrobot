*** Settings ***
Resource                libraries.robot
Resource                variables.robot
Resource                selenium_adapter.robot
Resource                utils.robot
Resource                window.robot
Resource                createlinefrom.robot
Resource                process.robot   


*** Variables ***
${LOGWINDOW} =          logout.

*** Keywords ***
Logout
                     # ${cancel} =                                  Is Element Exists                  sizzle=[title="OK"]
                     # ${cancel3} =                                  Is Element Exists                  sizzle=button:contains("OK")                     
                     # ${cancel2} =                                  Is Element Exists                  sizzle=[title="OK"]:nth(1)
                     # ${cancel4} =                                  Is Element Exists                  sizzle=button:contains("OK"):nth(1) 
                     # Run Keyword If                    ${cancel}           Click Ok PopUp
                     # Run Keyword If                    ${cancel2}           Click Ok PopUp New
                     # Run Keyword If                    ${cancel3}            Click OK
                     # Run Keyword If                    ${cancel4}            Click OK New
				     Click User
				     Click Log Out                        				     