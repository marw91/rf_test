*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Login with credentials
    [Arguments]       ${UserName}    ${Password}
    Wait Until Element Is Visible    xpath://*[@id="username"]
    Input Text                       xpath://input[@id="username"]    ${UserName}    true
    Input Text                       xpath://input[@id="password"]    ${Password}    true
    Click Element                    xpath://*[@id="login"]

Verify login was succesfull
    Wait Until Element Is Visible    xpath://td[@class="welcome_menu"][1]
    Element Should Contain           xpath://td[@class="welcome_menu"][1]    Welcome to Adactin Group of Hotels
    Element Should Be Visible        xpath://a[text()="Logout"]