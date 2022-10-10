*** Settings ***
Library         SeleniumLibrary
Library    XML
Resource        ../keywords/common.robot
Resource        ../keywords/login.robot
Suite Setup     Start TestCase
# Suite Teardown  Teardown

*** Variables ***
${UserName}     Mwiendels
${Password}     7S13MP

*** Test Cases ***
### Opdracht 1 ###
Login to website with correct username and Password and verify login was succesfull
    Login with credentials    ${UserName}    ${Password}
    Verify login was succesfull

Search for hotel
    Search for hotel with params    "Sydney"    "Hotel Creek"    "Double"    2    16/09/2022    18/09/2022    2    1
    Click Button                    Submit
Select hotel and verify price
    Wait Until Element Is Visible        xpath:(//form/table/tbody/tr[2]//tr[2]//input[@value="Hotel Creek"]//..//..//input[@value="Sydney"]//..//..//td)//..//..//tr[2]
    Select hotel from table                Hotel Creek    Sydney
    Element Attribute Value Should Be      total_price_0    value    AUD $ 900
    # Verify total price of hotel    Hotel Creek    900    #### RETURNS EMPTY 

Navigate to next stage
    Click Button    continue

### opdracht 4 ###



