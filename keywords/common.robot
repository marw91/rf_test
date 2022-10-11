*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Start TestCase
	Close All Browsers
    open browser            http://adactinhotelapp.com/HotelAppBuild2/  headlesschrome   --disable-gpu  --no-sandbox  --disable-extensions  --disable-dev-shm-usage
    maximize browser window
Select from dropdown
    [Arguments]    ${name}    ${option}
	Click Element    xpath://select[@name=${name}]//option[@value=${option}]

Search for hotel with params
    [Arguments]    ${Location}    ${Hotels}=${EMPTY}    ${Roomtype}=${EMPTY}    ${NumberOfRooms}=${EMPTY}    ${Checkin}=${EMPTY}    ${Checkout}=${EMPTY}    ${adults}=${EMPTY}    ${childeren}=${EMPTY}
	Click Element     xpath://select[@name="location"]//option[@value=${Location}]
	Click Element     xpath://select[@name="hotels"]//option[@value=${Hotels}]
	Click Element     xpath://select[@name="room_type"]//option[@value=${Roomtype}]
	Click Element     xpath://select[@name="room_nos"]//option[@value=${NumberOfRooms}]
	Input Text        datepick_in    ${Checkin}    true
	Input Text        datepick_out   ${Checkout}    true
	Click Element     xpath://select[@name="adult_room"]//option[@value=${adults}]
	Click Element     xpath://select[@name="child_room"]//option[@value=${childeren}]

Select hotel from table
    [Arguments]    ${Hotel}  ${City}
    Click Element    xpath:(//form/table/tbody/tr[2]//tr[2]//input[@value="${Hotel}"]//..//..//input[@value="${City}"]//..//..//td)[1]//input

Verify total price of hotel
    [Arguments]    ${Hotel}    ${price}
    Element Text Should Be    xpath://form/table/tbody/tr[2]//tr[td/input[@value='${Hotel}']]//td[10]    AUD $ ${price}

Verify data in final screen
    [Arguments]    ${name}    ${location}    ${roomtype}    ${numberofrooms}    ${totaldays}    ${pricepernight}    ${totalprice}    ${gst}    ${finalprice}
    Wait Until Element Is Visible    xpath://*[@id="hotel_name_dis"]
	Element Should Contain    xpath://*[@id="hotel_name_dis"]    ${name}
	Element Should Contain    xpath://*[@id="location_dis"]      ${location}
	Element Should Contain    xpath://*[@id="room_type_dis"]     ${roomtype}
	Element Should Contain    xpath://*[@id="room_num_dis"]      ${numberofrooms}
	Element Should Contain    xpath://*[@id="total_days_dis"]    ${totaldays}
	Element Should Contain    xpath://*[@id="price_night_dis"]   ${pricepernight}
	Element Should Contain    xpath://*[@id="total_price_dis"]    ${totalprice}
	Element Should Contain    xpath://*[@id="gst_dis"]            ${gst}
	Element Should Contain    xpath://*[@id="final_price_dis"]    ${finalprice}
Fill in billing data
    [Arguments]    ${firstName}    ${lastName}    ${billing}    ${creditNumber}    ${cardType}    ${expireMonth}    ${expireYear}    ${cvv}
	Input Text    first_name      ${firstName}   
	Input Text    last_name       ${lastName}  
	Input Text    address         ${billing}  
	Input Text    cc_num          ${creditNumber}
	Click Element    xpath://select[@name="cc_type"]//option[@value="${cardType}"]
	Click Element    xpath://select[@name="cc_exp_month"]//option[@value=${expireMonth}]
	Click Element    xpath://select[@name="cc_exp_year"]//option[@value=${expireYear}]
	Input Text    cc_cvv          ${cvv}
Teardown
    Close All Browsers