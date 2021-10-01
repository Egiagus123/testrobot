*** Settings ***
Resource              ../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
#Test Teardown         Set Browser Implicit Wait     3 second
Suite Teardown        Logout
                        
*** Test Cases ***
Cost change will not change posted doc
    Set Browser Implicit Wait     5s
    Create Document Header Select IDHeader     Tax Number (Generate And Detail)       tax_number.csv   1000
#    Create Document Header Select IDHeader    Tax Number (Generate And Detail)   tax_number.csv     1000  

