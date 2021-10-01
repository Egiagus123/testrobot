*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Run Keywords        Login As Admin   AND   Today   AND   Yesterday 
Suite Teardown        Logout

*** Test Cases ***
Create Document Tax Number Detail
    [Tags]   ERP     Tax Number Detail
    [Documentation]    Tax Number Detail
    Create Document Header Select IDHeader   Tax Number (Generate And Detail)   tax_number.csv     1000  
    Input Valid From Tax Number Today
    Input Valid To Tax Number Today
    Click Toolbar Save                           
    Click Generate Tax Number
    Input Generate Prefix Field                     BHP12
    Input Generate Prefix Field                     FBA12
    Input Generate Start From Date Field            1
    Input Generate Finish To Date Field             10
    Click OK
    SLEEP                                           5
    Click Verivy Tax Number
    SLEEP                                            5
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Tax Number (Generate And Detail)   tax_number.csv     1001  
    Input Valid From Tax Number Today
    Input Valid To Tax Number Today
    Click Toolbar Save                           
    SLEEP                    5
    Click Generate Tax Number
    SLEEP                                           3
    Input Generate Prefix Field                     BHP12
    SLEEP                                            2
    Input Generate Prefix Field                     FBA12
    Input Generate Start From Date Field            1
    Input Generate Finish To Date Field             10
    Click OK
    Click Verivy Tax Number
    Close Current Tab
    Refresh Page
    Create Document Header Select IDHeader   Tax Number (Generate And Detail)   tax_number.csv     1002  
    Input Valid From Tax Number Today
    Input Valid To Tax Number Today
    Click Toolbar Save                           
    Click Generate Tax Number
    SLEEP                                           3
    Input Generate Prefix Field                     BHP12
    SLEEP                                            2
    Input Generate Prefix Field                     FBA12
    Input Generate Start From Date Field            1
    Input Generate Finish To Date Field             10
    Click OK
    Click Verivy Tax Number
    Close Current Tab
    Refresh Page
      