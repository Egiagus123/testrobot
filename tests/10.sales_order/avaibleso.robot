*** Settings ***
Resource              ../../resources/idempiere.robot
Default Tags          Inventory
Suite Setup           Login As Admin
Suite Teardown        Logout

*** Test Cases ***
Create Document Partial Receipt From PO
    [Tags]    ERP    PO
    [Documentation]    Create Partial Receipt From PO
    # Set Browser Implicit Wait      1s
    # Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    # Click Toolbar Save
    # Click Toolbar Detail
    # Create Line With IDHeader Avaible    Sales OrderLine    sales_orderline.csv    1002
    # # Click Ok PopUp
    # Click Toolbar Parent
    # ${salesorder1no} =     Get Field Value    C_Order0DocumentNo
    # Doc Action    Complete
    # Check Document Status     Completed
    # Close Current Tab  
    # Refresh Page
    # Create Document Header Select IDHeader   Sales Order   sales_order.csv      1000
    # Click Toolbar Save
    # Click Toolbar Detail
    # Create Line With IDHeader    Sales OrderLine    sales_orderline.csv    1000
    # Click Toolbar Parent
    # ${salesorder2no} =     Get Field Value    C_Order0DocumentNo
    # Doc Action    Complete
    # Check Document Status     Completed
    # Close Current Tab  