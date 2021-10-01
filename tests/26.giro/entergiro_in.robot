*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          GiroManagement
Suite Setup           Login As Admin
#Test Teardown         Set Browser Implicit Wait      3 second
Suite Teardown        Logout

*** Test Cases ***
Skenario 1
    [Tags]    ERP-1304,1305,1306,1323,1386
    [Documentation]    Create enter giro in
    
    #1 STANDAR CASE = CREATE NEW DOCUMENT :: HEADER ONLY - COMPLETE IT - AND POST IT
    Create Document Header Select IDHeader        Enter Giro (In)            entergiro_in.csv                1002
    Global Input Field                            C_Payment0DateTrx          01/21/2020
    Global Input Field                            C_Payment0DateLiquid       01/21/2020
    ${BilyetGiroNo} =     Get Field Value         C_Payment0CheckNo
    Click Toolbar Save
    Doc Action                                    Complete
    Check Document Status                         Completed     
    Click Posted
    Close Current Tab
    
    #2 CREATE NEW DOCUMENT WITH ERROR DUPLICATE MESSAGE
    Create Document Header No Search Menu         Enter Giro (In)            entergiro_in.csv                1002    
    Global Input Field                            C_Payment0DateTrx          01/21/2020 
    Global Input Field                            C_Payment0DateLiquid       01/21/2020
    Click Toolbar Save
    Validate Error Message                        Error: ERP-1386 Duplicate Check No: ${BilyetGiroNo}
    Click Toolbar Undo
    
    #3 STANDAR CASE = CREATE NEW DOCUMENT :: HEADER ONLY - COMPLETE IT - AND POST IT
    Create Document Header No Search Menu        Enter Giro (In)                entergiro_in.csv                1003
    Global Input Field                            C_Payment0DateTrx              01/01/2020 
    Global Input Field                            C_Payment0DateLiquid           01/20/2020
    ${BilyetGiroNo2} =                            Get Field Value                C_Payment0CheckNo
    Click Toolbar Save
    ${documentno} =                               Get Field Value                C_Payment0DocumentNo
    Set Global Variable                           ${documentno}
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Close Current Tab
         
    #4 CREATE WITH ERROR DUPLICATE
    Create Document Header No Search Menu         Enter Giro (In)                entergiro_in.csv                1003    
    Global Input Field                            C_Payment0DateTrx              01/01/2020 
    Global Input Field                            C_Payment0DateLiquid           01/20/2020
    Click Toolbar Save
    Validate Error Message                        Error: ERP-1386 Duplicate Check No: ${BilyetGiroNo2}
    Click Toolbar Undo
    
    #5 STANDAR CASE = CREATE DOCUMENT :: HEADER ONLY - COMPLETE IT - AND POST IT
    Create Document Header No Search Menu         Enter Giro (In)                entergiro_in.csv                1004
    Global Input Field                            C_Payment0DateTrx              01/01/2020 
    Global Input Field                            C_Payment0DateLiquid           01/20/2020
    Click Toolbar Save
    ${documentno2} =                              Get Field Value                C_Payment0DocumentNo
    Set Global Variable                           ${documentno2}
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Close Current Tab
    Refresh Page

   
    #VERIFIED ENTER GIRO IN :: USE POST GIRO IN
    Search Modul Name                             Pick Giro (In)
    Form Validate Giro                            01/01/2020                     01/20/2020                       AUTOMATION_COBA                                     
    
    #CHECK DOCUMENT ENTER GIRO AND MAKE SURE CHECKBOX VALIDATE CHECKED 
    Search Document                               Enter Giro (In)                ${documentno}
    Scroll To Buttom Header Frame
    Open Search Document No                       ${documentno2}
    Scroll To Buttom Header Frame
    Close Current Tab
    
    #UNVERIFIED DOC(S) VERIFIED :: USE POST GIRO IN
    Click Tab                                     Pick Giro In
    Click Checkbox Set                            Verified                       0
    Click Refresh Button
    Click Select CheckBox Line List Form          0
    Click UnGenerate Process
    Global Input Field                            DocAction                      Reverse - Accrual
    Click OK
    Click Button Checklist Ok Form
    
    #CHECK STATUS DOCUMENT ENTER GIRO SHOULD BE REVERSED
    Search Document                               Enter Giro (In)                ${documentno}
    Scroll To Buttom Header Frame   
    Refresh Page

    
    #STANDAR CASE = CREATE NEW DOCUMENT :: POST GIRO IN
    Create Document Header Select IDHeader        Post Giro (In)                 postgiro_in.csv                1000
    Click Toolbar Save
    ${documentno3} =                              Get Field Value                BHP_BankStatement0DocumentNo
    Global Input Field                            BHP_BankStatement0DatePost     01/20/2020    
    Doc Action                                    Complete
    Check Document Status                         Completed
    Click Posted
    Refresh Page
    
    #CHECK CHECKBOX MATURNITY ENTER GIRO (IN) CHECKED
    Search Document                               Enter Giro (In)                ${documentno2}
    Scroll To Buttom Header Frame
    Close Current Tab
    
    #CHANGE AND CHECK STATUS DOCUMENT POST GIRO (IN)
    Search Document                               Post Giro (In)                ${documentno3}
    Doc Action                                    Re-activate
    Check Document Status                         In Progress
    Scroll To Buttom Header Frame
    SLEEP                                         1
    Doc Action                                    Void
    Check Document Status                         Voided
    Close Current Tab
    
    #CHECK CHECKBOX MATURNITY ENTER GIRO (IN) UNCHECKED
    Search Document                               Enter Giro (In)                ${documentno2}
    Scroll To Buttom Header Frame