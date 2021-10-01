*** Settings ***
Resource            libraries.robot
Resource            variables.robot
Resource            selenium_adapter.robot

Resource            login.robot
Resource            window.robot
Resource            menu.robot
Resource            utils.robot
Resource            createlinefrom.robot
Resource            process.robot
Resource            generate.robot
Resource            logout.robot

*** Keywords ***
Init
                    Set Log Level              ${LOGLEVEL}
                    Open Browser               ${LOGIN_URL}    ${BROWSER}
                    Maximize Browser Window
                    Set Selenium Speed         ${DELAY}

Destroy
                    Close Browser
