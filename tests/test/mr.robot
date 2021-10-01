*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          GiroManagement
Suite Setup           Login As Admin
Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Skenario 1
    [Tags]    ERP-1304,1305,1306,1323,1386
    [Documentation]    Create enter giro in
    
    #1 STANDAR CASE = CREATE NEW DOCUMENT :: HEADER ONLY - COMPLETE IT - AND POST IT
    Create Document Header Select IDHeader        Enter Giro (In)            entergiro_in.csv                1002
    Global Input Field                            C_Payment0DateTrx          01/23/2020
    Global Input Field                            C_Payment0DateLiquid       01/23/2020
    ${BilyetGiroNo} =     Get Field Value         C_Payment0CheckNo
    Click Toolbar Save
    Doc Action                                    Complete
    Check Document Status                         Completed     
    Click Posted
    Sleep                                         3
    Close Current Tab
    
    #2 CREATE NEW DOCUMENT WITH ERROR DUPLICATE MESSAGE
    Create Document Header No Search Menu         Enter Giro (In)            entergiro_in.csv                1002    
    Global Input Field                            C_Payment0DateTrx          01/23/2020 
    Global Input Field                            C_Payment0DateLiquid       01/23/2020
    Click Toolbar Save
    Validate Error Message                        Error: ERP-1386 Duplicate Check No: ${BilyetGiroNo}
    SLEEP                                         3
    Click Toolbar Undo